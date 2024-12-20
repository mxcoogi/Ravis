import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_home.dart'; // HomeScreen
import 'package:ravis/screen/screen_danger.dart'; // DangerScreen
import 'package:ravis/screen/screen_coping.dart'; // CopingScreen
import 'package:ravis/screen/screen_contact.dart'; // ContactScreen
import 'package:ravis/screen/screen_myinfo.dart'; // MyInfoScreen
import 'package:ravis/widget/wiget_bottombar.dart'; // CustomBottomNavBar
import 'package:ravis/widget/widget_appbar.dart';
import 'package:ravis/http/info.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 기본적으로 첫 번째 탭 선택
  Map<String, dynamic> info = {'username': '', 'email': '', 'birth': '', 'phonenumber': ''};

  @override
  void initState() {
    super.initState();
    someFunction();  // 화면 초기화 시 비동기 호출
  }

  // 비동기 함수로 사용자 정보 가져오기
  Future<void> someFunction() async {
    try {
      // UserInfo 객체를 생성하고 비동기적으로 사용자 정보 가져오기
      Map<String, dynamic> fetchedInfo = await UserInfo().fetchUserInfo();
      setState(() {
        info = fetchedInfo;  // 비동기 호출 후 UI 상태 갱신
      });
    } catch (e) {
      // 오류 처리
      print("Error: $e");
    }
  }

  // 페이지 리스트 (하단 바에 맞춰 페이지 전환)
  List<Widget> get _pages {
    return [
      HomeScreen(info: info,), // 홈 화면
      DangerScreen(), // 위험지역 화면
      CopingScreen(), // 대처 방법 화면
      ContactScreen(), // 비상 연락 화면
      MyInfoScreen(info: info), // 마이페이지 화면
    ];
  }

  // 하단 바 아이템 클릭 시 페이지 전환
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: _pages[_selectedIndex], // 선택된 페이지를 표시
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
