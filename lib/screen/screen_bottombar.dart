import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ravis/screen/screen_home.dart';
import 'package:ravis/screen/screen_danger.dart';
import 'package:ravis/screen/screen_coping.dart';
import 'package:ravis/screen/screen_contact.dart';
import 'package:ravis/screen/screen_myinfo.dart';


class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // 현재 선택된 인덱스를 추적
  int _selectedIndex = 0; // 기본 값은 0 (홈 화면)

  // 선택된 인덱스에 맞는 화면으로 이동
  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      // 현재 선택된 화면을 다시 클릭하면 아무 작업도 하지 않음
      return;
    }

    setState(() {
      _selectedIndex = index; // 새로운 화면을 선택
    });

    // 해당 index에 맞는 화면으로 이동
    switch (index) {
      case 0:
        // 홈 화면으로 이동
        if (_selectedIndex != 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
        break;
      case 1:
        // 위험지역 화면으로 이동
        if (_selectedIndex != 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DangerScreen()),
          );
        }
        break;
      case 2:
        // 대처방법 화면으로 이동
        if (_selectedIndex != 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CopingScreen()),
          );
        }
        break;
      case 3:
        // 비상 연락 화면으로 이동
        if (_selectedIndex != 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactScreen()),
          );
        }
        break;
      case 4:
        // 마이페이지 화면으로 이동
        if (_selectedIndex != 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyInfoScreen()),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // 현재 선택된 아이템의 인덱스
      onTap: _onItemTapped, // 아이템 클릭 시 동작
      type: BottomNavigationBarType.fixed, // 애니메이션 없이 고정된 아이템 표시
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/homeIcon.svg',
            width: 24,
            height: 24,
            color: Color(0xFF666E79),
          ),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/dangerIcon.svg',
            width: 24,
            height: 24,
            color: Color(0xFF666E79),
          ),
          label: '위험지역',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/copeIcon.svg',
            width: 24,
            height: 24,
            color: Color(0xFF666E79),
          ),
          label: '대처방법',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/contactIcon.svg', 
            width: 24,
            height: 24,
            color: Color(0xFF666E79),
          ),
          label: '비상 연락',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/myinfoIcon.svg', 
            width: 24,
            height: 24,
            color: Color(0xFF666E79),
          ),
          label: '마이페이지',
        ),
      ],
      selectedItemColor: Color(0xFF666E79), 
      unselectedItemColor: Color(0xFF666E79), 
    );
  }
}