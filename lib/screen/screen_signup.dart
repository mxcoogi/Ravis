import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthwordController = TextEditingController();
  final TextEditingController _phonewordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();
  final TextEditingController _passwdcheckController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();
  final PageController _pageController = PageController(); // 페이지 컨트롤러
  var dio = Dio();
  final String url = 'http://10.0.2.2:8000/signup';
  bool isLoading = false;

  String name = '';
  String birth = '';
  String phone = '';
  String id = '';
  String password = '';
  String passwordcheck = '';
  String email = '';
  String domain = '';
  int _currentPage = 0; // 현재 페이지를 추적하는 변수

  // 페이지 변경 시 호출되는 함수
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _updateName(String updatedName) {
    setState(() {
      name = updatedName; // Update the parent's name when called
    });
  }

  void _updatebirth(String updatedName) {
    setState(() {
      birth = updatedName; // Update the parent's name when called
    });
  }

  void _updatephone(String updatedName) {
    setState(() {
      phone = updatedName; // Update the parent's name when called
    });
  }

  void _updateid(String updatedName) {
    setState(() {
      id = updatedName; // Update the parent's name when called
    });
  }

  void _updatepasswd(String updatedName) {
    setState(() {
      password = updatedName; // Update the parent's name when called
    });
  }

  void _updatepasswdcheck(String updatedName) {
    setState(() {
      passwordcheck = updatedName; // Update the parent's name when called
    });
  }

  void _updateemail(String updatedName) {
    setState(() {
      email = updatedName; // Update the parent's name when called
    });
  }

  void _updatedomain(String updatedName) {
    setState(() {
      domain = updatedName; // Update the parent's name when called
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _currentPage == 2
          ? null
          : CustomAppBar(title: '회원가입'), // 페이지3일 때만 AppBar 숨기기
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged, // 페이지가 변경될 때마다 호출
        physics: NeverScrollableScrollPhysics(),
        children: [
          page1(_goToNextPage, _updateName, _updatebirth,
              _updatephone), // 첫 번째 페이지
          page2(_goToNextPage, _updateid, _updatepasswd, _updatepasswdcheck,
              _updateemail, _updatedomain), // 두 번째 페이지
          page3(name, birth, phone, id, password, email, domain), // 세 번째 페이지
        ],
      ),
    );
  }

  Widget page1(void Function() goToNextPage, void Function(String) updateName,
      void Function(String) updatebirth, void Function(String) updatephone) {
    return Padding(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '가입을 위한 정보를\n입력해주세요!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              '회원정보',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555555)),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    border: Border.all(
                        width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                    child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: '이름',
                          hintStyle: TextStyle(
                            color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          updateName(
                              text); // Call the passed callback to update the parent's name
                        }),
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  '내국인',
                  style: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                ),
                Icon(
                  Icons.expand_more, // 아래 방향 화살표 아이콘
                  size: 24, // 아이콘 크기
                  color: Color(0xFF555555), // 아이콘 색상
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    border: Border.all(
                        width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                    child: TextField(
                        controller: _birthwordController,
                        decoration: InputDecoration(
                          hintText: '생년월일',
                          hintStyle: TextStyle(
                            color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          updatebirth(
                              text); // Call the passed callback to update the parent's name
                        }),
                  ),
                ),
                SizedBox(width: 15), // 아이템 간격을 위해 SizedBox 추가
                Row(
                  children: [
                    Text(
                      '남',
                      style: TextStyle(color: Color(0xFF555555), fontSize: 16),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 1,
                      height: 20,
                      color: Color(0xFF555555),
                    ),
                    SizedBox(width: 15),
                    Text(
                      '여',
                      style: TextStyle(color: Color(0xFF555555), fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 45),
            Text(
              '휴대폰 인증',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555555)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CarrierSelection(),
                Text(
                  '알뜰폰',
                  style: TextStyle(fontSize: 15, color: Color(0xFF555555)),
                ),
                Icon(
                  Icons.expand_more, // 아래 방향 화살표 아이콘
                  size: 24, // 아이콘 크기
                  color: Color(0xFF555555), // 아이콘 색상
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    border: Border.all(
                        width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 2.5),
                    child: TextField(
                        controller: _phonewordController,
                        decoration: InputDecoration(
                          hintText: '휴대폰 번호',
                          hintStyle: TextStyle(
                            color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          updatephone(
                              text); // Call the passed callback to update the parent's name
                        }),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 11.5), // 버튼의 높이
                    decoration: BoxDecoration(
                      color: Colors.black, // 배경색을 검정색으로 설정
                      borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                    ),
                    child: InkWell(
                      onTap: () {
                        // 버튼을 눌렀을 때의 동작을 여기에 구현
                        print("다음 버튼이 눌렸습니다.");
                      },
                      child: Center(
                        child: Text(
                          '인증 요청',
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색을 흰색으로 설정
                            fontSize: 12, // 글자 크기
                            fontWeight: FontWeight.w500, // 글자 두께
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 44,
              decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                border: Border.all(
                    width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5.5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '인증번호',
                    hintStyle: TextStyle(
                      color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
              width: double.infinity, // 너비를 화면 전체로 설정
              decoration: BoxDecoration(
                color: Colors.black, // 배경색을 검정색으로 설정
                borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
              ),
              child: InkWell(
                onTap: () {
                  if (name != '' && birth != '' && phone != '') {
                    _goToNextPage(); // 필수 정보가 입력되었으면 페이지 전환
                  } else {
                    // 필수 정보가 입력되지 않았으면 스낵바 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('정보를 입력해주세요'),
                        duration: Duration(seconds: 2), // 스낵바가 2초 동안 표시됩니다.
                      ),
                    );
                  }
                },
                child: Center(
                  child: Text(
                    '다음',
                    style: TextStyle(
                      color: Colors.white, // 텍스트 색을 흰색으로 설정
                      fontSize: 18, // 글자 크기
                      fontWeight: FontWeight.bold, // 글자 두께
                    ),
                  ),
                ),
              ),
            )
          ],
    )));
  }

  Widget page2(
      void Function() goToNextPage,
      void Function(String) updateid,
      void Function(String) updatepasswd,
      void Function(String) updatepasswdcheck,
      void Function(String) updateemail,
      void Function(String) updatedomain) {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: SingleChildScrollView(
        child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '아이디',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF555555)),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border.all(
                      width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                  child: TextField(
                      controller: _idController,
                      decoration: InputDecoration(
                        hintText: '아이디',
                        hintStyle: TextStyle(
                          color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        updateid(
                            text); // Call the passed callback to update the parent's name
                      }),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 11.5), // 버튼의 높이
                  decoration: BoxDecoration(
                    color: Colors.black, // 배경색을 검정색으로 설정
                    borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                  ),
                  child: InkWell(
                    onTap: () {
                      // 버튼을 눌렀을 때의 동작을 여기에 구현
                      print("다음 버튼이 눌렸습니다.");
                    },
                    child: Center(
                      child: Text(
                        '중복 확인',
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색을 흰색으로 설정
                          fontSize: 12, // 글자 크기
                          fontWeight: FontWeight.w500, // 글자 두께
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '영어 소문자와 숫자만 사용하여, 4-12자의 아이디를 입력해주세요.',
            style: TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            '비밀번호',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF555555)),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 44,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              border: Border.all(
                  width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4.5),
              child: TextField(
                  controller: _passwdController,
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                    hintStyle: TextStyle(
                      color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    updatepasswd(
                        text); // Call the passed callback to update the parent's name
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 44,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              border: Border.all(
                  width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
              child: TextField(
                  controller: _passwdcheckController,
                  decoration: InputDecoration(
                    hintText: '비밀번호 확인',
                    hintStyle: TextStyle(
                      color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    updatepasswdcheck(
                        text); // Call the passed callback to update the parent's name
                  }),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '영어 소문자와 숫자만 사용하여, 4-12자의 비밀번호를 입력해주세요.',
            style: TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            '이메일',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF555555)),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border.all(
                      width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                  child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: '이메일',
                        hintStyle: TextStyle(
                          color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        updateemail(
                            text); // Call the passed callback to update the parent's name
                      }),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text('@'),
              SizedBox(
                width: 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border.all(
                      width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                  child: TextField(
                      controller: _domainController,
                      decoration: InputDecoration(
                        hintText: '선택',
                        hintStyle: TextStyle(
                          color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        updatedomain(
                            text); // Call the passed callback to update the parent's name
                      }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 79,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
            width: double.infinity, // 너비를 화면 전체로 설정
            decoration: BoxDecoration(
              color: Colors.black, // 배경색을 검정색으로 설정
              borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
            ),
            child: InkWell(
              onTap: () async {
                if (id != '' && password != '' && email != '' && domain != '') {
                  setState(() {
                    isLoading = true; // 로딩 시작
                  });

                  // 2초 동안 기다리기
                  await Future.delayed(Duration(seconds: 2));

                  try {
                    Map<String, dynamic> data = {
                      "username": name,
                      "id": id,
                      "email": '$email@$domain',
                      "birth": birth,
                      "phonenumber": phone,
                      "password": password
                    };

                    // 요청 보내기
                    Response response = await dio.post(
                      url, // 실제 API URL로 변경
                      data: data,
                    );

                    // 응답 처리
                    if (response.statusCode == 200) {
                      print('성공: ${response.data}');
                      _pageController.jumpToPage(2); // 2번 페이지로 바로 이동
                    } else {
                      print('오류: ${response.statusCode}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('서버 오류가 발생했습니다.')),
                      );
                    }
                  } catch (e) {
                    print('오류: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('요청 중 오류가 발생했습니다.')),
                    );
                  } finally {
                    setState(() {
                      isLoading = false; // 로딩 종료
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('정보를 입력해주세요')),
                  );
                }
              },
              child: Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white), // 로딩 색상
                      )
                    : Text(
                        '가입하기',
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색을 흰색으로 설정
                          fontSize: 18, // 글자 크기
                          fontWeight: FontWeight.bold, // 글자 두께
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget page3(name, birth, phone, id, password, email, domain) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Stack(
        children: [
          Positioned(
            child: SvgPicture.asset('assets/signup1.svg',
            width: 60,
            height: 60,),
            left: -15,
            top: 105,
          ),
          Positioned(
            child: SvgPicture.asset('assets/signup1.svg'),
            right: -40,
            top: 210,
          ),
          Positioned(
            child: SvgPicture.asset('assets/signup2.svg',
            width: 400, height: 400,),
            left: -80,
            bottom: 150,
          ),
          Padding(
              padding: EdgeInsets.only(top: 180, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${name.trim()}님, RAVIS\n회원가입을 축하드립니다',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF020418)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'RAVIS와 함께 안전한 여행되세요!',
                    style: TextStyle(fontSize: 15, color: Color(0xFF555555)),
                  ),
                  SizedBox(
                    height: 500,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
                    width: double.infinity, // 너비를 화면 전체로 설정
                    decoration: BoxDecoration(
                      color: Colors.black, // 배경색을 검정색으로 설정
                      borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          '로그인하러 가기',
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색을 흰색으로 설정
                            fontSize: 18, // 글자 크기
                            fontWeight: FontWeight.bold, // 글자 두께
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildInputField(
      TextEditingController controller, String hintText, String val) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 44,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        border:
            Border.all(width: 2, color: Color(0xFFA4A4A4).withOpacity(0.15)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(0xFFA1A1A1), // 원하는 색상으로 설정
              ),
              border: InputBorder.none,
            ),
            onChanged: (text) {
              setState(() {
                val = text; // TextField에서 입력된 값을 name 변수에 저장
              });
            }),
      ),
    );
  }
}

class CarrierSelection extends StatefulWidget {
  @override
  _CarrierSelectionState createState() => _CarrierSelectionState();
}

class _CarrierSelectionState extends State<CarrierSelection> {
  List<String> carriers = ['SKT', 'KT', 'LG U+'];
  int selectedIndex = -1; // 선택된 항목의 인덱스

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(carriers.length, (index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                // 이미 선택된 항목을 취소하고 새로 선택된 항목을 설정
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: 42,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 동그란 체크박스
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedIndex == index
                          ? Colors.blue
                          : Color(0xFFA4A4A4).withOpacity(0.15),
                    ),
                    child: selectedIndex == index
                        ? Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  SizedBox(width: 8), // 체크박스와 텍스트 사이의 간격
                  Text(
                    carriers[index], // 통신사 이름
                    style: TextStyle(fontSize: 16, color: Color(0xFF555555)),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
