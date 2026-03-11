<#
.SYNOPSIS
    Build Android App Bundle (.aab) for Google Play upload.

.DESCRIPTION
    Builds a signed release AAB for Clean Master Space.
    Signing is loaded from:
    1) android/key.properties, or
    2) Environment variables:
       CMS_UPLOAD_STORE_FILE
       CMS_UPLOAD_STORE_PASSWORD
       CMS_UPLOAD_KEY_ALIAS
       CMS_UPLOAD_KEY_PASSWORD

.PARAMETER Clean
    Run flutter clean before build.

.PARAMETER Analyze
    Run flutter analyze before build.

.PARAMETER Obfuscate
    Enable Dart obfuscation and emit debug symbols.

.PARAMETER IncrementBuildNumber
    Increment pubspec version build number (+N) before build.

.PARAMETER NoPubGet
    Skip flutter pub get.
#>

param(
    [switch]$Clean,
    [switch]$Analyze,
    [switch]$Obfuscate,
    [switch]$IncrementBuildNumber,
    [switch]$NoPubGet
)

$ErrorActionPreference = "Stop"

function Write-Step([string]$Message) { Write-Host "`n==> $Message" -ForegroundColor Cyan }
function Write-Success([string]$Message) { Write-Host "[OK] $Message" -ForegroundColor Green }
function Write-Fail([string]$Message) { Write-Host "[ERROR] $Message" -ForegroundColor Red }
function Write-Warn([string]$Message) { Write-Host "[WARN] $Message" -ForegroundColor Yellow }

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir
$appDir = $repoRoot
$pubspecPath = Join-Path $appDir "pubspec.yaml"
$keyPropertiesPath = Join-Path $appDir "android\key.properties"
$aabPath = Join-Path $appDir "build\app\outputs\bundle\release\app-release.aab"
$artifactDir = Join-Path $repoRoot "artifacts\playstore"
$debugSymbolsDir = Join-Path $artifactDir "debug-symbols"

function Get-KeyPropertiesMap([string]$Path) {
    $map = @{}
    if (-not (Test-Path $Path)) { return $map }

    foreach ($rawLine in Get-Content -Path $Path) {
        $line = $rawLine.Trim()
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        if ($line.StartsWith("#") -or $line.StartsWith("!")) { continue }
        $eq = $line.IndexOf("=")
        if ($eq -lt 0) { continue }
        $key = $line.Substring(0, $eq).Trim()
        $value = $line.Substring($eq + 1).Trim()
        if (-not [string]::IsNullOrWhiteSpace($key)) {
            $map[$key] = $value
        }
    }
    return $map
}

function Resolve-SigningValue([string]$FileValue, [string]$EnvValue) {
    if (-not [string]::IsNullOrWhiteSpace($FileValue)) { return $FileValue.Trim() }
    if (-not [string]::IsNullOrWhiteSpace($EnvValue)) { return $EnvValue.Trim() }
    return $null
}

if (-not (Test-Path $pubspecPath)) {
    Write-Fail "Cannot find pubspec.yaml at $pubspecPath"
    exit 1
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Magenta
Write-Host "  Clean Master Space - Android Release Builder" -ForegroundColor Magenta
Write-Host "============================================" -ForegroundColor Magenta

Write-Step "Checking signing config"
$hasKeyProps = Test-Path $keyPropertiesPath
$props = Get-KeyPropertiesMap -Path $keyPropertiesPath

$resolvedStoreFile = Resolve-SigningValue $props["storeFile"] $env:CMS_UPLOAD_STORE_FILE
$resolvedStorePassword = Resolve-SigningValue $props["storePassword"] $env:CMS_UPLOAD_STORE_PASSWORD
$resolvedKeyAlias = Resolve-SigningValue $props["keyAlias"] $env:CMS_UPLOAD_KEY_ALIAS
$resolvedKeyPassword = Resolve-SigningValue $props["keyPassword"] $env:CMS_UPLOAD_KEY_PASSWORD

$missingSigning = @()
if ([string]::IsNullOrWhiteSpace($resolvedStoreFile)) { $missingSigning += "storeFile/CMS_UPLOAD_STORE_FILE" }
if ([string]::IsNullOrWhiteSpace($resolvedStorePassword)) { $missingSigning += "storePassword/CMS_UPLOAD_STORE_PASSWORD" }
if ([string]::IsNullOrWhiteSpace($resolvedKeyAlias)) { $missingSigning += "keyAlias/CMS_UPLOAD_KEY_ALIAS" }
if ([string]::IsNullOrWhiteSpace($resolvedKeyPassword)) { $missingSigning += "keyPassword/CMS_UPLOAD_KEY_PASSWORD" }

if ($missingSigning.Count -gt 0) {
    Write-Fail "Release signing is missing."
    Write-Host "Provide one of the following:"
    Write-Host "  - $keyPropertiesPath"
    Write-Host "  - CMS_UPLOAD_* environment variables"
    Write-Host "Missing fields: $($missingSigning -join ', ')"
    exit 1
}

if ($hasKeyProps) {
    Write-Success "Using android/key.properties"
} else {
    Write-Success "Using CMS_UPLOAD_* environment variables"
}

Set-Location $appDir

if ($IncrementBuildNumber) {
    Write-Step "Incrementing build number in pubspec.yaml"
    $pubspec = Get-Content $pubspecPath -Raw
    if ($pubspec -notmatch 'version:\s*([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+)') {
        Write-Fail "Could not parse version in pubspec.yaml"
        exit 1
    }
    $versionName = $Matches[1]
    $versionCode = [int]$Matches[2]
    $newVersion = "version: $versionName+$($versionCode + 1)"
    $pubspec = $pubspec -replace 'version:\s*[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+', $newVersion
    Set-Content -Path $pubspecPath -Value $pubspec -NoNewline
    Write-Success "Updated to $newVersion"
}

if ($Clean) {
    Write-Step "Running flutter clean"
    flutter clean
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

if (-not $NoPubGet) {
    Write-Step "Running flutter pub get"
    flutter pub get
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

if ($Analyze) {
    Write-Step "Running flutter analyze"
    flutter analyze
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

Write-Step "Building release appbundle"
$buildArgs = @("build", "appbundle", "--release")
if ($Obfuscate) {
    New-Item -ItemType Directory -Path $debugSymbolsDir -Force | Out-Null
    $buildArgs += "--obfuscate"
    $buildArgs += "--split-debug-info=$debugSymbolsDir"
    Write-Warn "Obfuscation enabled; keep debug symbols safe: $debugSymbolsDir"
}

flutter @buildArgs
if ($LASTEXITCODE -ne 0) {
    Write-Fail "flutter build appbundle failed"
    exit $LASTEXITCODE
}

if (-not (Test-Path $aabPath)) {
    Write-Fail "AAB not found: $aabPath"
    exit 1
}

New-Item -ItemType Directory -Path $artifactDir -Force | Out-Null
$pubspecFinal = Get-Content $pubspecPath -Raw
$buildName = "unknown"
$buildCode = "0"
if ($pubspecFinal -match 'version:\s*([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+)') {
    $buildName = $Matches[1]
    $buildCode = $Matches[2]
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$targetFile = Join-Path $artifactDir "cleanmasterspace-v$buildName-$buildCode-$timestamp.aab"
Copy-Item -Path $aabPath -Destination $targetFile -Force

Write-Host ""
Write-Success "Build complete"
Write-Host "AAB: $targetFile" -ForegroundColor Yellow
