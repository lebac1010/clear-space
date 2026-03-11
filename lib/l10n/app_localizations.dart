import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('de', 'DE'),
    Locale('en'),
    Locale('en', 'GB'),
    Locale('es'),
    Locale('es', '419'),
    Locale('es', 'ES'),
    Locale('fil'),
    Locale('fr'),
    Locale('fr', 'FR'),
    Locale('hi'),
    Locale('hi', 'IN'),
    Locale('id'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('tr'),
    Locale('tr', 'TR'),
    Locale('vi'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Clear Space'**
  String get appTitle;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @cleanupTitle.
  ///
  /// In en, this message translates to:
  /// **'Cleanup'**
  String get cleanupTitle;

  /// No description provided for @photosTitle.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photosTitle;

  /// No description provided for @filesTitle.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get filesTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @storageAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Storage Access Required'**
  String get storageAccessRequired;

  /// No description provided for @storageAccessDesc.
  ///
  /// In en, this message translates to:
  /// **'Clear Space needs \"All files access\" to scan your device for duplicates, large files, and junk files.\n\nYou will be directed to System Settings to grant this permission when you tap Grant Permission.'**
  String get storageAccessDesc;

  /// No description provided for @grantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @analyze.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get analyze;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// No description provided for @itemsSelected.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No items} =1{1 item} other{{count} items}} selected'**
  String itemsSelected(int count);

  /// No description provided for @onboardingWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the smartest way to keep your device clean, fast, and secure.'**
  String get onboardingWelcome;

  /// No description provided for @onboardingFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Powerful Features'**
  String get onboardingFeaturesTitle;

  /// No description provided for @onboardingFeaturesDesc.
  ///
  /// In en, this message translates to:
  /// **'Everything you need to manage your storage efficiently.'**
  String get onboardingFeaturesDesc;

  /// No description provided for @feature1Title.
  ///
  /// In en, this message translates to:
  /// **'Understand your storage'**
  String get feature1Title;

  /// No description provided for @feature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Get a clear visual breakdown of what\'s taking up space.'**
  String get feature1Desc;

  /// No description provided for @feature2Title.
  ///
  /// In en, this message translates to:
  /// **'Clean safely'**
  String get feature2Title;

  /// No description provided for @feature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Remove unnecessary files with safe deletion protocols.'**
  String get feature2Desc;

  /// No description provided for @feature3Title.
  ///
  /// In en, this message translates to:
  /// **'Free up space'**
  String get feature3Title;

  /// No description provided for @feature3Desc.
  ///
  /// In en, this message translates to:
  /// **'Instantly find and remove junk, large files, and duplicates.'**
  String get feature3Desc;

  /// No description provided for @termsDesc.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms of Service & Privacy Policy.'**
  String get termsDesc;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectLanguage;

  /// No description provided for @changeLaterInSettings.
  ///
  /// In en, this message translates to:
  /// **'You can change this later in Settings.'**
  String get changeLaterInSettings;

  /// No description provided for @photosAndImages.
  ///
  /// In en, this message translates to:
  /// **'Photos & Images'**
  String get photosAndImages;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @audio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// No description provided for @documentsAndFiles.
  ///
  /// In en, this message translates to:
  /// **'Documents & Files'**
  String get documentsAndFiles;

  /// No description provided for @systemAndApps.
  ///
  /// In en, this message translates to:
  /// **'System & Apps'**
  String get systemAndApps;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'OTHER'**
  String get other;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @smartCleanupPlan.
  ///
  /// In en, this message translates to:
  /// **'Smart Cleanup Plan'**
  String get smartCleanupPlan;

  /// No description provided for @analyzingSafeToDelete.
  ///
  /// In en, this message translates to:
  /// **'Analyzing safe-to-delete files...'**
  String get analyzingSafeToDelete;

  /// No description provided for @returnToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Return to Dashboard'**
  String get returnToDashboard;

  /// No description provided for @returnDirectlyToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Return directly to Dashboard'**
  String get returnDirectlyToDashboard;

  /// No description provided for @appearanceAndLanguage.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Language'**
  String get appearanceAndLanguage;

  /// No description provided for @supportAndEngagement.
  ///
  /// In en, this message translates to:
  /// **'Support & Engagement'**
  String get supportAndEngagement;

  /// No description provided for @scanPreferences.
  ///
  /// In en, this message translates to:
  /// **'Scan Preferences'**
  String get scanPreferences;

  /// No description provided for @legalAndAppInfo.
  ///
  /// In en, this message translates to:
  /// **'Legal & App Info'**
  String get legalAndAppInfo;

  /// No description provided for @cleanupHistory.
  ///
  /// In en, this message translates to:
  /// **'Cleanup History'**
  String get cleanupHistory;

  /// No description provided for @viewPastCleaning.
  ///
  /// In en, this message translates to:
  /// **'View your past cleaning activities'**
  String get viewPastCleaning;

  /// No description provided for @sendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedback;

  /// No description provided for @reportBugs.
  ///
  /// In en, this message translates to:
  /// **'Report bugs or suggest improvements'**
  String get reportBugs;

  /// No description provided for @rateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate Us 5 Stars'**
  String get rateUs;

  /// No description provided for @helpOthers.
  ///
  /// In en, this message translates to:
  /// **'Help others find Clear Space'**
  String get helpOthers;

  /// No description provided for @shareWithFriends.
  ///
  /// In en, this message translates to:
  /// **'Share with Friends'**
  String get shareWithFriends;

  /// No description provided for @recommendApp.
  ///
  /// In en, this message translates to:
  /// **'Recommend the app via messages'**
  String get recommendApp;

  /// No description provided for @similarPhotoSensitivity.
  ///
  /// In en, this message translates to:
  /// **'Similar Photo Sensitivity'**
  String get similarPhotoSensitivity;

  /// No description provided for @largeFileThreshold.
  ///
  /// In en, this message translates to:
  /// **'Large File Threshold'**
  String get largeFileThreshold;

  /// No description provided for @strict.
  ///
  /// In en, this message translates to:
  /// **'Strict'**
  String get strict;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @loose.
  ///
  /// In en, this message translates to:
  /// **'Loose'**
  String get loose;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @howWeProtectData.
  ///
  /// In en, this message translates to:
  /// **'How we protect your data'**
  String get howWeProtectData;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @rulesAndGuidelines.
  ///
  /// In en, this message translates to:
  /// **'Rules and guidelines'**
  String get rulesAndGuidelines;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get appVersion;

  /// No description provided for @emailRestricted.
  ///
  /// In en, this message translates to:
  /// **'Email functionality restricted by device.'**
  String get emailRestricted;

  /// No description provided for @browserLaunchFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not launch browser.'**
  String get browserLaunchFailed;

  /// No description provided for @storeUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Store service temporarily unavailable.'**
  String get storeUnavailable;

  /// No description provided for @browserRestricted.
  ///
  /// In en, this message translates to:
  /// **'Browser access restricted on this device.'**
  String get browserRestricted;

  /// No description provided for @shareUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Share functionality unavailable.'**
  String get shareUnavailable;

  /// No description provided for @keepPhoneClean.
  ///
  /// In en, this message translates to:
  /// **'Keep your phone clean with Clear Space'**
  String get keepPhoneClean;

  /// No description provided for @duplicateFiles.
  ///
  /// In en, this message translates to:
  /// **'Duplicate Files'**
  String get duplicateFiles;

  /// No description provided for @findIdenticalFiles.
  ///
  /// In en, this message translates to:
  /// **'Find and remove identical files'**
  String get findIdenticalFiles;

  /// No description provided for @similarPhotos.
  ///
  /// In en, this message translates to:
  /// **'Similar Photos'**
  String get similarPhotos;

  /// No description provided for @findKeyMoments.
  ///
  /// In en, this message translates to:
  /// **'Find key photo moments'**
  String get findKeyMoments;

  /// No description provided for @largeFiles.
  ///
  /// In en, this message translates to:
  /// **'Large Files'**
  String get largeFiles;

  /// No description provided for @filesLargerThan.
  ///
  /// In en, this message translates to:
  /// **'Files larger than {size}'**
  String filesLargerThan(String size);

  /// No description provided for @screenshots.
  ///
  /// In en, this message translates to:
  /// **'Screenshots'**
  String get screenshots;

  /// No description provided for @findAndDeleteScreenshots.
  ///
  /// In en, this message translates to:
  /// **'Find and delete screenshots'**
  String get findAndDeleteScreenshots;

  /// No description provided for @downloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// No description provided for @manageDownloadedFiles.
  ///
  /// In en, this message translates to:
  /// **'Manage your downloaded files'**
  String get manageDownloadedFiles;

  /// No description provided for @tempAndLogFiles.
  ///
  /// In en, this message translates to:
  /// **'Temporary & Log Files'**
  String get tempAndLogFiles;

  /// No description provided for @sizeFound.
  ///
  /// In en, this message translates to:
  /// **'{size} found'**
  String sizeFound(String size);

  /// No description provided for @emptyFolders.
  ///
  /// In en, this message translates to:
  /// **'Empty Folders'**
  String get emptyFolders;

  /// No description provided for @emptyFoldersFound.
  ///
  /// In en, this message translates to:
  /// **'{count} empty folders found'**
  String emptyFoldersFound(int count);

  /// No description provided for @safeApkInstallers.
  ///
  /// In en, this message translates to:
  /// **'Safe APK Installers'**
  String get safeApkInstallers;

  /// No description provided for @cleanOldApks.
  ///
  /// In en, this message translates to:
  /// **'Clean installed/old APKs'**
  String get cleanOldApks;

  /// No description provided for @pleaseScanStorageFirst.
  ///
  /// In en, this message translates to:
  /// **'Please scan storage first'**
  String get pleaseScanStorageFirst;

  /// No description provided for @noJunkFilesFound.
  ///
  /// In en, this message translates to:
  /// **'No junk files found!'**
  String get noJunkFilesFound;

  /// No description provided for @cleanupComplete.
  ///
  /// In en, this message translates to:
  /// **'Cleanup complete!'**
  String get cleanupComplete;

  /// No description provided for @cleanupFailed.
  ///
  /// In en, this message translates to:
  /// **'Cleanup failed: {error}'**
  String cleanupFailed(String error);

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// No description provided for @noLargeFilesFound.
  ///
  /// In en, this message translates to:
  /// **'No large files found!'**
  String get noLargeFilesFound;

  /// No description provided for @noDuplicatesFound.
  ///
  /// In en, this message translates to:
  /// **'No duplicates found!'**
  String get noDuplicatesFound;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// No description provided for @clearHistoryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all cleanup logs?'**
  String get clearHistoryConfirm;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @cleanAllSafeItems.
  ///
  /// In en, this message translates to:
  /// **'Clean All Safe Items'**
  String get cleanAllSafeItems;

  /// No description provided for @deleteFilesQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete files?'**
  String get deleteFilesQuestion;

  /// No description provided for @deleteCountScreenshots.
  ///
  /// In en, this message translates to:
  /// **'Delete {count} screenshots permanently?'**
  String deleteCountScreenshots(int count);

  /// No description provided for @screenshotsDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Screenshots deleted successfully'**
  String get screenshotsDeletedSuccess;

  /// No description provided for @junkFilesFound.
  ///
  /// In en, this message translates to:
  /// **'Junk Files Found'**
  String get junkFilesFound;

  /// No description provided for @noPhotosFound.
  ///
  /// In en, this message translates to:
  /// **'No photos found'**
  String get noPhotosFound;

  /// No description provided for @errorLoadingPhotos.
  ///
  /// In en, this message translates to:
  /// **'Error loading photos: {error}'**
  String errorLoadingPhotos(String error);

  /// No description provided for @deleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Delete failed: {error}'**
  String deleteFailed(String error);

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @contactsNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Contacts List Not Implemented'**
  String get contactsNotImplemented;

  /// No description provided for @smartSelect.
  ///
  /// In en, this message translates to:
  /// **'Smart Select'**
  String get smartSelect;

  /// No description provided for @junkFiles.
  ///
  /// In en, this message translates to:
  /// **'Junk Files'**
  String get junkFiles;

  /// No description provided for @potentialSize.
  ///
  /// In en, this message translates to:
  /// **'{size} potential'**
  String potentialSize(String size);

  /// No description provided for @noFilesMatchFilter.
  ///
  /// In en, this message translates to:
  /// **'No files match this filter'**
  String get noFilesMatchFilter;

  /// No description provided for @refreshingAppList.
  ///
  /// In en, this message translates to:
  /// **'Refreshing app list...'**
  String get refreshingAppList;

  /// No description provided for @openingUninstaller.
  ///
  /// In en, this message translates to:
  /// **'Opening uninstaller...'**
  String get openingUninstaller;

  /// No description provided for @uninstallApp.
  ///
  /// In en, this message translates to:
  /// **'Uninstall App'**
  String get uninstallApp;

  /// No description provided for @uninstall.
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get uninstall;

  /// No description provided for @sortLargest.
  ///
  /// In en, this message translates to:
  /// **'Largest'**
  String get sortLargest;

  /// No description provided for @sortSmallest.
  ///
  /// In en, this message translates to:
  /// **'Smallest'**
  String get sortSmallest;

  /// No description provided for @sortNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get sortNewest;

  /// No description provided for @sortAZ.
  ///
  /// In en, this message translates to:
  /// **'A-Z'**
  String get sortAZ;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get pageNotFound;

  /// No description provided for @goToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Go to Dashboard'**
  String get goToDashboard;

  /// No description provided for @deleteFilesTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Files'**
  String get deleteFilesTitle;

  /// No description provided for @smartCleanupPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Cleanup Plan'**
  String get smartCleanupPlanTitle;

  /// No description provided for @screenshotsCleanerTitle.
  ///
  /// In en, this message translates to:
  /// **'Screenshots Cleaner'**
  String get screenshotsCleanerTitle;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @appManagerTitle.
  ///
  /// In en, this message translates to:
  /// **'App Manager'**
  String get appManagerTitle;

  /// No description provided for @searchApps.
  ///
  /// In en, this message translates to:
  /// **'Search apps...'**
  String get searchApps;

  /// No description provided for @noAppsFound.
  ///
  /// In en, this message translates to:
  /// **'No apps found'**
  String get noAppsFound;

  /// No description provided for @noMatchingApps.
  ///
  /// In en, this message translates to:
  /// **'No matching apps'**
  String get noMatchingApps;

  /// No description provided for @uninstallConfirmMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to uninstall \"{appName}\" ({size})?'**
  String uninstallConfirmMsg(String appName, String size);

  /// No description provided for @uninstallActionDesc.
  ///
  /// In en, this message translates to:
  /// **'This will remove the app and all its data.'**
  String get uninstallActionDesc;

  /// No description provided for @appsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} apps'**
  String appsCount(int count);

  /// No description provided for @appsShowingCount.
  ///
  /// In en, this message translates to:
  /// **'{showing} / {total} apps'**
  String appsShowingCount(int showing, int total);

  /// No description provided for @duplicates.
  ///
  /// In en, this message translates to:
  /// **'Duplicates'**
  String get duplicates;

  /// No description provided for @similar.
  ///
  /// In en, this message translates to:
  /// **'Similar'**
  String get similar;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @pageNotFoundDesc.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for does not exist.'**
  String get pageNotFoundDesc;

  /// No description provided for @allClean.
  ///
  /// In en, this message translates to:
  /// **'All clean!'**
  String get allClean;

  /// No description provided for @deleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting...'**
  String get deleting;

  /// No description provided for @deleteItemsCount.
  ///
  /// In en, this message translates to:
  /// **'Delete {count} items ({size})'**
  String deleteItemsCount(int count, String size);

  /// No description provided for @deletedCountMsg.
  ///
  /// In en, this message translates to:
  /// **'Deleted {count} items ({size})'**
  String deletedCountMsg(int count, String size);

  /// No description provided for @actionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get actionCannotBeUndone;

  /// No description provided for @cleanupBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Cleanup Breakdown'**
  String get cleanupBreakdown;

  /// No description provided for @smartCleanupDesc.
  ///
  /// In en, this message translates to:
  /// **'We automatically keep the best version of your photos and files.'**
  String get smartCleanupDesc;

  /// No description provided for @cleaning.
  ///
  /// In en, this message translates to:
  /// **'Cleaning...'**
  String get cleaning;

  /// No description provided for @cleanUpSize.
  ///
  /// In en, this message translates to:
  /// **'Clean Up {size}'**
  String cleanUpSize(String size);

  /// No description provided for @youSavedSize.
  ///
  /// In en, this message translates to:
  /// **'You saved {size}'**
  String youSavedSize(String size);

  /// No description provided for @youreAllSet.
  ///
  /// In en, this message translates to:
  /// **'You\'re All Set!'**
  String get youreAllSet;

  /// No description provided for @noSmartCleanupItems.
  ///
  /// In en, this message translates to:
  /// **'No duplicate or similar files found.'**
  String get noSmartCleanupItems;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @keep.
  ///
  /// In en, this message translates to:
  /// **'KEEP'**
  String get keep;

  /// No description provided for @deselectAll.
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get deselectAll;

  /// No description provided for @images.
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get images;

  /// No description provided for @docs.
  ///
  /// In en, this message translates to:
  /// **'Docs'**
  String get docs;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @deleteConfirmMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} selected files?\n\nItems will be moved to Trash if supported, or permanently deleted.'**
  String deleteConfirmMsg(int count);

  /// No description provided for @screenshotsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No screenshots} =1{1 screenshot} other{{count} screenshots}}'**
  String screenshotsCount(int count);

  /// No description provided for @selectedCountSize.
  ///
  /// In en, this message translates to:
  /// **'Selected: {count} ({size})'**
  String selectedCountSize(int count, String size);

  /// No description provided for @deleteSelectedSize.
  ///
  /// In en, this message translates to:
  /// **'Delete Selected ({size})'**
  String deleteSelectedSize(String size);

  /// No description provided for @deleteFailedGeneral.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete some items. Please try again.'**
  String get deleteFailedGeneral;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @strictSensitivity.
  ///
  /// In en, this message translates to:
  /// **'Strict (95% Match)'**
  String get strictSensitivity;

  /// No description provided for @normalSensitivity.
  ///
  /// In en, this message translates to:
  /// **'Normal (85% Match)'**
  String get normalSensitivity;

  /// No description provided for @looseSensitivity.
  ///
  /// In en, this message translates to:
  /// **'Loose (75% Match)'**
  String get looseSensitivity;

  /// No description provided for @sensitivityDesc.
  ///
  /// In en, this message translates to:
  /// **'Choose how strictly the app identifies similar photos. A stricter setting means photos must look nearly identical to be flagged.'**
  String get sensitivityDesc;

  /// No description provided for @strictSensitivityDesc.
  ///
  /// In en, this message translates to:
  /// **'95% Match — Nearly identical only'**
  String get strictSensitivityDesc;

  /// No description provided for @normalSensitivityDesc.
  ///
  /// In en, this message translates to:
  /// **'85% Match — Recommended'**
  String get normalSensitivityDesc;

  /// No description provided for @looseSensitivityDesc.
  ///
  /// In en, this message translates to:
  /// **'75% Match — Catches more variations'**
  String get looseSensitivityDesc;

  /// No description provided for @sensitivityUpdated.
  ///
  /// In en, this message translates to:
  /// **'Sensitivity setting updated. It will apply on the next scan.'**
  String get sensitivityUpdated;

  /// No description provided for @thresholdDesc.
  ///
  /// In en, this message translates to:
  /// **'Files larger than this value will be flagged for cleanup.'**
  String get thresholdDesc;

  /// No description provided for @thresholdUpdated.
  ///
  /// In en, this message translates to:
  /// **'Threshold updated. It will apply on the next scan.'**
  String get thresholdUpdated;

  /// No description provided for @largerThanSize.
  ///
  /// In en, this message translates to:
  /// **'Larger than {size}'**
  String largerThanSize(String size);

  /// No description provided for @madeWithHeart.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ for a cleaner phone'**
  String get madeWithHeart;

  /// No description provided for @versionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Version unavailable'**
  String get versionUnavailable;

  /// No description provided for @emailNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Could not open email client. Please email us directly.'**
  String get emailNotSupported;

  /// No description provided for @clearSpace.
  ///
  /// In en, this message translates to:
  /// **'Clear Space'**
  String get clearSpace;

  /// No description provided for @storageDashboard.
  ///
  /// In en, this message translates to:
  /// **'Storage Dashboard'**
  String get storageDashboard;

  /// No description provided for @itemsCanBeCleaned.
  ///
  /// In en, this message translates to:
  /// **'{count} items can be cleaned'**
  String itemsCanBeCleaned(int count);

  /// No description provided for @storageBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Storage Breakdown'**
  String get storageBreakdown;

  /// No description provided for @cleanup.
  ///
  /// In en, this message translates to:
  /// **'Cleanup'**
  String get cleanup;

  /// No description provided for @suggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get suggestions;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing...'**
  String get analyzing;

  /// No description provided for @keepStorageHealthy.
  ///
  /// In en, this message translates to:
  /// **'Keep your storage healthy'**
  String get keepStorageHealthy;

  /// No description provided for @cleanupHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'We found some files you might want to remove to free up space.'**
  String get cleanupHeaderDesc;

  /// No description provided for @percentUsed.
  ///
  /// In en, this message translates to:
  /// **'{percentage}% Used'**
  String percentUsed(int percentage);

  /// No description provided for @scanPausedBattery.
  ///
  /// In en, this message translates to:
  /// **'Scan Paused (Battery Low)'**
  String get scanPausedBattery;

  /// No description provided for @scanningPhase.
  ///
  /// In en, this message translates to:
  /// **'Scanning {phase}...'**
  String scanningPhase(String phase);

  /// No description provided for @scanningPhasePercent.
  ///
  /// In en, this message translates to:
  /// **'Scanning {phase}... ({percentage}%)'**
  String scanningPhasePercent(String phase, int percentage);

  /// No description provided for @calculating.
  ///
  /// In en, this message translates to:
  /// **'Calculating...'**
  String get calculating;

  /// No description provided for @internalStorage.
  ///
  /// In en, this message translates to:
  /// **'INTERNAL STORAGE'**
  String get internalStorage;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @used.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get used;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @phaseDisk.
  ///
  /// In en, this message translates to:
  /// **'Disk'**
  String get phaseDisk;

  /// No description provided for @phasePhotos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get phasePhotos;

  /// No description provided for @phaseVideos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get phaseVideos;

  /// No description provided for @phaseAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get phaseAudio;

  /// No description provided for @phaseDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get phaseDocuments;

  /// No description provided for @phaseJunk.
  ///
  /// In en, this message translates to:
  /// **'Junk Files'**
  String get phaseJunk;

  /// No description provided for @phaseFolders.
  ///
  /// In en, this message translates to:
  /// **'Folders'**
  String get phaseFolders;

  /// No description provided for @phaseApks.
  ///
  /// In en, this message translates to:
  /// **'APKs'**
  String get phaseApks;

  /// No description provided for @phaseSimilar.
  ///
  /// In en, this message translates to:
  /// **'Similar Photos'**
  String get phaseSimilar;

  /// No description provided for @phaseStorage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get phaseStorage;

  /// No description provided for @totalSize.
  ///
  /// In en, this message translates to:
  /// **'{size} Total'**
  String totalSize(String size);

  /// No description provided for @usedSize.
  ///
  /// In en, this message translates to:
  /// **'{size} Used'**
  String usedSize(String size);

  /// No description provided for @largeFilesTitle.
  ///
  /// In en, this message translates to:
  /// **'Large Files'**
  String get largeFilesTitle;

  /// No description provided for @selectYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectYourLanguage;

  /// No description provided for @analyzingLabel.
  ///
  /// In en, this message translates to:
  /// **'Analyzing...'**
  String get analyzingLabel;

  /// No description provided for @zeroBytes.
  ///
  /// In en, this message translates to:
  /// **'0 B'**
  String get zeroBytes;

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String itemCount(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fil',
    'fr',
    'hi',
    'id',
    'pt',
    'tr',
    'vi',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'de':
      {
        switch (locale.countryCode) {
          case 'DE':
            return AppLocalizationsDeDe();
        }
        break;
      }
    case 'en':
      {
        switch (locale.countryCode) {
          case 'GB':
            return AppLocalizationsEnGb();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return AppLocalizationsEs419();
          case 'ES':
            return AppLocalizationsEsEs();
        }
        break;
      }
    case 'fr':
      {
        switch (locale.countryCode) {
          case 'FR':
            return AppLocalizationsFrFr();
        }
        break;
      }
    case 'hi':
      {
        switch (locale.countryCode) {
          case 'IN':
            return AppLocalizationsHiIn();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
    case 'tr':
      {
        switch (locale.countryCode) {
          case 'TR':
            return AppLocalizationsTrTr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'pt':
      return AppLocalizationsPt();
    case 'tr':
      return AppLocalizationsTr();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
