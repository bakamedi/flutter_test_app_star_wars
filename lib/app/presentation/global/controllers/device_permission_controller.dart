import 'package:flutter_meedu/meedu.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/inject.dart';
import '../../../domain/repositories/device_repository.dart';

class DevicePermissionController extends SimpleNotifier {
  final DevicePermissionRepository _devicePermissionRepository =
      Repositories.devicePermissionRepo;

  Future<void> requestPermission({
    required Permission permission,
  }) async {
    await _devicePermissionRepository.requestPermission(
      permission: permission,
    );
  }
}

final devicePermissionProvider = SimpleProvider(
  (_) => DevicePermissionController(),
  autoDispose: false,
);
