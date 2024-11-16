import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

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
                Positioned(
                    right: 35,
                    top: 600,
                    width: 170,
                    child: SvgPicture.asset('assets/backIcon.svg')),
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
                              InkWell(
                                onTap: () {
                                  print('영사콜센터클릭');
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          '영사관에 연결하시겠어요?',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ), // 팝업 제목
                                        content: Text(
                                          '82-2-3210-0404',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFAAAAAA),
                                              fontWeight: FontWeight.bold),
                                        ), // 팝업 내용
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15), // 둥근 모서리
                                        ),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFEEF6FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10), // 둥근 테두리
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Color(
                                                              0X190567ED))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                            20), // 왼쪽, 오른쪽 여백 설정
                                                    child: TextButton(
                                                      child: Text(
                                                        '취소',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF666E79),
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(); // 팝업을 닫음
                                                      },
                                                    ),
                                                  )),
                                              Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0567ED),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // 둥근 테두리
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: TextButton(
                                                      child: Text(
                                                        '확인',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ), // 버튼 텍스트
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(); // 팝업을 닫음
                                                        _showBottomSheet(
                                                            context,
                                                            screenWidth,
                                                            screenHeight);
                                                      },
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: screenWidth * 0.45,
                                  height: screenHeight * 0.5,
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
                                          alignment: Alignment
                                              .bottomRight, // 오른쪽 하단에 정렬
                                          child: Image.asset(
                                              'assets/contact1.png'),
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
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print('채팅상담');
                                    },
                                    child: Container(
                                      width: screenWidth * 0.4,
                                      height: screenHeight * 0.23,
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.8), // 배경 색과 투명도 조절
                                        borderRadius:
                                            BorderRadius.circular(10), // 둥근 테두리
                                        border: Border.all(
                                          color: Color.fromARGB(
                                                  255, 179, 205, 242)
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
                                                  '채팅 상담',
                                                  style: TextStyle(
                                                      color: Color(0xFF1F64C3),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  '카카오톡, 위챗, 라인',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF666E79)),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment
                                                  .bottomRight, // 오른쪽 하단에 정렬
                                              child: Image.asset(
                                                  'assets/contact2.png'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print('현지 경찰');
                                    },
                                    child: Container(
                                      width: screenWidth * 0.4,
                                      height: screenHeight * 0.25,
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.8), // 배경 색과 투명도 조절
                                        borderRadius:
                                            BorderRadius.circular(10), // 둥근 테두리
                                        border: Border.all(
                                          color: Color.fromARGB(
                                                  255, 179, 205, 242)
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
                                                  '현지 경찰',
                                                  style: TextStyle(
                                                      color: Color(0xFF1F64C3),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  'GPS 기반 경찰 연락망',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF666E79)),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment
                                                  .bottomRight, // 오른쪽 하단에 정렬
                                              child: Image.asset(
                                                  'assets/contact3.png'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            )));
  }
}

void _showBottomSheet(BuildContext context, width, height) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 내용이 많아져도 BottomSheet 크기 조정 가능
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13), color: Colors.white),
        height: height * 0.5,
        width: width, // 팝업창의 높이 설정
        child: Column(
          children: [
            CustomCheckboxList(
              width: width,
              height: height,
            )
          ],
        ),
      );
    },
  );
}

class CustomCheckboxList extends StatefulWidget {
  final double width;
  final double height;
  CustomCheckboxList({super.key, required this.width, required this.height});

  @override
  _CustomCheckboxListState createState() => _CustomCheckboxListState();
}

class _CustomCheckboxListState extends State<CustomCheckboxList> {
  // 각 항목에 대해 체크 상태를 관리하는 리스트
  List<bool> _isChecked = [true, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height * 0.5, // 팝업창의 높이 설정
        width: widget.width * 0.9, // 팝업창의 너비 설정
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                '어떤 도움이 필요하신가요?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              _buildCustomCheckbox(0, '일반 전화 상담', 0),
              SizedBox(height: 15,),
              _buildCustomCheckbox(1, '사건/사고', 1),
              SizedBox(height: 15,),
              _buildCustomCheckbox(2, '외국어 통역서비스', 2),
              SizedBox(height: 15,),
              _buildCustomCheckbox(3, '여권업무 안내', 3),
              SizedBox(height: 15,),
              _buildCustomCheckbox(4, '해외입국 허가요건, 사증 등 기타 안내', 4),
              SizedBox(height: 15,),
              _buildCustomCheckbox(5, '코로나 19 관련 해외입국제한 문의', 5),
              SizedBox(height: 40,),
              Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
                    width: double.infinity, // 너비를 화면 전체로 설정
                    decoration: BoxDecoration(
                      color: Colors.black, // 배경색을 검정색으로 설정
                      borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                       },
                      child: Center(
                        child: Text(
                          '완료',
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색을 흰색으로 설정
                            fontSize: 18, // 글자 크기
                            fontWeight: FontWeight.bold, // 글자 두께
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,)
            ],
          ),
        ));
  }

  // Custom 체크박스를 생성하는 함수
  Widget _buildCustomCheckbox(int number, String label, int index) {
    return 
    Row(
      children: [
        InkWell(
        onTap: () {
            setState(() {
              // 클릭한 체크박스만 true로 설정하고, 나머지 체크박스는 모두 false로 설정
              for (int i = 0; i < _isChecked.length; i++) {
                if (i == index) {
                  _isChecked[i] = true; // 클릭한 항목만 true
                } else {
                  _isChecked[i] = false; // 나머지 항목은 false
                }
              }
            });
          },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: _isChecked[index]
                ? Color(0xFF1F64C3)
                : Colors.transparent, // 체크된 경우 파란색 배경
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey), // 파란색 테두리
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                  color: _isChecked[index] ? Colors.white : Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ),
      ),
      SizedBox(width: 20,),
      Text(label, style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16))

      ],
    );
      

  }


 
}


