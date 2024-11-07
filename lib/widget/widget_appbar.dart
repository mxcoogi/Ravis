import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('되나?'),
      backgroundColor: Colors.blue,
      elevation: 0, // 그림자 효과 추가 (10.0은 그림자의 깊이)
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100); // 앱바의 높이 설정
}
