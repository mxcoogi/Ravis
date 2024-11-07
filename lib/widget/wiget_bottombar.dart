import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // 원하는 높이로 설정
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/homeIcon.svg',
              width: 30,
              height: 30,
              color: Color(0xFF666E79),
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/dangerIcon.svg',
              width: 30,
              height: 30,
              color: Color(0xFF666E79),
            ),
            label: '위험지역',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/copeIcon.svg',
              width: 30,
              height: 30,
              color: Color(0xFF666E79),
            ),
            label: '대처방법',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/contactIcon.svg',
              width: 30,
              height: 30,
              color: Color(0xFF666E79),
            ),
            label: '비상 연락',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/myinfoIcon.svg',
              width: 30,
              height: 30,
              color: Color(0xFF666E79),
            ),
            label: '마이페이지',
          ),
        ],
        selectedItemColor: Color(0xFF666E79),
        unselectedItemColor: Color(0xFF666E79),
      ),
    );
  }
}
