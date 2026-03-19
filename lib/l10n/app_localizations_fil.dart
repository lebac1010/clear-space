// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get cleanupTitle => 'Paglilinis';

  @override
  String get photosTitle => 'Mga Larawan';

  @override
  String get filesTitle => 'Mga File';

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get languageTitle => 'Wika';

  @override
  String get themeTitle => 'Tema';

  @override
  String get systemTheme => 'Default ng System';

  @override
  String get lightTheme => 'Maliwanag';

  @override
  String get darkTheme => 'Madilim';

  @override
  String get storageAccessRequired => 'Kailangan ng Access sa Storage';

  @override
  String get storageAccessDesc =>
      'Kailangan ng Clear Space ang \"Access sa lahat ng file\" upang i-scan ang iyong device para sa mga duplicate, malalaking file, at junk na file.\n\nIdidirekta ka sa Mga Setting ng System upang ibigay ang pahintulot na ito kapag na-tap mo ang Ibigay ang Pahintulot.';

  @override
  String get storagePermissionDeniedDesc =>
      'Tinanggihan ang pahintulot sa storage. Pakisuri at i-enable ito sa Mga Setting upang magpatuloy.';

  @override
  String get permissionMediaTitle => 'Mga larawan, video, at audio';

  @override
  String get permissionMediaDesc =>
      'Ginagamit upang mahanap ang mga duplicate na file, katulad na mga larawan, screenshot, download, at malalaking media na naka-store sa iyong device.';

  @override
  String get permissionAllFilesTitle => 'Access sa lahat ng mga file';

  @override
  String get permissionAllFilesDesc =>
      'Ginagamit para sa mga feature ng paglilinis na hindi media tulad ng mga junk file, pagsusuri ng APK, pagsusuri ng download, at mga walang lamang folder.';

  @override
  String get permissionInstalledAppsTitle => 'Mga naka-install na app';

  @override
  String get permissionInstalledAppsDesc =>
      'Ginagamit ng App Manager upang ipakita ang mga naka-install na app na nakikita sa launcher at buksan ang kumpirmasyon ng pag-uninstall ng Android kapag pinili mo.';

  @override
  String get permissionVisibleProgressTitle => 'Nakikitang progreso';

  @override
  String get permissionVisibleProgressDesc =>
      'Ginagamit upang panatilihing nakikitang progreso ng pag-scan o paglilinis habang tumatakbo ang isang gawain na pinasimulan ng user.';

  @override
  String get permissionOnDeviceNote =>
      'Ang pag-scan at pagsusuri ng paglilinis ay nananatili sa iyong device. Hindi ina-upload ng Clear Space ang iyong mga file sa isang developer server para sa mga feature na ito.';

  @override
  String get openSettings => 'Buksan ang Mga Setting';

  @override
  String get grantPermission => 'Ibigay ang Pahintulot';

  @override
  String get getStarted => 'Magsimula';

  @override
  String get skip => 'Laktawan';

  @override
  String get next => 'Susunod';

  @override
  String get continueText => 'Magpatuloy';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get analyze => 'Suriin';

  @override
  String get loading => 'Nilo-load...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Tagumpay';

  @override
  String get noItemsFound => 'Walang nakitang item';

  @override
  String itemsSelected(int count) {
    return '$count (na) item ang napili';
  }

  @override
  String get onboardingWelcome =>
      'Maligayang pagdating sa pinakamatalinong paraan upang panatilihing malinis, mabilis, at ligtas ang iyong device.';

  @override
  String get onboardingFeaturesTitle => 'Makapangyarihang Mga Tampok';

  @override
  String get onboardingFeaturesDesc =>
      'Lahat ng kailangan mo upang mahusay na pamahalaan ang iyong storage.';

  @override
  String get feature1Title => 'Unawain ang iyong storage';

  @override
  String get feature1Desc =>
      'Makakuha ng malinaw na visual na breakdown kung ano ang kumukuha ng espasyo.';

  @override
  String get feature2Title => 'Ligtas na maglinis';

  @override
  String get feature2Desc =>
      'Alisin ang mga hindi kinakailangang file na may mga ligtas na protocol sa pagtanggal.';

  @override
  String get feature3Title => 'Magbakante ng espasyo';

  @override
  String get feature3Desc =>
      'Agad na hanapin at alisin ang junk, malalaking file, at duplicate.';

  @override
  String get termsDesc =>
      'Sa pagpapatuloy, sumasang-ayon ka sa aming Mga Tuntunin ng Serbisyo at Patakaran sa Privacy.';

  @override
  String get selectLanguage => 'Piliin ang Iyong Wika';

  @override
  String get changeLaterInSettings =>
      'Maaari mo itong baguhin sa ibang pagkakataon sa Mga Setting.';

  @override
  String get photosAndImages => 'Mga Larawan at Imahe';

  @override
  String get videos => 'Mga Video';

  @override
  String get audio => 'Audio';

  @override
  String get documentsAndFiles => 'Mga Dokumento at File';

  @override
  String get systemAndApps => 'System at Apps';

  @override
  String get other => 'IBA PA';

  @override
  String get review => 'Suriin';

  @override
  String get viewDetails => 'Tingnan ang Mga Detalye';

  @override
  String get smartCleanupPlan => 'Planong Smart Cleanup';

  @override
  String get analyzingSafeToDelete =>
      'Sinusuri ang mga ligtas na burahin na file...';

  @override
  String get returnToDashboard => 'Bumalik sa Dashboard';

  @override
  String get returnDirectlyToDashboard => 'Direktang bumalik sa Dashboard';

  @override
  String get appearanceAndLanguage => 'Hitsura at Wika';

  @override
  String get supportAndEngagement => 'Suporta at Pakikipag-ugnayan';

  @override
  String get scanPreferences => 'Mga Kagustuhan sa Pag-scan';

  @override
  String get legalAndAppInfo => 'Legal at Impormasyon ng App';

  @override
  String get cleanupHistory => 'Kasaysayan ng Paglilinis';

  @override
  String get viewPastCleaning =>
      'Tingnan ang iyong nakaraang mga aktibidad sa paglilinis';

  @override
  String get sendFeedback => 'Magpadala ng Feedback';

  @override
  String get reportBugs => 'Iulat ang mga bug o magmungkahi ng mga pagpapabuti';

  @override
  String get rateUs => 'I-rate Kami ng 5 Bituin';

  @override
  String get helpOthers => 'Tulungan ang iba na makahanap ng Clear Space';

  @override
  String get shareWithFriends => 'Ibahagi sa Mga Kaibigan';

  @override
  String get recommendApp => 'Irekumenda ang app sa pamamagitan ng mga mensahe';

  @override
  String get similarPhotoSensitivity => 'Sensitivity sa Katulad na Larawan';

  @override
  String get largeFileThreshold => 'Threshold ng Malaking File';

  @override
  String get strict => 'Mahigpit';

  @override
  String get normal => 'Normal';

  @override
  String get loose => 'Maluwag';

  @override
  String get privacyPolicy => 'Patakaran sa Privacy';

  @override
  String get howWeProtectData => 'Paano namin pinoprotektahan ang iyong data';

  @override
  String get termsOfService => 'Mga Tuntunin ng Serbisyo';

  @override
  String get rulesAndGuidelines => 'Mga panuntunan at alituntunin';

  @override
  String get appVersion => 'Bersyon ng App';

  @override
  String get emailRestricted =>
      'Pinaghigpitan ang functionality ng email ng device.';

  @override
  String get browserLaunchFailed => 'Hindi mailunsad ang browser.';

  @override
  String get storeUnavailable =>
      'Pansamantalang hindi magagamit ang serbisyo ng tindahan.';

  @override
  String get browserRestricted =>
      'Pinaghigpitan ang access sa browser sa device na ito.';

  @override
  String get shareUnavailable =>
      'Hindi magagamit ang functionality sa pagbabahagi.';

  @override
  String get keepPhoneClean =>
      'Panatilihing malinis ang iyong telepono sa Clear Space';

  @override
  String get duplicateFiles => 'Mga Duplicate na File';

  @override
  String get findIdenticalFiles =>
      'Hanapin at alisin ang magkatulad na mga file';

  @override
  String get similarPhotos => 'Mga Katulad na Larawan';

  @override
  String get findKeyMoments => 'Maghanap ng mga pangunahing sandali sa larawan';

  @override
  String get largeFiles => 'Malalaking File';

  @override
  String filesLargerThan(String size) {
    return 'Mga file na mas malaki kaysa sa $size';
  }

  @override
  String get screenshots => 'Mga Screenshot';

  @override
  String get findAndDeleteScreenshots =>
      'Maghanap at magtanggal ng mga screenshot';

  @override
  String get downloads => 'Mga Na-download';

  @override
  String get manageDownloadedFiles =>
      'Pamahalaan ang iyong mga na-download na file';

  @override
  String get tempAndLogFiles => 'Mga Temporary at Log na File';

  @override
  String sizeFound(String size) {
    return 'Nakita ang $size';
  }

  @override
  String get emptyFolders => 'Mga Walang Laman na Folder';

  @override
  String emptyFoldersFound(int count) {
    return 'Nakitang $count walang laman na folder';
  }

  @override
  String get safeApkInstallers => 'Mga Ligtas na APK Installer';

  @override
  String get cleanOldApks => 'Linisin ang naka-install/lumang APK';

  @override
  String get pleaseScanStorageFirst => 'Mangyaring i-scan muna ang storage';

  @override
  String get noJunkFilesFound => 'Walang nakitang junk file!';

  @override
  String get cleanupComplete => 'Kumpleto na ang paglilinis!';

  @override
  String cleanupFailed(String error) {
    return 'Nabigo ang paglilinis: $error';
  }

  @override
  String get selectAll => 'Piliin Lahat';

  @override
  String get noLargeFilesFound => 'Walang nakitang malalaking file!';

  @override
  String get noDuplicatesFound => 'Walang nakitang duplicate!';

  @override
  String get delete => 'Tapusin';

  @override
  String get confirmation => 'Kumpirmasyon';

  @override
  String get clearHistory => 'I-clear ang Kasaysayan';

  @override
  String get clearHistoryConfirm =>
      'Sigurado ka bang gusto mong burahin ang lahat ng log ng paglilinis?';

  @override
  String get clearAll => 'I-clear Lahat';

  @override
  String get cleanAllSafeItems => 'Linisin ang Lahat ng Ligtas na Item';

  @override
  String get deleteFilesQuestion => 'Tanggalin ang mga file?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Permanenteng tanggalin ang $count (na) screenshot?';
  }

  @override
  String get screenshotsDeletedSuccess =>
      'Matagumpay na natanggal ang mga screenshot';

  @override
  String get junkFilesFound => 'Mga Basurang Nahanap';

  @override
  String get noPhotosFound => 'Walang nakitang mga larawan';

  @override
  String errorLoadingPhotos(String error) {
    return 'Error sa pag-load ng mga larawan: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Nabigo sa pag-delete: $error';
  }

  @override
  String get contacts => 'Mga Contact';

  @override
  String get contactsNotImplemented =>
      'Hindi Ipinatupad ang Listahan ng Mga Contact';

  @override
  String get smartSelect => 'Smart Select';

  @override
  String get junkFiles => 'Junk na mga File';

  @override
  String potentialSize(String size) {
    return '$size na potensyal';
  }

  @override
  String get noFilesMatchFilter =>
      'Walang mga file na tumutugma sa filter na ito';

  @override
  String get refreshingAppList => 'Nire-refresh ang apps...';

  @override
  String get openingUninstaller => 'Binubuksan ang uninstaller...';

  @override
  String get uninstallApp => 'I-uninstall ang App';

  @override
  String get uninstall => 'I-uninstall';

  @override
  String get sortLargest => 'Pinakamalaki';

  @override
  String get sortSmallest => 'Pinakamaliit';

  @override
  String get sortNewest => 'Pinakabago';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Pahina Hindi Nahanap';

  @override
  String get goToDashboard => 'Pumunta sa Dashboard';

  @override
  String get deleteFilesTitle => 'Burahin ang Files';

  @override
  String get smartCleanupPlanTitle => 'Smart na Plano';

  @override
  String get screenshotsCleanerTitle => 'Screenshot Cleaner';

  @override
  String get tryAgain => 'Subukang muli';

  @override
  String get appManagerTitle => 'App Manager';

  @override
  String get searchApps => 'Maghanap ng app...';

  @override
  String get noAppsFound => 'Walang nakitang apps';

  @override
  String get noMatchingApps => 'Walang tumugma';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Sigurado ka bang i-uninstall ang \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc => 'Tatanggalin nito ang app at ang data.';

  @override
  String appsCount(int count) {
    return '$count apps';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total apps';
  }

  @override
  String get duplicates => 'Mga Duplicate';

  @override
  String get similar => 'Katulad';

  @override
  String get somethingWentWrong => 'Nagkaroon ng problema';

  @override
  String get pageNotFoundDesc => 'Ang pahinang hinahanap mo ay hindi umiiral.';

  @override
  String get allClean => 'Lahat malinis!';

  @override
  String get deleting => 'Binubura...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Burahin $count aytem ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Nabura ang $count aytem ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Hindi na babalik ang nabura.';

  @override
  String get cleanupBreakdown => 'Bahagi ng Nilinis';

  @override
  String get smartCleanupDesc =>
      'Pinapanatili ang pinakamagandang kuha ng mga litrato mo.';

  @override
  String get cleaning => 'Naglilinis...';

  @override
  String cleanUpSize(String size) {
    return 'Linisin $size';
  }

  @override
  String youSavedSize(String size) {
    return 'Nakatipid ka ng $size';
  }

  @override
  String get youreAllSet => 'Handa na lahat!';

  @override
  String get noSmartCleanupItems => 'Walang duplicate na nakita.';

  @override
  String get save => 'I-save';

  @override
  String get keep => 'PANATILIHIN';

  @override
  String get deselectAll => 'Tanggalin ang Pili Lahat';

  @override
  String get images => 'Mga Larawan';

  @override
  String get docs => 'Dokumento';

  @override
  String get others => 'Iba pa';

  @override
  String get all => 'Lahat';

  @override
  String deleteConfirmMsg(int count) {
    return 'Sigurado ka bang buburahin ang $count file?\n\nAng mga ito ay permenenteng mbubura.';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count screenshots',
      one: '1 screenshot',
      zero: 'Walang screenshots',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Pinili: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Burahin ang Napili ($size)';
  }

  @override
  String get deleteFailedGeneral => 'Bigo na burahin ang ilang files.';

  @override
  String get systemDefault => 'System Default';

  @override
  String get light => 'Liwanag';

  @override
  String get dark => 'Dilim';

  @override
  String get strictSensitivity => 'Mahigpit (95% Match)';

  @override
  String get normalSensitivity => 'Normal (85% Match)';

  @override
  String get looseSensitivity => 'Maluwag (75% Match)';

  @override
  String get sensitivityDesc =>
      'Gaano kahigpit kukunin ng app ang magkaparehong mga larawan.';

  @override
  String get strictSensitivityDesc =>
      'Mahigpit — Ang halos saktong pareho lang';

  @override
  String get normalSensitivityDesc => 'Normal — Para sa inyo';

  @override
  String get looseSensitivityDesc => 'Maluwag — Higit pang makukuha';

  @override
  String get sensitivityUpdated =>
      'Pagbabago nakasave. Gagamitin ito sa susunod.';

  @override
  String get thresholdDesc => 'Ang mga file na mas malaki dito ay makukuha.';

  @override
  String get thresholdUpdated => 'Limitasyon nakasave.';

  @override
  String largerThanSize(String size) {
    return 'Mas malaki sa $size';
  }

  @override
  String get madeWithHeart => 'Ginawa may pagmamahal ❤️';

  @override
  String get versionUnavailable => 'Bersyon hindi handa';

  @override
  String get emailNotSupported => 'Email system walang galaw.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Imbakang Dasboard';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count aytem pwedeng linisin';
  }

  @override
  String get storageBreakdown => 'Lagayan Ng Espasyo';

  @override
  String get cleanup => 'Linisin';

  @override
  String get suggestions => 'Pangyayari';

  @override
  String get analyzing => 'Nagsusuri...';

  @override
  String get keepStorageHealthy => 'Gawing Mabilis ang Phone Mo';

  @override
  String get cleanupHeaderDesc => 'Files pwedeng tanggalin upang makatipid.';

  @override
  String percentUsed(int percentage) {
    return '$percentage% Ginamit';
  }

  @override
  String get scanPausedBattery => 'Tumigil (Low Battery)';

  @override
  String scanningPhase(String phase) {
    return 'Sinasakan: $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Sinasakan: $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Kinakalkula...';

  @override
  String get internalStorage => 'PANLOOB NA ESPASYO';

  @override
  String get free => 'Libre';

  @override
  String get used => 'Ginamit';

  @override
  String get total => 'Lahat';

  @override
  String get phaseDisk => 'Disk';

  @override
  String get phasePhotos => 'Larawan';

  @override
  String get phaseVideos => 'Mga Video';

  @override
  String get phaseAudio => 'Music';

  @override
  String get phaseDocuments => 'Dokumento';

  @override
  String get phaseJunk => 'Mga Basura';

  @override
  String get phaseFolders => 'Folders';

  @override
  String get phaseApks => 'Mga APKs';

  @override
  String get phaseSimilar => 'Dobleng Larawan';

  @override
  String get phaseStorage => 'Bara';

  @override
  String totalSize(String size) {
    return 'Lahat $size';
  }

  @override
  String usedSize(String size) {
    return 'Ginamit na $size';
  }

  @override
  String get largeFilesTitle => 'Malalaking File';

  @override
  String get selectYourLanguage => 'Piliin ang Lenggwahe';

  @override
  String get analyzingLabel => 'Sinusuri...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count na item';
  }
}
