// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Dọn dẹp';

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
  String get systemTheme => 'Theo hệ thống';

  @override
  String get lightTheme => 'Sáng';

  @override
  String get darkTheme => 'Tối';

  @override
  String get storageAccessRequired => 'Cần quyền truy cập bộ nhớ';

  @override
  String get storageAccessDesc =>
      'Ứng dụng cần quyền \"Truy cập tất cả tệp\" để quét các tệp trùng lặp, tệp lớn và tệp rác trên thiết bị của bạn.\n\nBạn sẽ được chuyển đến Cài đặt hệ thống để cấp quyền này khi nhấn Cấp quyền.';

  @override
  String get grantPermission => 'Cấp Quyền';

  @override
  String get getStarted => 'Bắt Đầu Ngay';

  @override
  String get next => 'Tiếp Tục';

  @override
  String get continueText => 'Tiếp Tục';

  @override
  String get cancel => 'Hủy';

  @override
  String get analyze => 'Phân Tích';

  @override
  String get loading => 'Đang tải...';

  @override
  String get error => 'Lỗi';

  @override
  String get success => 'Thành công';

  @override
  String get noItemsFound => 'Không tìm thấy mục nào';

  @override
  String itemsSelected(int count) {
    return 'Đã chọn $count mục';
  }

  @override
  String get onboardingWelcome =>
      'Cách thông minh nhất để giữ cho thiết bị của bạn luôn sạch sẽ, nhanh chóng và an toàn.';

  @override
  String get onboardingFeaturesTitle => 'Tính năng mạnh mẽ';

  @override
  String get onboardingFeaturesDesc =>
      'Mọi thứ bạn cần để quản lý bộ nhớ hiệu quả.';

  @override
  String get feature1Title => 'Hiểu rõ bộ nhớ';

  @override
  String get feature1Desc =>
      'Xem chi tiết những gì đang chiếm dụng không gian lưu trữ.';

  @override
  String get feature2Title => 'Dọn dẹp an toàn';

  @override
  String get feature2Desc =>
      'Xóa các tệp không cần thiết với giao thức an toàn.';

  @override
  String get feature3Title => 'Giải phóng dung lượng';

  @override
  String get feature3Desc =>
      'Tìm và xóa ngay tệp rác, tệp lớn và tệp trùng lặp.';

  @override
  String get termsDesc =>
      'Bằng việc tiếp tục, bạn đồng ý với Điều khoản Dịch vụ & Chính sách Bảo mật.';
}
