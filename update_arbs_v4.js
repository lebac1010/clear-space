const fs = require('fs');
const path = require('path');

const missingKeys = {
    "systemDefault": "System Default",
    "light": "Light",
    "dark": "Dark",
    "strictSensitivity": "Strict (95% Match)",
    "normalSensitivity": "Normal (85% Match)",
    "looseSensitivity": "Loose (75% Match)",
    "sensitivityDesc": "Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged.",
    "strictSensitivityDesc": "95% Match — Nearly identical only",
    "normalSensitivityDesc": "85% Match — Recommended",
    "looseSensitivityDesc": "75% Match — Catches more variations",
    "sensitivityUpdated": "Sensitivity setting updated. It will apply on the next scan.",
    "thresholdDesc": "Files larger than this value will be flagged for cleanup.",
    "thresholdUpdated": "Threshold updated. It will apply on the next scan.",
    "largerThanSize": "Larger than {size}",
    "madeWithHeart": "Made with ❤️ for a cleaner phone",
    "versionUnavailable": "Version unavailable",
    "emailNotSupported": "Could not open email client. Please email us directly.",
    "browserRestricted": "Browser access restricted on this device.",
    "storeUnavailable": "Store service temporarily unavailable.",
    "clearSpace": "Clear Space",
    "loading": "Loading..."
};

const l10nDir = path.join(__dirname, 'lib', 'l10n');
const files = fs.readdirSync(l10nDir).filter(f => f.endsWith('.arb') && !f.includes('_en.arb'));

for (const file of files) {
    const filePath = path.join(l10nDir, file);
    let content = JSON.parse(fs.readFileSync(filePath, 'utf8'));

    let updated = false;
    for (const [key, value] of Object.entries(missingKeys)) {
        if (!content[key]) {
            content[key] = value + (file.includes('en_GB') ? '' : ' (' + file.replace('app_', '').replace('.arb', '') + ')');
            updated = true;
        }
    }

    if (updated) {
        fs.writeFileSync(filePath, JSON.stringify(content, null, 2));
        console.log(`Updated ${file}`);
    }
}
