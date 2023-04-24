import 'package:internet_connection_checker/internet_connection_checker.dart';

/// verifica el estado de conexion
Future<bool> hasInternetConnection() async {
  final result = await InternetConnectionChecker().connectionStatus;
  return result == InternetConnectionStatus.connected;
}
