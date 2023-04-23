import 'package:permission_handler/permission_handler.dart';

abstract class DevicePermissionRepository {
  Future<PermissionStatus> requestPermission({
    required Permission permission,
  });
}
