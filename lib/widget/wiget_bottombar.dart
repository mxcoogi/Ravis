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
        selectedItemColor: Color(0xFF1F64C3), // 선택된 아이템 색상 (예: 파란색)
        unselectedItemColor: Color(0xFF666E79), // 선택되지 않은 아이템 색상 (예: 회색)
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/homeIcon.svg',
              width: 30,
              height: 30,
              color: selectedIndex == 0 ? Color(0xFF1F64C3) : Color(0xFF666E79), // 선택된 경우 파란색, 아니면 회색
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/dangerIcon.svg',
              width: 30,
              height: 30,
              color: selectedIndex == 1 ? Color(0xFF1F64C3) : Color(0xFF666E79), // 선택된 경우 파란색, 아니면 회색
            ),
            label: '위험지역',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/copeIcon.svg',
              width: 30,
              height: 30,
              color: selectedIndex == 2 ? Color(0xFF1F64C3) : Color(0xFF666E79), // 선택된 경우 파란색, 아니면 회색
            ),
            label: '대처방법',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/contactIcon.svg',
              width: 30,
              height: 30,
              color: selectedIndex == 3 ? Color(0xFF1F64C3) : Color(0xFF666E79), // 선택된 경우 파란색, 아니면 회색
            ),
            label: '비상 연락',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/myinfoIcon.svg',
              width: 30,
              height: 30,
              color: selectedIndex == 4 ? Color(0xFF1F64C3) : Color(0xFF666E79), // 선택된 경우 파란색, 아니면 회색
            ),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}
