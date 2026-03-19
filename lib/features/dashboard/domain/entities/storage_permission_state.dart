enum RequiredStorageAccess { media, full }

class StoragePermissionState {
  final bool hasMediaAccess;
  final bool hasAllFilesAccess;
  final bool isPermanentlyDenied;

  const StoragePermissionState({
    required this.hasMediaAccess,
    required this.hasAllFilesAccess,
    required this.isPermanentlyDenied,
  });

  const StoragePermissionState.none()
    : hasMediaAccess = false,
      hasAllFilesAccess = false,
      isPermanentlyDenied = false;

  bool get hasAnyAccess => hasMediaAccess || hasAllFilesAccess;

  bool get hasFullAccess => hasAllFilesAccess;

  bool get isPartialAccess => hasAnyAccess && !hasFullAccess;

  bool get canAccessPhotos => hasMediaAccess || hasAllFilesAccess;

  bool get canAccessCleanup => hasAllFilesAccess;

  bool get canAccessFiles => hasAllFilesAccess;
}
