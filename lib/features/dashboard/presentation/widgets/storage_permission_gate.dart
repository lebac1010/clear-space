import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/storage_provider.dart';
import '../../domain/entities/storage_permission_state.dart';
import 'storage_permission_view.dart';

class StoragePermissionGate extends ConsumerStatefulWidget {
  const StoragePermissionGate({
    super.key,
    required this.requiredAccess,
    required this.builder,
    this.loadingChild,
    this.blockedChild,
  });

  final RequiredStorageAccess requiredAccess;
  final Widget Function(BuildContext context, WidgetRef ref) builder;
  final Widget? loadingChild;
  final Widget? blockedChild;

  @override
  ConsumerState<StoragePermissionGate> createState() =>
      _StoragePermissionGateState();
}

class _StoragePermissionGateState extends ConsumerState<StoragePermissionGate>
    with WidgetsBindingObserver {
  StoragePermissionState? _permissionState;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _refreshPermissionState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshPermissionState();
    }
  }

  Future<void> _refreshPermissionState() async {
    final repository = await ref.read(storageRepositoryProvider.future);
    final permissionState = await repository.getPermissionState();
    if (!mounted) return;

    setState(() {
      _permissionState = permissionState;
      _isLoading = false;
    });
  }

  bool _isAllowed(StoragePermissionState permissionState) {
    return switch (widget.requiredAccess) {
      RequiredStorageAccess.media => permissionState.canAccessPhotos,
      RequiredStorageAccess.full => permissionState.hasFullAccess,
    };
  }

  @override
  Widget build(BuildContext context) {
    final permissionState = _permissionState;
    if (_isLoading && permissionState == null) {
      return widget.loadingChild ??
          const Center(child: CircularProgressIndicator());
    }

    if (permissionState == null || !_isAllowed(permissionState)) {
      return widget.blockedChild ??
          StoragePermissionView(
            requiredAccess: widget.requiredAccess,
            onPermissionGranted: _refreshPermissionState,
          );
    }

    return widget.builder(context, ref);
  }
}
