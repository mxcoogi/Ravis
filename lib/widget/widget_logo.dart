import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  final double top;
  final double left;
  final double width;
  final double height;
  // 생성자에서 top과 left를 받아오기
  LogoWidget({required this.top, required this.left, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top, // 인자로 받은 top 값 사용
      left: left, // 인자로 받은 left 값 사용
      child: SvgPicture.asset(
        'assets/logo.svg', // 로고 파일 경로
        width: width, // 원하는 너비
        height: height, // 원하는 높이
      ),
    );
  }
}