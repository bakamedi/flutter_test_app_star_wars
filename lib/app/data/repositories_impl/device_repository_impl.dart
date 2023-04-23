import 'package:permission_handler/permission_handler.dart';

import '../../domain/repositories/device_repository.dart';

class DevicePermissionRepositoryImpl extends DevicePermissionRepository {
  @override
  Future<PermissionStatus> requestPermission({
    required Permission permission,
  }) async {
    final status = await permission.request();
    print(status);
    return status;
  }
}
