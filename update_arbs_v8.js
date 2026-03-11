const fs = require('fs');
const path = require('path');

const missingKeys = {
    "largeFilesTitle": "Large Files",
    "usedSize": "{size} Used",
    "totalSize": "{size} Total"
};

// Also need to fix placeholder types in all files
const typeFixes = {
    "emptyFoldersFound": { "count": "int" },
    "deleteCountScreenshots": { "count": "int" },
    "appsCount": { "count": "int" },
    "appsShowingCount": { "showing": "int", "total": "int" }
};

const l10nDir = path.join(__dirname, 'lib', 'l10n');
const files = fs.readdirSync(l10nDir).filter(f => f.endsWith('.arb') && !f.includes('_en.arb'));

for (const file of files) {
    const filePath = path.join(l10nDir, file);
    let content = JSON.parse(fs.readFileSync(filePath, 'utf8'));

    let updated = false;

    // Add missing keys
    for (const [key, value] of Object.entries(missingKeys)) {
        if (!content[key]) {
            content[key] = value + (file.includes('en_GB') ? '' : ' (' + file.replace('app_', '').replace('.arb', '') + ')');
            updated = true;
        }
    }

    // Fix types (placeholder logic in ARB is just key: value, metadata is separate)
    // Actually our script only manages keys, metadata is only in app_en.arb usually if using flutter_localizations
    // But let's check if there are metadata entries in other files to be safe
    for (const [key, placeholders] of Object.entries(typeFixes)) {
        const metaKey = "@" + key;
        if (content[metaKey]) {
            for (const [pKey, pType] of Object.entries(placeholders)) {
                if (content[metaKey].placeholders && content[metaKey].placeholders[pKey]) {
                    content[metaKey].placeholders[pKey].type = pType;
                    updated = true;
                }
            }
        }
    }

    if (updated) {
        fs.writeFileSync(filePath, JSON.stringify(content, null, 2));
        console.log(`Updated ${file}`);
    }
}
