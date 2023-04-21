import 'package:flutter/material.dart';
import 'app/core/inject.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependecies();
  runApp(const MyApp());
}
