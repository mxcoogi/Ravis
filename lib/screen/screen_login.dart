import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_logo.dart';
import 'package:ravis/screen/screen_main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:ravis/main.dart';
import 'package:ravis/screen/screen_signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isAutoLogin = false; // 자동 로그인 상태 변수
  var dio = Dio();



  Future<void> loginUser(String id, String password) async {
  // 서버 URL
  final String url = 'http://43.203.22.130:8000/login';
  
  try {
    // POST 요청을 보낼 때 필요한 데이터
    final response = await dio.post(url, data: {'id': id, 'password' : password});

    // 요청이 성공한 경우
    if (response.statusCode == 200) {
      // 서버 응답이 성공적일 때 처리
      print("로그인 성공");

      // 응답 데이터에서 JSON 추출
      Map<String, dynamic> jsonData = response.data;  // response.data는 이미 JSON 형식으로 파싱됨

      // access_token 저장
      await storage.write(key: "access_token", value: jsonData["access_token"]);

      

      // 예를 들어, 토큰 저장 또는 화면 전환 등을 할 수 있습니다.
      // 로그인 성공 시 MainScreen으로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      // 로그인 실패 시 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('아이디 또는 비밀번호가 잘못되었습니다.')),
      );
    }
  } catch (error) {
    // 네트워크 오류 처리
    print("에러 발생: $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('네트워크 오류가 발생했습니다. 다시 시도해주세요.')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: 
      Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            LogoWidget(width: screenSize.width * 0.2, height: screenSize.height * 0.05),
            SizedBox(height: 50,),
            _buildInputField(_idController, 'ID를 입력하세요.', false,
                  icon: Icons.person),
                  SizedBox(height: 20,),
            _buildInputField(_passwordController, '비밀번호를 입력하세요.', true,
                  icon: Icons.lock),
              Row(
                children: [
                  SizedBox(width: 10,),
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
            SizedBox(height: 20,),
            _buildLoginButton(),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 20,),
              _buildText('아이디 찾기', Color(0xFF50555C)),
              Container(
                  width: 1,
                  height: 19,
                  color: Colors.grey,
                ),
              _buildText('비밀번호 재설정', Color(0xFF50555C)),
              Container(
                  width: 1,
                  height: 19,
                  color: Colors.grey,
                ),
              _buildText('회원가입', Color(0xFF50555C)),
              SizedBox(width: 20,)
            ],),
            SizedBox(height: 60,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(width: 20,),
              Container(height: 1.0, width: 100.0, color: Colors.grey),
              SizedBox(width: 10,),
              Text(
                      "SNS 계정으로 로그인",
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(width: 10,),
              Container(height: 1.0, width: 100.0, color: Colors.grey),
              SizedBox(width: 20,)
            ],),
            SizedBox(height: 20,),

            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                )
          ],
        )
      ),
    ));
  }

  Widget _buildInputField(TextEditingController controller, String hintText, bool flag,
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: TextField(
          controller: controller,
          obscureText: flag,
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
            if (username.isNotEmpty && password.isNotEmpty) {
              setState(() {
                _isLoading = true; // 로그인 시작
              });

              // 로그인 요청을 서버에 보냄
              loginUser(username, password).then((_) {
                setState(() {
                  _isLoading = false; // 로딩 종료
                });
              }).catchError((error) {
                setState(() {
                  _isLoading = false; // 로딩 종료
                });
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('아이디와 비밀번호를 입력해주세요.')),
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
    return GestureDetector(
      child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      )
    ),
    onTap: (){
      if (text == '회원가입'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
      }
      else{
        print('다른거에요');
      }
    },
    );
  }

}
