import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(214, 231, 237, 255),
                    Color.fromARGB(255, 255, 255, 255)
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
                //Positioned(left: 10 , top: 10, child: SvgPicture.asset('assets/backIcon.svg')),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 21, right: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '비상연락망',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '해외 여행 중 발생한 긴급 상황, 도움을 요청하세요!',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF444444)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Container(
                                width: screenWidth * 0.45,
                                height: screenHeight * 0.52,
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
                                            '영사콜센터',
                                            style: TextStyle(
                                                color: Color(0xFF1F64C3),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            '연중무휴 24시간\n상담서비스 제공',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF666E79)),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            Alignment.bottomRight, // 오른쪽 하단에 정렬
                                        child: SvgPicture.asset(
                                            'assets/coping1.svg'),
                                      ),
                                    ],
                                  ),
                                ),
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
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Container(
                                    width: screenWidth * 0.4,
                                    height: screenHeight * 0.25,
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
                                            '영사콜센터',
                                            style: TextStyle(
                                                color: Color(0xFF1F64C3),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            '연중무휴 24시간\n상담서비스 제공',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF666E79)),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            Alignment.bottomRight, // 오른쪽 하단에 정렬
                                        child: SvgPicture.asset(
                                            'assets/coping1.svg'),
                                      ),
                                    ],
                                  ),
                                ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    width: screenWidth * 0.4,
                                    height: screenHeight * 0.25,
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
                                            '영사콜센터',
                                            style: TextStyle(
                                                color: Color(0xFF1F64C3),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            '연중무휴 24시간\n상담서비스 제공',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF666E79)),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            Alignment.bottomRight, // 오른쪽 하단에 정렬
                                        child: SvgPicture.asset(
                                            'assets/coping1.svg'),
                                      ),
                                    ],
                                  ),
                                ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
