import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ravis/widget/widget_pageroute.dart';
import 'package:ravis/widget/widget_appbar.dart';

class CopingScreen extends StatefulWidget {
  @override
  State<CopingScreen> createState() => _CopingScreenState();
}

class _CopingScreenState extends State<CopingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(213, 194, 207, 246),
                    Color.fromARGB(211, 229, 232, 241)
                  ]),
            ),
            child: Stack(
              children: [
                Positioned(
                    left: -25,
                    top: -55,
                    width: 170,
                    child: SvgPicture.asset('assets/backIcon.svg')),
                Positioned(
                    right: -70,
                    top: 80,
                    width: 170,
                    child: SvgPicture.asset('assets/backIcon.svg')),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 15, right: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' 범죄 및 사고, 대응법은\n RAVIS가 알려드릴께요!',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              print('경범죄 클릭');
                              Navigator.push(context,
                                  CustomPageRoute(page: Misdemeanor()));
                            },
                            child: Container(
                              width: screenWidth * 0.95,
                              height: screenHeight * 0.15,
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '경범죄',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '분실 및 도난, 부당한 체포 및 구금,\n보이스피싱 등',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF666E79)),
                                          ),
                                          Image.asset('assets/coping1.png')
                                        ],
                                      )
                                    ],
                                  )),
                              decoration: BoxDecoration(
                                color: Colors.white
                                    .withOpacity(0.8), // 배경 색과 투명도 조절
                                borderRadius:
                                    BorderRadius.circular(10), // 둥근 테두리
                                border: Border.all(
                                  color: Color.fromARGB(255, 179, 205, 242)
                                      .withOpacity(0.5), // 테두리 색과 투명도
                                  width: 2, // 테두리 두께
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              print('강력범죄 클릭');
                            },
                            child: Container(
                              width: screenWidth * 0.95,
                              height: screenHeight * 0.15,
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '강력범죄',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '납치 및 감금, 마약 소지 및 복용,\n테러 및 폭발 등',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF666E79)),
                                          ),
                                          Image.asset('assets/coping2.png')
                                        ],
                                      )
                                    ],
                                  )),
                              decoration: BoxDecoration(
                                color: Colors.white
                                    .withOpacity(0.8), // 배경 색과 투명도 조절
                                borderRadius:
                                    BorderRadius.circular(10), // 둥근 테두리
                                border: Border.all(
                                  color: Color.fromARGB(255, 179, 205, 242)
                                      .withOpacity(0.5), // 테두리 색과 투명도
                                  width: 2, // 테두리 두께
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              print('사고 및 의료 클릭');
                            },
                            child: Container(
                              width: screenWidth * 0.95,
                              height: screenHeight * 0.15,
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '사고 및 의료',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '단순 사소 및 각종 의료적 대처가\n필요한 상황',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF666E79)),
                                          ),
                                          Image.asset('assets/coping3.png')
                                        ],
                                      )
                                    ],
                                  )),
                              decoration: BoxDecoration(
                                color: Colors.white
                                    .withOpacity(0.8), // 배경 색과 투명도 조절
                                borderRadius:
                                    BorderRadius.circular(10), // 둥근 테두리
                                border: Border.all(
                                  color: Color.fromARGB(255, 179, 205, 242)
                                      .withOpacity(0.5), // 테두리 색과 투명도
                                  width: 2, // 테두리 두께
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}

class Misdemeanor extends StatelessWidget {
  const Misdemeanor({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(title: '경범죄'),
        body: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(213, 194, 207, 246),
                    Color.fromARGB(211, 229, 232, 241)
                  ]),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '현재 어떤 문제가 발생했나요?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('재외공관 연락하기 > ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF444444),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('분실 및 도난');
                            Navigator.push(context,
                                CustomPageRoute(page: MisdemeanorLost()));
                          },
                          child: Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 왼쪽 정렬
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // 아이콘을 맨 아래로 밀기
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '분실 및 도난',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '여권, 현금 등의 분실',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF666E79)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        Alignment.bottomRight, // 오른쪽 하단에 정렬
                                    child: Image.asset('assets/misd1.png'),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                              borderRadius: BorderRadius.circular(10), // 둥근 테두리
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 205, 242)
                                    .withOpacity(0.5), // 테두리 색과 투명도
                                width: 2, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            print('영사콜센터클릭');
                          },
                          child: Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 왼쪽 정렬
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // 아이콘을 맨 아래로 밀기
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '부당 체포',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '구금, 유치, 구속 상황',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF666E79)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        Alignment.bottomRight, // 오른쪽 하단에 정렬
                                    child: Image.asset('assets/misd2.png'),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                              borderRadius: BorderRadius.circular(10), // 둥근 테두리
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 205, 242)
                                    .withOpacity(0.5), // 테두리 색과 투명도
                                width: 2, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('영사콜센터클릭');
                          },
                          child: Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 왼쪽 정렬
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // 아이콘을 맨 아래로 밀기
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '문화재 훼손',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '해외 소재 문화재 파손',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF666E79)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        Alignment.bottomRight, // 오른쪽 하단에 정렬
                                    child: Image.asset('assets/misd3.png'),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                              borderRadius: BorderRadius.circular(10), // 둥근 테두리
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 205, 242)
                                    .withOpacity(0.5), // 테두리 색과 투명도
                                width: 2, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            print('영사콜센터클릭');
                          },
                          child: Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 왼쪽 정렬
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // 아이콘을 맨 아래로 밀기
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '보이스피싱',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '불법 전화금융사기 수법',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF666E79)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        Alignment.bottomRight, // 오른쪽 하단에 정렬
                                    child: Image.asset('assets/misd4.png'),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                              borderRadius: BorderRadius.circular(10), // 둥근 테두리
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 205, 242)
                                    .withOpacity(0.5), // 테두리 색과 투명도
                                width: 2, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('영사콜센터클릭');
                          },
                          child: Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 왼쪽 정렬
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // 아이콘을 맨 아래로 밀기
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '불법 도박',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '불법적인 금품 취득',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF666E79)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        Alignment.bottomRight, // 오른쪽 하단에 정렬
                                    child: Image.asset('assets/misd5.png'),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                              borderRadius: BorderRadius.circular(10), // 둥근 테두리
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 205, 242)
                                    .withOpacity(0.5), // 테두리 색과 투명도
                                width: 2, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            print('영사콜센터클릭');
                          },
                          child: Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 왼쪽 정렬
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // 아이콘을 맨 아래로 밀기
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '사기',
                                        style: TextStyle(
                                            color: Color(0xFF1F64C3),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '타인을 기망한 이익 취득',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF666E79)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        Alignment.bottomRight, // 오른쪽 하단에 정렬
                                    child: Image.asset('assets/misd6.png'),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                              borderRadius: BorderRadius.circular(10), // 둥근 테두리
                              border: Border.all(
                                color: Color.fromARGB(255, 179, 205, 242)
                                    .withOpacity(0.5), // 테두리 색과 투명도
                                width: 2, // 테두리 두께
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}

