import 'package:permission_handler/permission_handler.dart';

abstract class DevicePermission {
  DevicePermission._();

  /// Obtiene la ubicacion y activa la geolocalizacion
  static Future<bool> getLocation() async {
    try {
      final isGranted = await Permission.sensors.isGranted;
      if (isGranted) {
        return isGranted;
      }
      final status = await requestPermission(Permission.location);
      if (status.isDenied) {
        return false;
      }
      if (status.isGranted) {
        // We didn't ask for permission yet or the permission has been denied before but not permanently.
        return status.isGranted;
      }
      // You can can also directly ask the permission about its status.
      if (status.isRestricted) {
        // The OS restricts access, for example because of parental controls.
        return false;
      }
      if (status.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }
      if (status.isPermanentlyDenied) {
        final status = await requestPermission(Permission.location);
        return status.isGranted;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// pide permiso al celular para activar la geolocalizacion
  static Future<PermissionStatus> requestPermission(
    Permission permission,
  ) async {
    final status = await permission.request();
    print(status);
    return status;
  }

  /// Abre las configuraciones del telefono
  static Future<bool> openSettingsApp() async {
    return await openAppSettings();
  }
}
