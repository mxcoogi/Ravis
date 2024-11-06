import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_bottombar.dart';
class DangerScreen extends StatefulWidget {

  @override
  State<DangerScreen> createState() => _DangerScreenState();
}

class _DangerScreenState extends State<DangerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('위험지역')),
      body: Center(
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}