//분실 및 도난
class MisdemeanorLost extends StatefulWidget {
  const MisdemeanorLost({super.key});

  @override
  State<MisdemeanorLost> createState() => _MisdemeanorLostState();
}

class _MisdemeanorLostState extends State<MisdemeanorLost> {
  int _selectedIndex = 0; // 기본 선택된 버튼 인덱스 (0번 버튼)

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title: '분실 및 도난'),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(213, 194, 207, 246),
                Color.fromARGB(211, 229, 232, 241)
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 25, left: 5, right: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 여권분실 버튼
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0; // 클릭된 버튼의 인덱스를 저장
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Color(0xFF1F64C3).withOpacity(0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _selectedIndex == 0
                                ? Color(0xFF1F64C3).withOpacity(0.4)
                                : Colors.transparent, // 선택된 버튼에 테두리 색상 적용
                            width: 1, // 테두리 두께
                          ),
                        ),
                        child: Text(
                          '여권 분실',
                          style: TextStyle(
                              color: _selectedIndex == 0
                                  ? Color(0xFF001A51)
                                  : Color(0xFF666E79),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    // 현금분실 버튼
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1
                              ? Color(0xFF1F64C3).withOpacity(0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _selectedIndex == 1
                                ? Color(0xFF1F64C3).withOpacity(0.4)
                                : Colors.transparent, // 선택된 버튼에 테두리 색상 적용
                            width: 1, // 테두리 두께
                          ),
                        ),
                        child: Text(
                          '현금 및 수표 분실',
                          style: TextStyle(
                              color: _selectedIndex == 1
                                  ? Color(0xFF001A51)
                                  : Color(0xFF666E79),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    // 항공권분실 버튼
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 2
                              ? Color(0xFF1F64C3).withOpacity(0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _selectedIndex == 2
                                ? Color(0xFF1F64C3).withOpacity(0.4)
                                : Colors.transparent, // 선택된 버튼에 테두리 색상 적용
                            width: 1, // 테두리 두께
                          ),
                        ),
                        child: Text(
                          '항공권 분실',
                          style: TextStyle(
                              color: _selectedIndex == 2
                                  ? Color(0xFF001A51)
                                  : Color(0xFF666E79),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )
                ,SizedBox(height: 40,),
                MisdemeanorLostText(number: _selectedIndex, width: screenWidth, height: screenHeight,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class MisdemeanorLostText extends StatefulWidget {
  final int number; // 외부에서 전달받을 숫자
  final double width;
  final double height;

  const MisdemeanorLostText({
    super.key,
    required this.number,
    required this.width,
    required this.height,
  });

  @override
  _MisdemeanorLostTextState createState() => _MisdemeanorLostTextState();
}

class _MisdemeanorLostTextState extends State<MisdemeanorLostText> {

  // 첫 번째 화면 (여권 분실)
  Widget build1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '''-재외공관(대사관 혹은 총영사관)에서 사건 관할 경찰서의 연락처와 신고방법 및 유의사항을 안내받습니다.
-의사소통의 문제로 어려움을 겪을 경우, 통역 선임을 위한 정보를 제공받습니다.
''',
          style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF555555)),
        ),
        SizedBox(height: 50),
        Text(
          '여권 분실',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1F64C3)),
        ),
        SizedBox(height: 30),
        Text(
          '''-여권을 분실한 경우 그 즉시 가까운 현지 경찰서를 방문하여 여권분실증명서를 작성합니다.
-여권 재발급을 위해 현지 우리 재외공관에 분실증명서, 여권번호, 발행연월일, 사진 2장(여권용 컬러사진) 등을 포함한 서류를 제출합니다.
-신속히 귀국해야 하는 경우에는 여행증명서를 발급받습니다.
※ 여권 분실에 대비하여, 여행 전에 발행연월일, 여행지 우리 재외공관 주소와 연락처 등을 기록해 놓거나, 여권을 복사해갑니다. 단, 여권 분실 시 해당 여권이 위 · 변조되어 범죄에 악용될 가능성이 있으니 분실하지 않도록 유의해야 합니다.
''',
          style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF555555)),
        ),
      ],
    );
  }

  // 두 번째 화면 (현금 분실)
  Widget build2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '''-현금 분실 시, 먼저 경찰서에 신고하여 분실신고서를 작성합니다.
-신고 후, 현금을 분실한 사실을 증명할 수 있는 서류를 작성하여 은행이나 관련 기관에 제출해야 합니다.
-분실된 현금을 복구하는 방법은 국가나 상황에 따라 다르므로, 은행이나 현지 대사관에 문의하여 필요한 절차를 진행합니다.
''',
          style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF555555)),
        ),
        SizedBox(height: 50),
        Text(
          '현금 분실',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1F64C3)),
        ),
        SizedBox(height: 30),
        Text(
          '''-현금을 분실한 경우, 즉시 경찰서에 신고하고, 현금분실증명서를 작성합니다.
-현금 재발급을 위한 절차를 시작하려면, 해당 현금의 소지 사실을 입증할 수 있는 서류를 제출해야 합니다.
-필요 시, 현지 대사관에서 현금 관련 문제를 해결하는 방법을 안내해 줄 수 있습니다.
''',
          style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF555555)),
        ),
      ],
    );
  }

  // 세 번째 화면 (항공권 분실)
  Widget build3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '''-항공권을 분실한 경우, 항공사에 즉시 연락하여 분실 신고를 해야 합니다.
-항공사에서는 해당 항공권의 재발급 절차를 안내하며, 여권 및 신분증 확인이 필요할 수 있습니다.
-항공권 재발급을 위해서는 발권 내역, 비행기 탑승 정보, 여권 등의 서류가 필요합니다.
-분실된 항공권에 대해서는 일부 항공사에서는 온라인 상에서 재발급을 지원하기도 하며, 유효기간 내에 재발급이 가능합니다.
''',
          style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF555555)),
        ),
        SizedBox(height: 50),
        Text(
          '항공권 분실',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1F64C3)),
        ),
        SizedBox(height: 30),
        Text(
          '''-항공권을 분실한 경우, 항공사 고객센터로 연락하여 항공권의 분실 사실을 알리고, 재발급 절차를 진행해야 합니다.
-항공권을 재발급 받기 위해서는 관련 서류와 신분 증명이 필요하며, 발권 당시의 정보가 필요할 수 있습니다.
-항공사에서는 분실된 항공권에 대한 대체 항공권 발급 여부와 관련된 정책을 안내해줍니다.
''',
          style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF555555)),
        ),
      ],
    );
  }

  // 숫자에 따라 빌드하는 화면 선택
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: widget.number == 0
          ? build1()  // 여권 분실
          : widget.number == 1
              ? build2()  // 현금 분실
              : widget.number == 2
                  ? build3()  // 항공권 분실
                  : build1(), // 기본값 (여권 분실, or 기타 항목)
    );
  }
}

