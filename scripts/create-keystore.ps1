<#
.SYNOPSIS
Create Android upload keystore + key.properties for Clean Master Space.
#>

[CmdletBinding()]
param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

function Write-Step([string]$Message) { Write-Host "`n==> $Message" -ForegroundColor Cyan }
function Write-Ok([string]$Message) { Write-Host "[OK] $Message" -ForegroundColor Green }
function Write-Fail([string]$Message) { Write-Host "[ERROR] $Message" -ForegroundColor Red }
function Write-Warn([string]$Message) { Write-Host "[WARN] $Message" -ForegroundColor Yellow }

function Read-Secret([string]$Prompt) {
    $secure = Read-Host $Prompt -AsSecureString
    return [Runtime.InteropServices.Marshal]::PtrToStringBSTR(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
    )
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir
$appDir = $repoRoot
$androidDir = Join-Path $appDir "android"
$keystoreDir = Join-Path $androidDir "keystore"
$keystoreFileName = "upload-keystore.jks"
$keystorePath = Join-Path $keystoreDir $keystoreFileName
$keyPropertiesPath = Join-Path $androidDir "key.properties"
$relativeKeystorePath = "keystore/$keystoreFileName"

Write-Host ""
Write-Host "============================================" -ForegroundColor Magenta
Write-Host "  Clean Master Space - Android Keystore Generator" -ForegroundColor Magenta
Write-Host "============================================" -ForegroundColor Magenta
Write-Host ""

Write-Step "Checking keytool"
$candidateKeytools = @()
if ($env:JAVA_HOME) {
    $candidateKeytools += Join-Path $env:JAVA_HOME "bin\keytool.exe"
}
if ($env:ProgramFiles) {
    $candidateKeytools += Join-Path $env:ProgramFiles "Android\Android Studio\jbr\bin\keytool.exe"
}
if ($env:LOCALAPPDATA) {
    $candidateKeytools += Join-Path $env:LOCALAPPDATA "Programs\Android Studio\jbr\bin\keytool.exe"
    $candidateKeytools += Join-Path $env:LOCALAPPDATA "Android\android-studio\jbr\bin\keytool.exe"
}
$candidateKeytools = @($candidateKeytools | Where-Object { $_ -and (Test-Path -LiteralPath $_) })

$keytool = $null
if ($candidateKeytools.Count -gt 0) {
    $keytool = (Resolve-Path -LiteralPath ($candidateKeytools | Select-Object -First 1)).Path
}
if (-not $keytool) {
    $command = Get-Command keytool -ErrorAction SilentlyContinue
    if ($command) {
        if ($command.Path) {
            $keytool = $command.Path
        } elseif ($command.Source) {
            $keytool = $command.Source
        }
    }
}

if (-not $keytool) {
    Write-Fail "keytool not found. Install JDK or set JAVA_HOME."
    exit 1
}
Write-Ok "Using keytool: $keytool"

if ((Test-Path $keystorePath) -and -not $Force) {
    Write-Warn "Keystore already exists at $keystorePath"
    $overwrite = Read-Host "Overwrite? (y/N)"
    if ($overwrite -notin @("y", "Y")) {
        Write-Host "Aborted."
        exit 0
    }
}

New-Item -ItemType Directory -Path $keystoreDir -Force | Out-Null

Write-Host ""
Write-Host "Press Enter to accept defaults." -ForegroundColor Gray
Write-Host ""

$defaultAlias = "cleanmasterspace_upload"
$alias = Read-Host "Key alias [$defaultAlias]"
if ([string]::IsNullOrWhiteSpace($alias)) { $alias = $defaultAlias }

do {
    $storePassword = Read-Secret "Keystore password"
    if ($storePassword.Length -lt 6) {
        Write-Warn "Password must be at least 6 characters."
        continue
    }
    $confirmStorePassword = Read-Secret "Confirm keystore password"
    if ($storePassword -ne $confirmStorePassword) {
        Write-Warn "Passwords do not match."
        continue
    }
    break
} while ($true)

$keyPassword = $storePassword
$useSame = Read-Host "Use same password for key? (Y/n)"
if ($useSame -in @("n", "N")) {
    do {
        $keyPassword = Read-Secret "Key password"
        $confirmKeyPassword = Read-Secret "Confirm key password"
        if ($keyPassword -ne $confirmKeyPassword) {
            Write-Warn "Passwords do not match."
            continue
        }
        break
    } while ($true)
}

$defaultCn = "Clean Master Space"
$cn = Read-Host "App/Owner name [$defaultCn]"
if ([string]::IsNullOrWhiteSpace($cn)) { $cn = $defaultCn }

$defaultOu = "Mobile"
$ou = Read-Host "Organizational unit [$defaultOu]"
if ([string]::IsNullOrWhiteSpace($ou)) { $ou = $defaultOu }

$defaultO = "Movixa Labs"
$o = Read-Host "Organization [$defaultO]"
if ([string]::IsNullOrWhiteSpace($o)) { $o = $defaultO }

$defaultL = "Ho Chi Minh City"
$l = Read-Host "City [$defaultL]"
if ([string]::IsNullOrWhiteSpace($l)) { $l = $defaultL }

$defaultS = "Ho Chi Minh"
$s = Read-Host "State/Province [$defaultS]"
if ([string]::IsNullOrWhiteSpace($s)) { $s = $defaultS }

$defaultC = "VN"
$c = Read-Host "Country code [$defaultC]"
if ([string]::IsNullOrWhiteSpace($c)) { $c = $defaultC }

$defaultValidity = "10000"
$validity = Read-Host "Validity in days [$defaultValidity]"
if ([string]::IsNullOrWhiteSpace($validity)) { $validity = $defaultValidity }

$dname = "CN=$cn, OU=$ou, O=$o, L=$l, ST=$s, C=$c"

Write-Host ""
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  keystore: $keystorePath"
Write-Host "  alias:    $alias"
Write-Host "  dname:    $dname"
Write-Host "  validity: $validity"
Write-Host ""

$confirm = Read-Host "Generate now? (Y/n)"
if ($confirm -in @("n", "N")) {
    Write-Host "Aborted."
    exit 0
}

Write-Step "Generating keystore"
# Remove old keystore file to avoid 'alias already exists' error
if (Test-Path $keystorePath) {
    Remove-Item $keystorePath -Force
}
$keytoolArgs = @(
    "-genkeypair",
    "-v",
    "-keystore", $keystorePath,
    "-alias", $alias,
    "-keyalg", "RSA",
    "-keysize", "2048",
    "-validity", $validity,
    "-storepass", $storePassword,
    "-keypass", $keyPassword,
    "-dname", $dname,
    "-noprompt"
)
try {
    & $keytool @keytoolArgs
    $exitCode = $LASTEXITCODE
} catch {
    Write-Fail "Failed to run keytool: $keytool"
    Write-Fail $_.Exception.Message
    exit 1
}

if ($exitCode -ne 0 -or -not (Test-Path $keystorePath)) {
    Write-Fail "Failed to generate keystore (exit code: $exitCode)."
    exit 1
}
Write-Ok "Keystore created."

Write-Step "Writing key.properties"
$keyPropertiesContent = @"
# Auto-generated by scripts/create-keystore.ps1
# Generated on: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

storeFile=$relativeKeystorePath
storePassword=$storePassword
keyAlias=$alias
keyPassword=$keyPassword
"@
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($keyPropertiesPath, $keyPropertiesContent, $utf8NoBom)

$keystoreGitignore = Join-Path $keystoreDir ".gitignore"
"*`n!.gitignore" | Out-File -FilePath $keystoreGitignore -Encoding ascii -NoNewline

Write-Ok "key.properties created: $keyPropertiesPath"
Write-Host ""
Write-Host "Done. Keep keystore and passwords backed up safely." -ForegroundColor Green
Write-Host "Build command: .\scripts\build-release.ps1" -ForegroundColor Yellow
