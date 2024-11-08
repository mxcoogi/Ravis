import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110, // 앱바의 높이 설정
      decoration: BoxDecoration(
        color: Colors.white, // 앱바 배경색
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // 그림자의 색상과 투명도
            blurRadius: 4, // 그림자 흐림 정도
            spreadRadius: 1, // 그림자 확산 정도
            offset: Offset(0, 2), // 그림자의 위치 (앱바 아래로 2px)
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent, // 앱바 배경을 투명하게 설정
        elevation: 0, // 기본 그림자 효과 제거
        leadingWidth: 120, // leading 영역의 너비 조정
        leading: Align(
          alignment: Alignment(0.5, 1), // 아이콘을 세로로 내리기 (y값을 0.8로 설정)
          child: SvgPicture.asset(
            'assets/logo.svg', // 벡터 로고 파일 경로
            width: 100, // 로고 크기
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight, // 오른쪽 정렬
            child: Padding(
              padding: EdgeInsets.only(right: 10, top: 26), // 오른쪽 여백을 추가하여 위치 조정
              child: IconButton(
                icon: Icon(Icons.notifications, color: Color(0xFF444444)), // 알림 아이콘
                onPressed: () {
                  // 알림 아이콘 클릭 시 동작 (여기서는 아무것도 하지 않음)
                  print('알림 아이콘 클릭');
                },
                
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100); // 앱바의 높이 설정
}
