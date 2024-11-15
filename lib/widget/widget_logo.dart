import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {

  final double width;
  final double height;
  // 생성자에서 top과 left를 받아오기
  LogoWidget({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(
        'assets/logo.svg', // 로고 파일 경로
        width: width, // 원하는 너비
        height: height, // 원하는 높이
      );
  }
}