param(
    [string]$SourceSvg = "branding/logo/clearspace_icon_vortex.svg"
)

$ErrorActionPreference = "Stop"

function Resolve-Browser {
    $candidates = @(
        "C:\Program Files\Google\Chrome\Application\chrome.exe",
        "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
        "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
        "C:\Program Files\Microsoft\Edge\Application\msedge.exe"
    )

    foreach ($candidate in $candidates) {
        if (Test-Path $candidate) {
            return $candidate
        }
    }

    throw "No Chromium-based browser found."
}

function Render-SvgToPng {
    param(
        [string]$BrowserPath,
        [string]$SvgPath,
        [string]$PngPath,
        [int]$Size
    )

    $svgContent = Get-Content $SvgPath -Raw
    $svgContent = $svgContent -replace '<svg ', '<svg style="width:100%;height:100%;display:block" '

    $htmlPath = Join-Path (Split-Path $PngPath -Parent) ([System.IO.Path]::GetFileNameWithoutExtension($PngPath) + ".html")
    $html = @"
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <style>
    html, body {
      margin: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      background: transparent;
    }
    .frame {
      width: 100vw;
      height: 100vh;
    }
  </style>
</head>
<body>
  <div class="frame">$svgContent</div>
</body>
</html>
"@
    Set-Content -Path $htmlPath -Value $html -Encoding UTF8 -NoNewline

    $svgUri = ([System.Uri](Resolve-Path $htmlPath).Path).AbsoluteUri
    $profileDir = Join-Path ([System.IO.Path]::GetTempPath()) ("clearspace-icon-profile-" + [System.Guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Force -Path $profileDir | Out-Null

    $arguments = @(
        "--headless=new",
        "--no-sandbox",
        "--disable-gpu",
        "--hide-scrollbars",
        "--no-first-run",
        "--disable-crash-reporter",
        "--disable-crashpad",
        "--disable-default-apps",
        "--disable-sync",
        "--allow-file-access-from-files",
        "--user-data-dir=$profileDir",
        "--default-background-color=00000000",
        "--window-size=$Size,$Size",
        "--screenshot=$PngPath",
        $svgUri
    )

    $process = Start-Process -FilePath $BrowserPath -ArgumentList $arguments -Wait -PassThru -NoNewWindow
    if ($process.ExitCode -ne 0 -or -not (Test-Path $PngPath)) {
        throw "Failed to render $SvgPath"
    }
}

function Resize-Png {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Size
    )

    Add-Type -AssemblyName System.Drawing

    $source = [System.Drawing.Image]::FromFile($InputPath)
    $bitmap = New-Object System.Drawing.Bitmap($Size, $Size, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)

    $graphics.Clear([System.Drawing.Color]::Transparent)
    $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.DrawImage($source, 0, 0, $Size, $Size)

    $parent = Split-Path $OutputPath -Parent
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    $bitmap.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)

    $graphics.Dispose()
    $bitmap.Dispose()
    $source.Dispose()
}

function Get-AlphaBounds {
    param(
        [System.Drawing.Bitmap]$Bitmap,
        [int]$Threshold = 8
    )

    $minX = $Bitmap.Width
    $minY = $Bitmap.Height
    $maxX = -1
    $maxY = -1

    for ($y = 0; $y -lt $Bitmap.Height; $y++) {
        for ($x = 0; $x -lt $Bitmap.Width; $x++) {
            if ($Bitmap.GetPixel($x, $y).A -gt $Threshold) {
                if ($x -lt $minX) { $minX = $x }
                if ($y -lt $minY) { $minY = $y }
                if ($x -gt $maxX) { $maxX = $x }
                if ($y -gt $maxY) { $maxY = $y }
            }
        }
    }

    if ($maxX -lt 0 -or $maxY -lt 0) {
        return $null
    }

    return @{
        X = $minX
        Y = $minY
        Width = $maxX - $minX + 1
        Height = $maxY - $minY + 1
    }
}

