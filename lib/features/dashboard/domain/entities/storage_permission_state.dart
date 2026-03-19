enum RequiredStorageAccess { media, full }

class StoragePermissionState {
  final bool hasPhotoAccess;
  final bool hasMediaAccess;
  final bool hasAllFilesAccess;
  final bool isPhotoPermanentlyDenied;
  final bool isFullAccessPermanentlyDenied;

  const StoragePermissionState({
    required this.hasPhotoAccess,
    required this.hasMediaAccess,
    required this.hasAllFilesAccess,
    required this.isPhotoPermanentlyDenied,
    required this.isFullAccessPermanentlyDenied,
  });

  const StoragePermissionState.none()
    : hasPhotoAccess = false,
      hasMediaAccess = false,
      hasAllFilesAccess = false,
      isPhotoPermanentlyDenied = false,
      isFullAccessPermanentlyDenied = false;

  bool get hasAnyAccess => hasMediaAccess || hasAllFilesAccess;

  bool get hasFullAccess => hasAllFilesAccess;

  bool get isPartialAccess => hasAnyAccess && !hasFullAccess;

  bool get isPermanentlyDenied =>
      isPhotoPermanentlyDenied || isFullAccessPermanentlyDenied;

  bool get canAccessPhotos => hasPhotoAccess || hasAllFilesAccess;

  bool get canAccessCleanup => hasAllFilesAccess;

  bool get canAccessFiles => hasAllFilesAccess;

  bool isPermanentlyDeniedFor(RequiredStorageAccess requiredAccess) {
    return switch (requiredAccess) {
      RequiredStorageAccess.media => isPhotoPermanentlyDenied,
      RequiredStorageAccess.full => isFullAccessPermanentlyDenied,
    };
  }
}
