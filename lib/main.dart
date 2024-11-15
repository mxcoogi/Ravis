import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_login.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDateFormatting();
  runApp(MyApp());
  FlutterNativeSplash.remove();
}


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ravis',
      home: LoginScreen(),
    );
  }
}


