import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_logo.dart';
import 'package:ravis/screen/screen_home.dart';

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
            LogoWidget(top: screenSize.height * 0.3, left: screenSize.width*0.27,
            width : screenSize.width * 0.2, height: screenSize.height * 0.05),
            Positioned(
              left: screenSize.width * 0.043,
              top: screenSize.height * 0.39, // 조정된 위치
              child: _buildInputField(_idController, 'ID를 입력하세요.', icon: Icons.person),
            ),
            Positioned(
              left: screenSize.width * 0.043,
              top: screenSize.height * 0.46, // 조정된 위치
              child: _buildInputField(_passwordController, '비밀번호를 입력하세요.', icon: Icons.lock),
            ),
            Positioned(
              left: screenSize.width * 0.03,
              top: screenSize.height * 0.51, // 조정된 위치
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
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.61, // 조정된 위치
              child: _buildLoginButton(),
            ),
            Positioned(
              left: screenSize.width * 0.1,
              top: screenSize.height * 0.7, // 조정된 위치
              child: _buildText('아이디 찾기', Color(0xFF50555C)),
            ),
            Positioned(
              left: screenSize.width * 0.37,
              top: screenSize.height * 0.7, // 조정된 위치
              child: _buildText('비밀번호 재설정', Color(0xFF50555C)),
            ),
            Positioned(
              left: screenSize.width * 0.7,
              top: screenSize.height * 0.7, // 조정된 위치
              child: _buildText('회원가입', Color(0xFF50555C)),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: _buildHeader(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText, {IconData? icon}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Color(0xFFA1A1A1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            icon: icon != null ? Icon(icon, color: Color(0xFFA1A1A1)) : null, // 아이콘 추가
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
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
          color: Color(0xFFA1A1A1),
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
