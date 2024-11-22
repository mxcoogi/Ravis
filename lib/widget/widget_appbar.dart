import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart'; // 상태바 제어를 위한 패키지

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, // 상태바 배경을 투명하게 설정
        statusBarIconBrightness:
            Brightness.dark, // 상태바 아이콘을 어두운 색으로 설정 (배터리, 시간 등)
        statusBarBrightness:
            Brightness.light, // 상태바의 글자 색을 밝은 색으로 설정 (안드로이드 11 이상에서 필요)
      ),
    );

    return SafeArea(
      // SafeArea로 감싸서 노치나 상태바와 겹치지 않도록 설정
      child: Container(
        height: 100, // 앱바의 높이 설정
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
          backgroundColor: Colors.white, // 앱바 배경을 투명하게 설정
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
                padding:
                    EdgeInsets.only(right: 25, top: 30), // 오른쪽 여백을 추가하여 위치 조정
                child: InkWell(
                  child: SvgPicture.asset('assets/alramIcon.svg', ), // 알림 아이콘
                  onTap: () {
                    // 알림 아이콘 클릭 시 동작 (여기서는 아무것도 하지 않음)
                    print('알림 아이콘 클릭');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80); // 앱바의 높이 설정
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, // 상태바 배경을 투명하게 설정
        statusBarIconBrightness:
            Brightness.dark, // 상태바 아이콘을 어두운 색으로 설정 (배터리, 시간 등)
        statusBarBrightness:
            Brightness.light, // 상태바의 글자 색을 밝은 색으로 설정 (안드로이드 11 이상에서 필요)
      ),
    );

    return SafeArea(
      // SafeArea로 감싸서 노치나 상태바와 겹치지 않도록 설정
      child: Container(
        height: 80, // 앱바의 높이 설정
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
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 23), // 왼쪽 여백 추가
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black), // 뒤로 가기 화살표 아이콘
          onPressed: () {
            Navigator.pop(context); // 뒤로 가기 버튼 동작
          },
        ),
      ),
      flexibleSpace: Center(
        child: Text(
          title, // 중간에 표시할 텍스트
          style: TextStyle(
            color: Color(0xFF222222), // 텍스트 색상
            fontSize: 18, // 텍스트 크기
            fontWeight: FontWeight.w600, // 텍스트 두께
          ),
        ),
      ),
    ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100); // 앱바의 높이 설정
}
