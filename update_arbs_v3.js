const fs = require('fs');
const path = require('path');

const missingKeys = {
    "allClean": "All clean!",
    "deleting": "Deleting...",
    "deleteItemsCount": "Delete {count} items ({size})",
    "deletedCountMsg": "Deleted {count} items ({size})",
    "actionCannotBeUndone": "This action cannot be undone.",
    "cleanupBreakdown": "Cleanup Breakdown",
    "smartCleanupDesc": "We automatically keep the best version of your photos and files.",
    "cleaning": "Cleaning...",
    "cleanUpSize": "Clean Up {size}",
    "youSavedSize": "You saved {size}",
    "youreAllSet": "You're All Set!",
    "noSmartCleanupItems": "No duplicate or similar files found.",
    "save": "Save",
    "keep": "KEEP",
    "deselectAll": "Deselect All",
    "images": "Images",
    "docs": "Docs",
    "others": "Others",
    "all": "All",
    "deleteConfirmMsg": "Are you sure you want to delete {count} selected files?\n\nItems will be moved to Trash if supported, or permanently deleted.",
    "screenshotsCount": "{count, plural, =0{No screenshots} =1{1 screenshot} other{{count} screenshots}}",
    "selectedCountSize": "Selected: {count} ({size})",
    "deleteSelectedSize": "Delete Selected ({size})",
    "deleteFailedGeneral": "Failed to delete some items. Please try again."
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
