import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_logo.dart';
import 'package:ravis/screen/screen_main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isAutoLogin = false; // 자동 로그인 상태 변수

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.white,
        child: Stack(
          children: [
            LogoWidget(
                top: screenSize.height * 0.25,
                left: screenSize.width * 0.27,
                width: screenSize.width * 0.2,
                height: screenSize.height * 0.05),
            Positioned(
              left: screenSize.width * 0.045,
              top: screenSize.height * 0.37, // 조정된 위치
              child: _buildInputField(_idController, 'ID를 입력하세요.',
                  icon: Icons.person),
            ),
            Positioned(
              left: screenSize.width * 0.045,
              top: screenSize.height * 0.44, // 조정된 위치
              child: _buildInputField(_passwordController, '비밀번호를 입력하세요.',
                  icon: Icons.lock),
            ),
            Positioned(
              left: screenSize.width * 0.03,
              top: screenSize.height * 0.49, // 조정된 위치
              child: Row(
                children: [
                  Checkbox(
                    value: _isAutoLogin,
                    onChanged: (value) {
                      setState(() {
                        _isAutoLogin = value!;
                      });
                    },
                  ),
                  _buildText('자동로그인', Color(0xFF50555C)),
                ],
              ),
            ),
            Positioned(
              left: screenSize.width * 0.045,
              top: screenSize.height * 0.56, // 조정된 위치
              child: _buildLoginButton(),
            ),
            Positioned(
              left: screenSize.width * 0.1,
              top: screenSize.height * 0.65, // 조정된 위치
              child: _buildText('아이디 찾기', Color(0xFF50555C)),
            ),
            Positioned(
                left: screenSize.width * 0.333,
                top: screenSize.height * 0.65,
                child: Container(
                  width: 1,
                  height: 19,
                  color: Colors.grey,
                )),
            Positioned(
              left: screenSize.width * 0.37,
              top: screenSize.height * 0.65, // 조정된 위치
              child: _buildText('비밀번호 재설정', Color(0xFF50555C)),
            ),
            Positioned(
                left: screenSize.width * 0.6685,
                top: screenSize.height * 0.65,
                child: Container(
                  width: 1,
                  height: 19,
                  color: Colors.grey,
                )),
            Positioned(
              left: screenSize.width * 0.7,
              top: screenSize.height * 0.65, // 조정된 위치
              child: _buildText('회원가입', Color(0xFF50555C)),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: _buildHeader(),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.75,
              child: Container(height: 1.0, width: 100.0, color: Colors.grey),
            ),
            Positioned(
              left: screenSize.width * 0.335,
              top: screenSize.height * 0.74,
              child: Container(
                  height: 20.0,
                  width: 130.0,
                  child: Center(
                    child: Text(
                      "SNS 계정으로 로그인",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  color: Colors.white),
            ),
            Positioned(
                left: screenSize.width * 0.7,
                top: screenSize.height * 0.75,
                child:
                    Container(height: 1.0, width: 100.0, color: Colors.grey)),
            Positioned(
                top: screenSize.height * 0.78,
                left: screenSize.width * 0.19,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset('assets/naverIcon.svg'),
                      onTap: () {},
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      child: SvgPicture.asset('assets/kakaoIcon.svg'),
                      onTap: () {},
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      child: SvgPicture.asset('assets/googleIcon.svg'),
                      onTap: () {},
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      child: SvgPicture.asset('assets/appleIcon.svg'),
                      onTap: () {},
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText,
      {IconData? icon}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Color(0xFFA1A1A1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            icon: icon != null
                ? Icon(icon, color: Color(0xFFA1A1A1))
                : null, // 아이콘 추가
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: _isLoading
          ? null
          : () {
              String username = _idController.text;
              String password = _passwordController.text;

              // 로그인 로직 처리
              if (username == "test" && password == "test") {
                setState(() {
                  _isLoading = true; // 로그인 시작
                });

                // 예시로 2초 지연 후 HomeScreen으로 이동
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    _isLoading = false; // 로딩 종료
                  });

                  // 로그인 성공 시 HomeScreen으로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                });
              } else {
                // 로그인 실패 처리 (예: 에러 메시지)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('아이디 또는 비밀번호가 잘못되었습니다.')),
                );
              }
            },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xFF001A51),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator() // 로딩 중이면 스피너 표시
              : Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
