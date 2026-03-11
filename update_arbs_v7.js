const fs = require('fs');
const path = require('path');

const missingKeys = {
    "selectYourLanguage": "Select Your Language",
    "changeLaterInSettings": "You can change this later in Settings."
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
