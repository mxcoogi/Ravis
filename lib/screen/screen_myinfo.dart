import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_bottombar.dart';

class MyInfoScreen extends StatefulWidget {

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('마이페이지')),
      body: Center(
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}