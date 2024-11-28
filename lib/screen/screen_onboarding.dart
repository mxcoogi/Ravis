import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:ravis/screen/screen_login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0; 

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  Widget _buildImage(String assetName, double y) {
    return SvgPicture.asset(
      'assets/$assetName',
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment(0, y),
        fit: BoxFit.contain
        );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      onChange: (index) {
        setState(() {
          currentPage = index;  // 페이지 변경 시 현재 페이지 인덱스 업데이트
        });
      },
      pages: [
        PageViewModel(
          title: "손쉽게 예약하고\n빠르게 대여, 반납해요!",
          body: "RAVIS 대여 예약 서비스",
          image: _buildImage('on1.svg', 0.35),
          decoration: pageDecoration.copyWith(
              fullScreen: true,
              bodyFlex: 20,
              imageFlex: 5,
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF020418), // You can change the color
                height: 1.5, // Adjust line height if needed
              ),
              bodyTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFFA1A1A1), // Adjust the body text color
                height: -0.1,
              )),
        ),
        PageViewModel(
          title: "여행지의 위험 지역을\n미리 파악해요!",
          body: "지역 정보 서비스",
          image: _buildImage('on2.svg', 0.35),
          decoration: pageDecoration.copyWith(
              fullScreen: true,
              bodyFlex: 20,
              imageFlex: 5,
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF020418), // You can change the color
                height: 1.5, // Adjust line height if needed
              ),
              bodyTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFFA1A1A1), // Adjust the body text color
                height: -0.1,
              )),
        ),
        PageViewModel(
          title: "여행 중 발생한 문제 상황에\n빠르게 대처해요!",
          body: "대처 매뉴얼 제공 서비스",
          image: _buildImage('on3.svg', 0.35),
          decoration: pageDecoration.copyWith(
              fullScreen: true,
              bodyFlex: 20,
              imageFlex: 5,
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF020418), // You can change the color
                height: 1.5, // Adjust line height if needed
              ),
              bodyTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFFA1A1A1), // Adjust the body text color
                height: -0.1,
              )),
        ),
        PageViewModel(
          title: "나의 위험 상황을\n손쉽고 빠르게 알려요!",
          body: "긴급 신고 서비스",
          image: _buildImage('on4.svg',0.35),
          decoration: pageDecoration.copyWith(
              fullScreen: true,
              bodyFlex: 20,
              imageFlex: 5,
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF020418), // You can change the color
                height: 1.5, // Adjust line height if needed
              ),
              bodyTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFFA1A1A1), // Adjust the body text color
                height: -0.1,
              )),
        ),
      ],
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showNextButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
      overrideDone: GestureDetector(
        onTap: () {
          _onIntroEnd(context);
        },
        child: Container(
        width: screenSize.width * 0.3,
        height: screenSize.height * 0.05,
        decoration: BoxDecoration(
color: Color(0xFF0567ED),
borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text('시작하기', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),),
      ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xFF0567ED),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
