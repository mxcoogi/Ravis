import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_myinfo.dart'; // MyinfoCard를 import
import 'package:ravis/main.dart';
import 'screen_login.dart';

class MyInfoScreen extends StatefulWidget {
  final Map<String, dynamic> info;
  MyInfoScreen({super.key, required this.info});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    // 화면의 가로 크기 (width) 얻기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // 기본적인 여백 계산
    double sidePadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MyinfoCard 위젯
              Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: MyinfoCard(
                    name: widget.info['username'],
                    email: widget.info['email'],
                  )),

              // MyInfo 위젯
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: MyInfo(
                  name: widget.info['username'],
                  birth: widget.info['birth'],
                  phonenum: widget.info['phonenumber'],
                ),
              ),

              // Details 위젯
              Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Details(
                      detail_name: '구매내역',
                      width: screenWidth,
                      height: screenHeight)),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Details(
                    detail_name: '신고내역',
                    width: screenWidth,
                    height: screenHeight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: InkWell(
                  onTap: () async {
                    // 클릭했을 때 처리할 동작
                    print("로그아웃 클릭됨");

                    // 저장된 데이터 삭제 (예: SharedPreferences 또는 다른 storage 사용 시)
                    await storage.deleteAll();

                    // 로그인 화면으로 이동 (로그인 화면이 'LoginScreen'이라고 가정)
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen()), // LoginScreen으로 이동
                    );
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.07,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '로그아웃', // 전달된 detail_name 값 표시
                      style: TextStyle(
                          fontSize: 19,
                          color: Color(0xFF444444),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),

              // 더 많은 위젯이 여기에 추가될 수 있습니다.
            ],
          ),
        ),
      ),
    );
  }
}
