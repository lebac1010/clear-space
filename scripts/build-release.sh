#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

NO_CLEAN=false
ANALYZE=false
OBFUSCATE=false
NO_INCREMENT_BUILD_NUMBER=false
NO_PUB_GET=false
EXTRA_ARGS=()

usage() {
  cat <<'EOF'
Usage: scripts/build-release.sh [options] [-- flutter_build_args...]

Options:
      --no-clean                 Skip flutter clean before build
  -a, --analyze                  Run flutter analyze before build
  -o, --obfuscate                Build with --obfuscate and split debug info
      --no-increment-build-number Skip automatic pubspec version code increment
  --no-pub-get               Skip flutter pub get
  -h, --help                     Show this help message
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-clean)
      NO_CLEAN=true
      shift
      ;;
    -a|--analyze)
      ANALYZE=true
      shift
      ;;
    -o|--obfuscate)
      OBFUSCATE=true
      shift
      ;;
    --no-increment-build-number)
      NO_INCREMENT_BUILD_NUMBER=true
      shift
      ;;
    --no-pub-get)
      NO_PUB_GET=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while [[ $# -gt 0 ]]; do
        EXTRA_ARGS+=("$1")
        shift
      done
      ;;
    *)
      EXTRA_ARGS+=("$1")
      shift
      ;;
  esac
done

step() { echo -e "\n${CYAN}==> $1${NC}"; }
ok() { echo -e "${GREEN}[OK] $1${NC}"; }
fail() { echo -e "${RED}[ERROR] $1${NC}"; }
warn() { echo -e "${YELLOW}[WARN] $1${NC}"; }
trim() {
  local value="$1"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf '%s' "${value}"
}
get_prop() {
  local key="$1"
  local file="$2"
  [[ -f "${file}" ]] || return 0
  awk -F'=' -v k="${key}" '
    /^[[:space:]]*#/ { next }
    /^[[:space:]]*!/ { next }
    /^[[:space:]]*$/ { next }
    {
      keyPart=$1
      sub(/^[[:space:]]+/, "", keyPart)
      sub(/[[:space:]]+$/, "", keyPart)
      if (keyPart == k) {
        value = substr($0, index($0, "=") + 1)
        sub(/^[[:space:]]+/, "", value)
        sub(/[[:space:]]+$/, "", value)
        print value
        exit
      }
    }
  ' "${file}"
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
APP_DIR="${REPO_ROOT}"
PUBSPEC_PATH="${APP_DIR}/pubspec.yaml"
KEY_PROPERTIES_PATH="${APP_DIR}/android/key.properties"
AAB_PATH="${APP_DIR}/build/app/outputs/bundle/release/app-release.aab"
ARTIFACT_DIR="${REPO_ROOT}/artifacts/playstore"
DEBUG_SYMBOLS_DIR="${ARTIFACT_DIR}/debug-symbols"

if [[ ! -f "${PUBSPEC_PATH}" ]]; then
  fail "Cannot find pubspec.yaml at ${PUBSPEC_PATH}"
  exit 1
fi

echo
echo -e "${MAGENTA}============================================${NC}"
echo -e "${MAGENTA}  Clean Master Space - Android Release Builder${NC}"
echo -e "${MAGENTA}============================================${NC}"

step "Checking signing config"
prop_store_file="$(trim "$(get_prop storeFile "${KEY_PROPERTIES_PATH}")")"
prop_store_password="$(trim "$(get_prop storePassword "${KEY_PROPERTIES_PATH}")")"
prop_key_alias="$(trim "$(get_prop keyAlias "${KEY_PROPERTIES_PATH}")")"
prop_key_password="$(trim "$(get_prop keyPassword "${KEY_PROPERTIES_PATH}")")"

resolved_store_file="${prop_store_file:-$(trim "${CMS_UPLOAD_STORE_FILE:-}")}"
resolved_store_password="${prop_store_password:-$(trim "${CMS_UPLOAD_STORE_PASSWORD:-}")}"
resolved_key_alias="${prop_key_alias:-$(trim "${CMS_UPLOAD_KEY_ALIAS:-}")}"
resolved_key_password="${prop_key_password:-$(trim "${CMS_UPLOAD_KEY_PASSWORD:-}")}"

missing=()
[[ -z "${resolved_store_file}" ]] && missing+=("storeFile/CMS_UPLOAD_STORE_FILE")
[[ -z "${resolved_store_password}" ]] && missing+=("storePassword/CMS_UPLOAD_STORE_PASSWORD")
[[ -z "${resolved_key_alias}" ]] && missing+=("keyAlias/CMS_UPLOAD_KEY_ALIAS")
[[ -z "${resolved_key_password}" ]] && missing+=("keyPassword/CMS_UPLOAD_KEY_PASSWORD")

if [[ ${#missing[@]} -gt 0 ]]; then
  fail "Release signing is missing."
  echo "Provide one of the following:"
  echo "  - ${KEY_PROPERTIES_PATH}"
  echo "  - CMS_UPLOAD_STORE_FILE, CMS_UPLOAD_STORE_PASSWORD, CMS_UPLOAD_KEY_ALIAS, CMS_UPLOAD_KEY_PASSWORD"
  printf 'Missing fields: %s\n' "$(IFS=', '; echo "${missing[*]}")"
  exit 1
fi

if [[ -f "${KEY_PROPERTIES_PATH}" ]]; then
  ok "Using android/key.properties (with env fallback for empty fields)"
else
  ok "Using CMS_UPLOAD_* environment variables"
fi

if [[ "${NO_INCREMENT_BUILD_NUMBER}" == false ]]; then
  step "Incrementing build number in pubspec.yaml"
  version_line="$(grep -E '^version:' "${PUBSPEC_PATH}" || true)"
  if [[ "${version_line}" =~ ^version:[[:space:]]*([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+) ]]; then
    version_name="${BASH_REMATCH[1]}"
    version_code="${BASH_REMATCH[2]}"
    new_version="version: ${version_name}+$((version_code + 1))"
    tmp_file="$(mktemp)"
    awk -v replacement="${new_version}" '
      BEGIN { done = 0 }
      /^version:/ && done == 0 { print replacement; done = 1; next }
      { print }
    ' "${PUBSPEC_PATH}" > "${tmp_file}"
    mv "${tmp_file}" "${PUBSPEC_PATH}"
    ok "Updated to ${new_version}"
  else
    fail "Could not parse version in pubspec.yaml"
    exit 1
  fi
fi

cd "${APP_DIR}"

if [[ "${NO_CLEAN}" == false ]]; then
  step "Running flutter clean"
  flutter clean
fi

if [[ "${NO_PUB_GET}" == false ]]; then
  step "Running flutter pub get"
  flutter pub get
fi

if [[ "${ANALYZE}" == true ]]; then
  step "Running flutter analyze"
  flutter analyze
fi

step "Building release appbundle"
build_args=(build appbundle --release)
if [[ "${OBFUSCATE}" == true ]]; then
  mkdir -p "${DEBUG_SYMBOLS_DIR}"
  build_args+=(--obfuscate "--split-debug-info=${DEBUG_SYMBOLS_DIR}")
  warn "Obfuscation enabled; keep debug symbols safe: ${DEBUG_SYMBOLS_DIR}"
fi
build_args+=("${EXTRA_ARGS[@]}")

flutter "${build_args[@]}"

if [[ ! -f "${AAB_PATH}" ]]; then
  fail "AAB not found: ${AAB_PATH}"
  exit 1
fi

mkdir -p "${ARTIFACT_DIR}"
version_line="$(grep -E '^version:' "${PUBSPEC_PATH}" || true)"
build_name="unknown"
build_code="0"
if [[ "${version_line}" =~ ^version:[[:space:]]*([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+) ]]; then
  build_name="${BASH_REMATCH[1]}"
  build_code="${BASH_REMATCH[2]}"
fi

timestamp="$(date +%Y%m%d_%H%M%S)"
target_file="${ARTIFACT_DIR}/cleanmasterspace-v${build_name}-${build_code}-${timestamp}.aab"
cp -f "${AAB_PATH}" "${target_file}"

echo
ok "Build complete"
echo -e "${YELLOW}AAB: ${target_file}${NC}"
