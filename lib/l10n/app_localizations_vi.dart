// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Clear Space';

  @override
  String get dashboardTitle => 'Tổng quan';

  @override
  String get cleanupTitle => 'Dọn dẹp';

  @override
  String get photosTitle => 'Ảnh';

  @override
  String get filesTitle => 'Tệp tin';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get languageTitle => 'Ngôn ngữ';

  @override
  String get themeTitle => 'Giao diện';

  @override
  String get systemTheme => 'Mặc định hệ thống';

  @override
  String get lightTheme => 'Sáng';

  @override
  String get darkTheme => 'Tối';

  @override
  String get storageAccessRequired => 'Cần Quyền Truy Cập Bộ Nhớ';

  @override
  String get storageAccessDesc =>
      'Clear Space chỉ yêu cầu quyền liên quan đến bộ nhớ cho những tính năng dọn dẹp mà bạn chọn sử dụng.';

  @override
  String get storagePermissionDeniedDesc =>
      'Quyền truy cập bộ nhớ đã bị từ chối. Vui lòng bật lại trong Cài đặt để tiếp tục.';

  @override
  String get permissionMediaTitle => 'Ảnh, video và âm thanh';

  @override
  String get permissionMediaDesc =>
      'Dùng để tìm tệp trùng lặp, ảnh tương tự, ảnh chụp màn hình, mục tải xuống và các tệp media dung lượng lớn trên thiết bị của bạn.';

  @override
  String get permissionAllFilesTitle => 'Quyền truy cập tất cả tệp';

  @override
  String get permissionAllFilesDesc =>
      'Dùng cho các tính năng dọn dẹp không phải media như tệp rác, xem APK, xem mục tải xuống và thư mục rỗng.';

  @override
  String get permissionInstalledAppsTitle => 'Ứng dụng đã cài đặt';

  @override
  String get permissionInstalledAppsDesc =>
      'Dùng cho App Manager để hiển thị các ứng dụng hiện có và mở xác nhận gỡ cài đặt Android khi bạn chọn.';

  @override
  String get permissionVisibleProgressTitle => 'Tiến trình hiển thị';

  @override
  String get permissionVisibleProgressDesc =>
      'Dùng để giữ tiến trình quét hoặc dọn dẹp luôn hiển thị khi một tác vụ do bạn khởi chạy đang diễn ra.';

  @override
  String get permissionOnDeviceNote =>
      'Việc phân tích quét và dọn dẹp được thực hiện trên thiết bị của bạn. Clear Space không tải tệp của bạn lên máy chủ của nhà phát triển cho các tính năng này.';

  @override
  String get openSettings => 'Mở Cài đặt';

  @override
  String get grantPermission => 'Cấp Quyền';

  @override
  String get getStarted => 'Bắt Đầu';

  @override
  String get next => 'Tiếp theo';

  @override
  String get continueText => 'Tiếp tục';

  @override
  String get cancel => 'Hủy';

  @override
  String get analyze => 'Phân tích';

  @override
  String get loading => 'Đang tải...';

  @override
  String get error => 'Lỗi';

  @override
  String get success => 'Thành công';

  @override
  String get noItemsFound => 'Không tìm thấy thư mục nào';

  @override
  String itemsSelected(int count) {
    return 'Đã chọn $count mục';
  }

  @override
  String get onboardingWelcome =>
      'Chào mừng đến với phương pháp dọn dẹp, tăng tốc và bảo vệ thiết bị thông minh nhất.';

  @override
  String get onboardingFeaturesTitle => 'Tính năng Mạnh mẽ';

  @override
  String get onboardingFeaturesDesc =>
      'Tất cả những gì bạn cần để quản lý dung lượng lưu trữ hiệu quả.';

  @override
  String get feature1Title => 'Hiểu rõ dung lượng';

  @override
  String get feature1Desc =>
      'Có cái nhìn trực quan về những gì đang chiếm dụng không gian.';

  @override
  String get feature2Title => 'Dọn dẹp an toàn';

  @override
  String get feature2Desc =>
      'Xóa các tệp không cần thiết với giao thức xóa an toàn.';

  @override
  String get feature3Title => 'Giải phóng dung lượng';

  @override
  String get feature3Desc =>
      'Tìm và xóa ngay tệp rác, tệp kích thước lớn và tệp trùng lặp.';

  @override
  String get termsDesc =>
      'Bằng việc tiếp tục, bạn đồng ý với Điều khoản Dịch vụ & Chính sách Bảo mật của chúng tôi.';

  @override
  String get selectLanguage => 'Chọn Ngôn Ngữ';

  @override
  String get changeLaterInSettings =>
      'Bạn có thể thay đổi sau trong phần Cài đặt.';

  @override
  String get photosAndImages => 'Ảnh & Hình ảnh';

  @override
  String get videos => 'Video';

  @override
  String get audio => 'Âm thanh';

  @override
  String get documentsAndFiles => 'Tài liệu & Tệp tin';

  @override
  String get systemAndApps => 'Hệ thống & Ứng dụng';

  @override
  String get other => 'KHÁC';

  @override
  String get review => 'Xem lại';

  @override
  String get viewDetails => 'Xem chi tiết';

  @override
  String get smartCleanupPlan => 'Kế hoạch Dọn dẹp Thông minh';

  @override
  String get analyzingSafeToDelete =>
      'Đang phân tích các tệp an toàn để xóa...';

  @override
  String get returnToDashboard => 'Trở về Tổng quan';

  @override
  String get returnDirectlyToDashboard => 'Trở lại Tổng quan ngay lập tức';

  @override
  String get appearanceAndLanguage => 'Giao diện & Ngôn ngữ';

  @override
  String get supportAndEngagement => 'Hỗ trợ & Tương tác';

  @override
  String get scanPreferences => 'Tùy chọn Quét';

  @override
  String get legalAndAppInfo => 'Pháp lý & Thông tin ứng dụng';

  @override
  String get cleanupHistory => 'Lịch sử Dọn dẹp';

  @override
  String get viewPastCleaning => 'Xem lại các hoạt động dọn dẹp trước đây';

  @override
  String get sendFeedback => 'Gửi Phản hồi';

  @override
  String get reportBugs => 'Báo lỗi hoặc đề xuất cải tiến';

  @override
  String get rateUs => 'Đánh giá 5 Sao';

  @override
  String get helpOthers => 'Giúp người khác tìm thấy Clear Space';

  @override
  String get shareWithFriends => 'Chia sẻ với Bạn bè';

  @override
  String get recommendApp => 'Giới thiệu ứng dụng qua tin nhắn';

  @override
  String get similarPhotoSensitivity => 'Độ nhạy Ảnh tương tự';

  @override
  String get largeFileThreshold => 'Ngưỡng Tệp lớn';

  @override
  String get strict => 'Nghiêm ngặt';

  @override
  String get normal => 'Bình thường';

  @override
  String get loose => 'Lỏng lẻo';

  @override
  String get privacyPolicy => 'Chính sách Bảo mật';

  @override
  String get howWeProtectData => 'Cách chúng tôi bảo vệ dữ liệu của bạn';

  @override
  String get termsOfService => 'Điều khoản Dịch vụ';

  @override
  String get rulesAndGuidelines => 'Quy tắc và hướng dẫn';

  @override
  String get appVersion => 'Phiên bản Ứng dụng';

  @override
  String get emailRestricted => 'Chức năng Email bị hạn chế bởi thiết bị.';

  @override
  String get browserLaunchFailed => 'Không thể mở trình duyệt.';

  @override
  String get storeUnavailable => 'Dịch vụ cửa hàng tạm thời không khả dụng.';

  @override
  String get browserRestricted =>
      'Quyền truy cập trình duyệt bị hạn chế trên thiết bị này.';

  @override
  String get shareUnavailable => 'Chức năng chia sẻ không khả dụng.';

  @override
  String get keepPhoneClean => 'Giữ điện thoại sạch sẽ với Clear Space';

  @override
  String get duplicateFiles => 'Tệp trùng lặp';

  @override
  String get findIdenticalFiles => 'Tìm và xóa các tệp giống hệt nhau';

  @override
  String get similarPhotos => 'Ảnh tương tự';

  @override
  String get findKeyMoments => 'Tìm các khoảnh khắc ảnh chính';

  @override
  String get largeFiles => 'Tệp tin lớn';

  @override
  String filesLargerThan(String size) {
    return 'Các tệp lớn hơn $size';
  }

  @override
  String get screenshots => 'Ảnh chụp màn hình';

  @override
  String get findAndDeleteScreenshots => 'Tìm và xóa ảnh chụp màn hình';

  @override
  String get downloads => 'Tải xuống';

  @override
  String get manageDownloadedFiles => 'Quản lý tệp tải xuống của bạn';

  @override
  String get tempAndLogFiles => 'Tệp Tạm & Tệp Nhật ký';

  @override
  String sizeFound(String size) {
    return 'Đã tìm thấy $size';
  }

  @override
  String get emptyFolders => 'Thư mục rỗng';

  @override
  String emptyFoldersFound(int count) {
    return 'Đã tìm thấy $count thư mục rỗng';
  }

  @override
  String get safeApkInstallers => 'Trình cài đặt APK an toàn';

  @override
  String get cleanOldApks => 'Dọn dẹp APK đã cài đặt/cũ';

  @override
  String get pleaseScanStorageFirst => 'Vui lòng quét dung lượng trước';

  @override
  String get noJunkFilesFound => 'Không tìm thấy tệp rác nào!';

  @override
  String get cleanupComplete => 'Đã dọn dẹp xong!';

  @override
  String cleanupFailed(String error) {
    return 'Dọn dẹp thất bại: $error';
  }

  @override
  String get selectAll => 'Chọn Tất cả';

  @override
  String get noLargeFilesFound => 'Không tìm thấy tệp kích thước lớn nào!';

  @override
  String get noDuplicatesFound => 'Không tìm thấy tệp trùng lặp nào!';

  @override
  String get delete => 'Xóa';

  @override
  String get confirmation => 'Xác nhận';

  @override
  String get clearHistory => 'Xóa Lịch Sử';

  @override
  String get clearHistoryConfirm =>
      'Bạn có chắc muốn xóa toàn bộ nhật ký dọn dẹp không?';

  @override
  String get clearAll => 'Xóa Tất Cả';

  @override
  String get cleanAllSafeItems => 'Dọn dẹp Tất cả Mục Khả dụng';

  @override
  String get deleteFilesQuestion => 'Xóa tệp?';

  @override
  String deleteCountScreenshots(int count) {
    return 'Xóa vĩnh viễn $count ảnh chụp màn hình?';
  }

  @override
  String get screenshotsDeletedSuccess => 'Đã xóa ảnh chụp màn hình thành công';

  @override
  String get junkFilesFound => 'Đã tìm thấy Tệp Rác';

  @override
  String get noPhotosFound => 'Không tìm thấy ảnh';

  @override
  String errorLoadingPhotos(String error) {
    return 'Lỗi khi tải ảnh: $error';
  }

  @override
  String deleteFailed(String error) {
    return 'Xóa thất bại: $error';
  }

  @override
  String get contacts => 'Danh bạ';

  @override
  String get contactsNotImplemented => 'Danh sách danh bạ chưa được triển khai';

  @override
  String get smartSelect => 'Chọn thông minh';

  @override
  String get junkFiles => 'Tệp rác';

  @override
  String potentialSize(String size) {
    return 'Tiềm năng $size';
  }

  @override
  String get noFilesMatchFilter => 'Không có tệp nào khớp với bộ lọc này';

  @override
  String get refreshingAppList => 'Đang làm mới danh sách ứng dụng...';

  @override
  String get openingUninstaller => 'Đang mở trình gỡ cài đặt...';

  @override
  String get uninstallApp => 'Gỡ cài đặt';

  @override
  String get uninstall => 'Gỡ cài đặt';

  @override
  String get sortLargest => 'Lớn nhất';

  @override
  String get sortSmallest => 'Nhỏ nhất';

  @override
  String get sortNewest => 'Mới nhất';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get pageNotFound => 'Không tìm thấy trang';

  @override
  String get goToDashboard => 'Về Tổng quan';

  @override
  String get deleteFilesTitle => 'Xóa Tệp';

  @override
  String get smartCleanupPlanTitle => 'Kế hoạch Dọn dẹp Thông minh';

  @override
  String get screenshotsCleanerTitle => 'Dọn dẹp Ảnh chụp màn hình';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get appManagerTitle => 'Quản lý Ứng dụng';

  @override
  String get searchApps => 'Tìm kiếm ứng dụng...';

  @override
  String get noAppsFound => 'Không tìm thấy ứng dụng';

  @override
  String get noMatchingApps => 'Không có ứng dụng phù hợp';

  @override
  String uninstallConfirmMsg(String appName, String size) {
    return 'Bạn có chắc muốn gỡ cài đặt \"$appName\" ($size)?';
  }

  @override
  String get uninstallActionDesc =>
      'Hành động này sẽ xóa ứng dụng và toàn bộ dữ liệu của nó.';

  @override
  String appsCount(int count) {
    return '$count ứng dụng';
  }

  @override
  String appsShowingCount(int showing, int total) {
    return '$showing / $total ứng dụng';
  }

  @override
  String get duplicates => 'Duplicates';

  @override
  String get similar => 'Similar';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get pageNotFoundDesc => 'The page you are looking for does not exist.';

  @override
  String get allClean => 'Đã sạch sẽ!';

  @override
  String get deleting => 'Đang xóa...';

  @override
  String deleteItemsCount(int count, String size) {
    return 'Xóa $count mục ($size)';
  }

  @override
  String deletedCountMsg(int count, String size) {
    return 'Đã xóa $count mục ($size)';
  }

  @override
  String get actionCannotBeUndone => 'Hành động này không thể hoàn tác.';

  @override
  String get cleanupBreakdown => 'Chi tiết Dọn dẹp';

  @override
  String get smartCleanupDesc =>
      'Chúng tôi tự động giữ lại phiên bản tốt nhất của ảnh và tệp của bạn.';

  @override
  String get cleaning => 'Đang dọn dẹp...';

  @override
  String cleanUpSize(String size) {
    return 'Dọn dẹp $size';
  }

  @override
  String youSavedSize(String size) {
    return 'Bạn đã tiết kiệm được $size';
  }

  @override
  String get youreAllSet => 'Mọi thứ đã sẵn sàng!';

  @override
  String get noSmartCleanupItems =>
      'Không tìm thấy tệp trùng lặp hoặc tương tự.';

  @override
  String get save => 'Lưu';

  @override
  String get keep => 'GIỮ LẠI';

  @override
  String get deselectAll => 'Bỏ chọn tất cả';

  @override
  String get images => 'Hình ảnh';

  @override
  String get docs => 'Tài liệu';

  @override
  String get others => 'Khác';

  @override
  String get all => 'Tất cả';

  @override
  String deleteConfirmMsg(int count) {
    return 'Bạn có chắc chắn muốn xóa $count tệp đã chọn?\n\nCác mục sẽ được chuyển vào Thùng rác nếu được hỗ trợ, hoặc bị xóa vĩnh viễn.';
  }

  @override
  String screenshotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ảnh chụp màn hình',
      one: '1 ảnh chụp màn hình',
      zero: 'Không có ảnh chụp màn hình',
    );
    return '$_temp0';
  }

  @override
  String selectedCountSize(int count, String size) {
    return 'Đã chọn: $count ($size)';
  }

  @override
  String deleteSelectedSize(String size) {
    return 'Xóa mục đã chọn ($size)';
  }

  @override
  String get deleteFailedGeneral =>
      'Không thể xóa một số mục. Vui lòng thử lại.';

  @override
  String get systemDefault => 'Mặc định hệ thống';

  @override
  String get light => 'Sáng';

  @override
  String get dark => 'Tối';

  @override
  String get strictSensitivity => 'Nghiêm ngặt (Khớp 95%)';

  @override
  String get normalSensitivity => 'Bình thường (Khớp 85%)';

  @override
  String get looseSensitivity => 'Lỏng lẻo (Khớp 75%)';

  @override
  String get sensitivityDesc =>
      'Chọn mức độ nghiêm ngặt để ứng dụng xác định ảnh tương tự. Cài đặt càng nghiêm ngặt, các ảnh phải gần như giống hệt nhau mới được đánh dấu.';

  @override
  String get strictSensitivityDesc =>
      'Khớp 95% — Chỉ những ảnh gần như giống hệt nhau';

  @override
  String get normalSensitivityDesc => 'Khớp 85% — Khuyên dùng';

  @override
  String get looseSensitivityDesc => 'Khớp 75% — Bắt được nhiều biến thể hơn';

  @override
  String get sensitivityUpdated =>
      'Cài đặt độ nhạy đã được cập nhật. Sẽ áp dụng vào lần quét tiếp theo.';

  @override
  String get thresholdDesc =>
      'Các tệp lớn hơn giá trị này sẽ được đánh dấu để dọn dẹp.';

  @override
  String get thresholdUpdated =>
      'Ngưỡng đã được cập nhật. Sẽ áp dụng vào lần quét tiếp theo.';

  @override
  String largerThanSize(String size) {
    return 'Lớn hơn $size';
  }

  @override
  String get madeWithHeart => 'Làm bằng ❤️ cho một chiếc điện thoại sạch hơn';

  @override
  String get versionUnavailable => 'Phiên bản không khả dụng';

  @override
  String get emailNotSupported =>
      'Không thể mở ứng dụng gửi email. Vui lòng gửi email trực tiếp cho chúng tôi.';

  @override
  String get clearSpace => 'Clear Space';

  @override
  String get storageDashboard => 'Tổng quan Lưu trữ';

  @override
  String itemsCanBeCleaned(int count) {
    return '$count mục có thể được dọn dẹp';
  }

  @override
  String get storageBreakdown => 'Phân bổ Bộ nhớ';

  @override
  String get cleanup => 'Dọn dẹp';

  @override
  String get suggestions => 'Đề xuất';

  @override
  String get analyzing => 'Đang phân tích...';

  @override
  String get keepStorageHealthy => 'Giữ cho bộ nhớ của bạn khỏe mạnh';

  @override
  String get cleanupHeaderDesc =>
      'Chúng tôi tìm thấy một số tệp bạn có thể muốn xóa để giải phóng dung lượng.';

  @override
  String percentUsed(int percentage) {
    return 'Đã sử dụng $percentage%';
  }

  @override
  String get scanPausedBattery => 'Đã tạm dừng quét (Pin yếu)';

  @override
  String scanningPhase(String phase) {
    return 'Đang quét $phase...';
  }

  @override
  String scanningPhasePercent(String phase, int percentage) {
    return 'Đang quét $phase... ($percentage%)';
  }

  @override
  String get calculating => 'Đang tính toán...';

  @override
  String get internalStorage => 'BỘ NHỚ TRONG';

  @override
  String get free => 'Trống';

  @override
  String get used => 'Đã dùng';

  @override
  String get total => 'Tổng';

  @override
  String get phaseDisk => 'Ổ đĩa';

  @override
  String get phasePhotos => 'Ảnh';

  @override
  String get phaseVideos => 'Video';

  @override
  String get phaseAudio => 'Âm thanh';

  @override
  String get phaseDocuments => 'Tài liệu';

  @override
  String get phaseJunk => 'Tệp rác';

  @override
  String get phaseFolders => 'Thư mục';

  @override
  String get phaseApks => 'APKs';

  @override
  String get phaseSimilar => 'Ảnh tương tự';

  @override
  String get phaseStorage => 'Bộ nhớ';

  @override
  String totalSize(String size) {
    return 'Tổng $size';
  }

  @override
  String usedSize(String size) {
    return 'Đã dùng $size';
  }

  @override
  String get largeFilesTitle => 'Tệp Lớn';

  @override
  String get selectYourLanguage => 'Chọn ngôn ngữ của bạn';

  @override
  String get analyzingLabel => 'Đang phân tích...';

  @override
  String get zeroBytes => '0 B';

  @override
  String itemCount(int count) {
    return '$count mục';
  }
}
