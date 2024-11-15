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
                        SizedBox(height: 20,),
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
                        SizedBox(width: 10,),
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
                      ],
                    ),
                    SizedBox(height: 15,),
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
                        SizedBox(width: 10,),
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
                      ],
                    ),
                    SizedBox(height: 15,),
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
                        SizedBox(width: 10,),
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
                      ],
                    ),
                  
                  ],
                ),
              ),
            )));
  }
}
