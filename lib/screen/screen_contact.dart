import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_bottombar.dart';

class ContactScreen extends StatefulWidget {

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비상연락망')),
      body: Center(
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}