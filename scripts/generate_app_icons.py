"""
Generate Android launcher icons for the Clear Space app.

This repo only ships the Android target, so the generator updates the
Android launcher assets that exist in this project:
- Legacy launcher icons in mipmap-* directories
- Adaptive foreground PNG in drawable-nodpi

The adaptive background color and monochrome vector stay in their existing
resource files:
- android/app/src/main/res/values/colors.xml
- android/app/src/main/res/drawable/ic_launcher_monochrome.xml
"""

from __future__ import annotations

import argparse
import io
import shutil
import subprocess
import sys
from pathlib import Path

from PIL import Image, ImageOps

PROJECT_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_SOURCE_SVG = PROJECT_ROOT / "branding" / "logo" / "clearspace_icon_vortex.svg"
DEFAULT_MONOCHROME_SVG = (
    PROJECT_ROOT / "branding" / "logo" / "clearspace_icon_vortex_mono.svg"
)
ANDROID_RES = PROJECT_ROOT / "android" / "app" / "src" / "main" / "res"
DRAWABLE_NODPI = ANDROID_RES / "drawable-nodpi"
WORK_DIR = PROJECT_ROOT / "artifacts" / "icon-gen"

BROWSER_CANDIDATES = [
    Path(r"C:\Program Files\Microsoft\Edge\Application\msedge.exe"),
    Path(r"C:\Program Files\Google\Chrome\Application\chrome.exe"),
    Path(r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"),
    Path(r"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"),
]

LEGACY_ICON_SIZES = {
    "mipmap-mdpi": 48,
    "mipmap-hdpi": 72,
    "mipmap-xhdpi": 96,
    "mipmap-xxhdpi": 144,
    "mipmap-xxxhdpi": 192,
}

FOREGROUND_SIZE = 432
MASTER_SIZE = 1024
MASTER_COVERAGE = 1.0
FOREGROUND_COVERAGE = 0.66
FOREGROUND_Y_OFFSET = 8


class SvgRenderError(RuntimeError):
    pass


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate Android launcher icons for the Clear Space app."
    )
    parser.add_argument(
        "--source-svg",
        type=Path,
        default=DEFAULT_SOURCE_SVG,
        help="Path to the full launcher SVG artwork.",
    )
    parser.add_argument(
        "--monochrome-svg",
        type=Path,
        default=DEFAULT_MONOCHROME_SVG,
        help=(
            "Optional path to the monochrome SVG. It is validated and copied to "
            "artifacts for review, but the existing Android vector resource is left unchanged."
        ),
    )
    return parser.parse_args()


def require_file(path: Path) -> None:
    if not path.exists():
        raise FileNotFoundError(f"Missing required asset: {path}")


def find_browser() -> Path | None:
    for candidate in BROWSER_CANDIDATES:
        if candidate.exists():
            return candidate
    return None


