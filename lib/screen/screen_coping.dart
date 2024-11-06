import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_bottombar.dart';

class CopingScreen extends StatefulWidget {

  @override
  State<CopingScreen> createState() => _CopingScreenState();
}

class _CopingScreenState extends State<CopingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('대처방법')),
      body: Center(
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

