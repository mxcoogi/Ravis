import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_bottombar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