def render_svg_with_browser(path: Path, width: int, height: int) -> bytes:
    browser = find_browser()
    if browser is None:
        raise SvgRenderError("No supported browser found for SVG fallback rendering.")

    temp_output = WORK_DIR / f"{path.stem}_{width}x{height}.png"
    temp_html = WORK_DIR / f"{path.stem}_{width}x{height}.html"
    profile_dir = WORK_DIR / f"browser-profile-{path.stem}"
    temp_output.parent.mkdir(parents=True, exist_ok=True)
    temp_output.unlink(missing_ok=True)
    temp_html.unlink(missing_ok=True)
    profile_dir.mkdir(parents=True, exist_ok=True)

    viewport_width = max(width + 320, 512)
    viewport_height = max(height + 320, 512)
    svg_markup = path.read_text(encoding="utf-8")
    svg_markup = svg_markup.replace(
        "<svg ", '<svg style="width:100%;height:100%;display:block" ', 1
    )
    temp_html.write_text(
        (
            "<!doctype html>\n"
            "<html>\n"
            "<head>\n"
            '  <meta charset="utf-8">\n'
            "  <style>\n"
            "    html, body {\n"
            "      margin: 0;\n"
            "      width: 100%;\n"
            "      height: 100%;\n"
            "      overflow: hidden;\n"
            "      background: transparent;\n"
            "    }\n"
            "    .frame {\n"
            "      width: 100vw;\n"
            "      height: 100vh;\n"
            "    }\n"
            "  </style>\n"
            "</head>\n"
            "<body>\n"
            f'  <div class="frame">{svg_markup}</div>\n'
            "</body>\n"
            "</html>\n"
        ),
        encoding="utf-8",
    )

    command = [
        str(browser),
        "--headless",
        "--no-sandbox",
        "--disable-gpu",
        "--hide-scrollbars",
        "--no-first-run",
        "--disable-crash-reporter",
        "--disable-crashpad",
        "--disable-default-apps",
        "--disable-sync",
        "--allow-file-access-from-files",
        "--default-background-color=00000000",
        f"--user-data-dir={profile_dir}",
        f"--window-size={viewport_width},{viewport_height}",
        f"--screenshot={temp_output}",
        temp_html.resolve().as_uri(),
    ]

    try:
        subprocess.run(command, capture_output=True, check=True)
        rendered = Image.open(temp_output).convert("RGBA")
        bbox = rendered.getchannel("A").getbbox()
        if bbox is None:
            raise SvgRenderError(
                f"Browser rendered a fully transparent image for {path.name}."
            )

        cropped = rendered.crop(bbox)
        fitted = ImageOps.contain(cropped, (width, height), Image.Resampling.LANCZOS)
        canvas = Image.new("RGBA", (width, height), (0, 0, 0, 0))
        offset = ((width - fitted.width) // 2, (height - fitted.height) // 2)
        canvas.alpha_composite(fitted, offset)

        output = io.BytesIO()
        canvas.save(output, "PNG", optimize=True)
        return output.getvalue()
    except subprocess.CalledProcessError as exc:
        raise SvgRenderError(f"Browser SVG rendering failed for {path.name}: {exc}") from exc
    finally:
        temp_output.unlink(missing_ok=True)
        temp_html.unlink(missing_ok=True)
        shutil.rmtree(profile_dir, ignore_errors=True)


def render_svg_bytes(path: Path, width: int, height: int) -> bytes:
    svg_bytes = path.read_bytes()
    commands: list[list[str]] = []

    if shutil.which("rsvg-convert"):
        commands.append(
            ["rsvg-convert", "-w", str(width), "-h", str(height), "-f", "png", str(path)]
        )

    if shutil.which("magick"):
        commands.append(["magick", str(path), "-resize", f"{width}x{height}", "png:-"])

    if shutil.which("inkscape"):
        commands.append(
            [
                "inkscape",
                str(path),
                "--export-type=png",
                f"--export-width={width}",
                f"--export-height={height}",
                "--export-filename=-",
            ]
        )

    for command in commands:
        try:
            result = subprocess.run(command, capture_output=True, check=True)
            if result.stdout:
                return result.stdout
        except subprocess.CalledProcessError:
            continue

    try:
        import cairosvg  # type: ignore

        return cairosvg.svg2png(
            bytestring=svg_bytes,
            output_width=width,
            output_height=height,
        )
    except ImportError:
        return render_svg_with_browser(path, width, height)


def render_svg_image(path: Path, width: int, height: int) -> Image.Image:
    png_bytes = render_svg_bytes(path, width, height)
    return crop_transparent(Image.open(io.BytesIO(png_bytes)).convert("RGBA"))


def crop_transparent(image: Image.Image) -> Image.Image:
    bbox = image.getchannel("A").getbbox()
    if bbox is None:
        return image
    return image.crop(bbox)


def save_png(image: Image.Image, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    image.save(output_path, "PNG", optimize=True)

def center_on_canvas(image: Image.Image, canvas_size: int, ratio: float, offset_y: int = 0) -> Image.Image:
    target_size = max(1, int(canvas_size * ratio))
    fitted = ImageOps.contain(image, (target_size, target_size), Image.Resampling.LANCZOS)
    canvas = Image.new("RGBA", (canvas_size, canvas_size), (0, 0, 0, 0))
    offset = ((canvas_size - fitted.width) // 2, ((canvas_size - fitted.height) // 2) + offset_y)
    canvas.alpha_composite(fitted, offset)
    return canvas



def strip_adaptive_background(source_svg: Path, output_svg: Path) -> None:
    svg_text = source_svg.read_text(encoding="utf-8")
    svg_text = svg_text.replace("<!-- Adaptive safe zone squircle -->\n", "")
    svg_text = svg_text.replace("<!-- Background squircle -->\n", "")
    svg_text = svg_text.replace("<!-- Background squircle, full bleed -->\n", "")
    svg_text = svg_text.replace(
        '<rect x="64" y="64" width="896" height="896" rx="220" fill="url(#bg)"/>\n',
        "",
    )
    svg_text = svg_text.replace(
        '<rect x="0" y="0" width="1024" height="1024" rx="220" fill="url(#bg2)"/>\n',
        "",
    )
    output_svg.write_text(svg_text, encoding="utf-8")


def cleanup_generated_assets() -> None:
    for mipmap_dir in LEGACY_ICON_SIZES:
        output_dir = ANDROID_RES / mipmap_dir
        for filename in ("ic_launcher.png", "ic_launcher_round.png"):
            (output_dir / filename).unlink(missing_ok=True)

    (DRAWABLE_NODPI / "ic_launcher_foreground.png").unlink(missing_ok=True)


def generate_legacy_icons(master_icon: Image.Image) -> None:
    print("Generating Android legacy launcher icons...")
    for mipmap_dir, size in LEGACY_ICON_SIZES.items():
        output_dir = ANDROID_RES / mipmap_dir
        output_dir.mkdir(parents=True, exist_ok=True)
        icon = master_icon.resize((size, size), Image.Resampling.LANCZOS)
        save_png(icon, output_dir / "ic_launcher.png")
        save_png(icon, output_dir / "ic_launcher_round.png")
        print(f"  {mipmap_dir}: {size}x{size}")


def generate_adaptive_foreground(foreground_icon: Image.Image) -> None:
    print("Generating Android adaptive foreground...")
    DRAWABLE_NODPI.mkdir(parents=True, exist_ok=True)
    save_png(foreground_icon, DRAWABLE_NODPI / "ic_launcher_foreground.png")
    print("  drawable-nodpi/ic_launcher_foreground.png: 432x432")


def generate_artifact_previews(
    source_svg: Path,
    monochrome_svg: Path,
    master_icon: Image.Image,
    foreground_icon: Image.Image,
) -> None:
    WORK_DIR.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source_svg, WORK_DIR / source_svg.name)
    if monochrome_svg.exists():
        shutil.copy2(monochrome_svg, WORK_DIR / monochrome_svg.name)

    save_png(master_icon, WORK_DIR / "clearspace_launcher_master.png")
    save_png(foreground_icon, WORK_DIR / "clearspace_launcher_foreground.png")

    if monochrome_svg.exists():
        monochrome_preview = render_svg_image(monochrome_svg, MASTER_SIZE, MASTER_SIZE)
        save_png(monochrome_preview, WORK_DIR / "clearspace_launcher_monochrome.png")


def main() -> int:
    args = parse_args()
    source_svg = args.source_svg.resolve()
    monochrome_svg = args.monochrome_svg.resolve()

    print("=" * 68)
    print("Clear Space Android Icon Generator")
    print("=" * 68)

    try:
        require_file(source_svg)
        require_file(monochrome_svg)
    except FileNotFoundError as exc:
        print(f"ERROR: {exc}")
        return 1

    print(f"Launcher source:    {source_svg.relative_to(PROJECT_ROOT)}")
    print(f"Monochrome source:  {monochrome_svg.relative_to(PROJECT_ROOT)}")

    derived_foreground_svg = WORK_DIR / "clearspace_icon_foreground.svg"

    try:
        WORK_DIR.mkdir(parents=True, exist_ok=True)
        strip_adaptive_background(source_svg, derived_foreground_svg)

        master_render = render_svg_image(source_svg, MASTER_SIZE, MASTER_SIZE)
        master_icon = center_on_canvas(master_render, MASTER_SIZE, MASTER_COVERAGE)

        foreground_render = render_svg_image(
            derived_foreground_svg, MASTER_SIZE, MASTER_SIZE
        )
        foreground_icon = center_on_canvas(
            foreground_render, FOREGROUND_SIZE, FOREGROUND_COVERAGE, offset_y=FOREGROUND_Y_OFFSET
        )

        cleanup_generated_assets()
        generate_legacy_icons(master_icon)
        generate_adaptive_foreground(foreground_icon)
        generate_artifact_previews(
            source_svg=source_svg,
            monochrome_svg=monochrome_svg,
            master_icon=master_icon,
            foreground_icon=foreground_icon,
        )
    except Exception as exc:
        print(f"ERROR: Icon generation failed: {exc}")
        return 1

    print("\nDone.")
    print("Updated Android launcher icons for this repo.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
