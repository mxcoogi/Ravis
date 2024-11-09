import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_myinfo.dart'; // MyinfoCard를 import

class MyInfoScreen extends StatefulWidget {
  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    // 화면의 가로 크기 (width) 얻기
    double screenWidth = MediaQuery.of(context).size.width;

    // 기본적인 여백 계산
    double sidePadding = screenWidth * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,  // MyinfoCard의 상단 여백
            left: sidePadding,  // 왼쪽 여백
            right: sidePadding,  // 오른쪽 여백 설정
            child: MyinfoCard(), 
          ),
          Positioned(
            top: 300,
            left: sidePadding,
            child: MyInfo()
            )

        ],
      ),
    );
  }
}