function Normalize-Png {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Size,
        [double]$TargetCoverage = 0.72
    )

    Add-Type -AssemblyName System.Drawing

    $source = [System.Drawing.Bitmap]::FromFile($InputPath)
    $bounds = Get-AlphaBounds -Bitmap $source

    if ($null -eq $bounds) {
        Resize-Png -InputPath $InputPath -OutputPath $OutputPath -Size $Size
        $source.Dispose()
        return
    }

    $bitmap = New-Object System.Drawing.Bitmap($Size, $Size, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.Clear([System.Drawing.Color]::Transparent)
    $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality

    $targetMax = [math]::Round($Size * $TargetCoverage)
    $scale = [math]::Min($targetMax / $bounds.Width, $targetMax / $bounds.Height)
    $drawWidth = [int][math]::Round($bounds.Width * $scale)
    $drawHeight = [int][math]::Round($bounds.Height * $scale)
    $destX = [int][math]::Floor(($Size - $drawWidth) / 2)
    $destY = [int][math]::Floor(($Size - $drawHeight) / 2)

    $srcRect = New-Object System.Drawing.Rectangle($bounds.X, $bounds.Y, $bounds.Width, $bounds.Height)
    $destRect = New-Object System.Drawing.Rectangle($destX, $destY, $drawWidth, $drawHeight)
    $graphics.DrawImage($source, $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)

    $parent = Split-Path $OutputPath -Parent
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    $bitmap.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)

    $graphics.Dispose()
    $bitmap.Dispose()
    $source.Dispose()
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$sourcePath = (Resolve-Path (Join-Path $repoRoot $SourceSvg)).Path
$browser = Resolve-Browser

$workDir = Join-Path $repoRoot "build\icon-gen"
New-Item -ItemType Directory -Force -Path $workDir | Out-Null

$fullSvgPath = Join-Path $workDir "clearspace_icon_full.svg"
$foregroundSvgPath = Join-Path $workDir "clearspace_icon_foreground.svg"
$masterRawPngPath = Join-Path $workDir "clearspace_icon_master_raw.png"
$masterPngPath = Join-Path $workDir "clearspace_icon_master.png"
$foregroundRawPngPath = Join-Path $workDir "clearspace_icon_foreground_raw.png"
$foregroundPngPath = Join-Path $workDir "clearspace_icon_foreground.png"

Copy-Item $sourcePath $fullSvgPath -Force

$foregroundSvg = Get-Content $sourcePath -Raw
$foregroundSvg = $foregroundSvg -replace '(?m)^\s*<!-- Adaptive safe zone squircle -->\r?\n', ''
$foregroundSvg = $foregroundSvg -replace '(?m)^\s*<rect x="64" y="64" width="896" height="896" rx="220" fill="url\(#bg\)"/>\r?\n', ''
Set-Content -Path $foregroundSvgPath -Value $foregroundSvg -Encoding UTF8 -NoNewline

Render-SvgToPng -BrowserPath $browser -SvgPath $fullSvgPath -PngPath $masterRawPngPath -Size 1024
Normalize-Png -InputPath $masterRawPngPath -OutputPath $masterPngPath -Size 1024 -TargetCoverage 0.875
Render-SvgToPng -BrowserPath $browser -SvgPath $foregroundSvgPath -PngPath $foregroundRawPngPath -Size 1024
Normalize-Png -InputPath $foregroundRawPngPath -OutputPath $foregroundPngPath -Size 432 -TargetCoverage 0.72

$legacyTargets = @(
    @{ Size = 48; Dir = "mipmap-mdpi" },
    @{ Size = 72; Dir = "mipmap-hdpi" },
    @{ Size = 96; Dir = "mipmap-xhdpi" },
    @{ Size = 144; Dir = "mipmap-xxhdpi" },
    @{ Size = 192; Dir = "mipmap-xxxhdpi" }
)

foreach ($target in $legacyTargets) {
    $launcherPath = Join-Path $repoRoot "android\app\src\main\res\$($target.Dir)\ic_launcher.png"
    $roundPath = Join-Path $repoRoot "android\app\src\main\res\$($target.Dir)\ic_launcher_round.png"
    Resize-Png -InputPath $masterPngPath -OutputPath $launcherPath -Size $target.Size
    Resize-Png -InputPath $masterPngPath -OutputPath $roundPath -Size $target.Size
}

$adaptiveForegroundPath = Join-Path $repoRoot "android\app\src\main\res\drawable-nodpi\ic_launcher_foreground.png"
Copy-Item $foregroundPngPath $adaptiveForegroundPath -Force

Write-Output "Generated Android launcher icons from $SourceSvg"
