import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_login.dart';
/*import 'package:flutter_native_splash/flutter_native_splash.dart';*/

void main() {
  runApp(MyApp());
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


