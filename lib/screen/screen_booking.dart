import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ravis/widget/widget_appbar.dart';
import 'package:ravis/widget/widget_calendar.dart';
import 'package:ravis/widget/widget_dropdown.dart';


class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Step 1 데이터
  String name = '';
  String phone = '';
  String birthDate = '';
  String travelName = '';
  String travelCountry = '';

  // Step 2 데이터
  DateTime rentalDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  TimeOfDay rentalTime = TimeOfDay.now();

  // Step 3 데이터
  DateTime returnDate = DateTime.now();
  TimeOfDay returnTime = TimeOfDay.now();

  //Step4 데이터
  String number1 = '';
  String number2 = '';
  String number3 = '';

  //step5
  bool _isAuto = false;

  // PageController to handle page transitions
  final PageController _controller = PageController();

  Widget buildStep1() {
    return SingleChildScrollView(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 회원 정보 타이틀
            Text(
              '회원정보',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // 이름 입력 (이름과 입력 필드를 가로로 배치)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('이름\t\t\t\t\t\t\t',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF555555))),
                SizedBox(width: 20), // 라벨과 입력 필드 사이의 공간
                Expanded(
                  child: Container(
                    height: 50, // 높이 지정
                    color: Color(0xFFF9F9F9),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: '이름을 입력하세요',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 18.0), // 높이와 여백 조정
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 전화번호 입력
            Row(
              children: [
                Text('전화번호',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF555555))),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 50, // 높이 지정
                    color: Color(0xFFF9F9F9),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: '전화번호를 입력하세요',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 18.0), // 높이와 여백 조정
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 생년월일 입력
            Row(
              children: [
                Text('생년월일',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF555555))),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 50, // 높이 지정
                    color: Color(0xAFF9F9F9),
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) {
                        setState(() {
                          birthDate = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'YYYY-MM-DD 형식으로 입력',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xAfA4A4A4),
                          width: 2
                        )),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 18.0), // 높이와 여백 조정
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              '여행 정보',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              '여행명',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF555555)),
            ),
            SizedBox(height: 15),
            Container(
              child: Container(
                height: 50, // 높이 지정
                color: Color(0xFFF9F9F9),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                          color: Color(0xFFA4A4A4),
                          width: 2
                        )),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0), // 높이와 여백 조정
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Text('여행 국가',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF555555))),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 50, // 높이 지정
                    color: Color(0xFFF9F9F9),
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) {
                        setState(() {
                          birthDate = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0), // 높이와 여백 조정
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 145),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
              width: double.infinity, // 너비를 화면 전체로 설정
              decoration: BoxDecoration(
                color: Colors.black, // 배경색을 검정색으로 설정
                borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
              ),
              child: InkWell(
                onTap: () {
                  // 버튼을 눌렀을 때의 동작을 여기에 구현
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  print("다음 버튼이 눌렸습니다.");
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
        ),
      ),
    ));
  }

  Widget buildStep2() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '대여 일시',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFEEEEEE), // 테두리 색
                      width: 2.0, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0), // 테두리 모서리 둥글게
                    ),
                  ),
                  child: CalendarWidget(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '오전',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(12, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print('${index}선택됨');
                            },
                            child: Text('${index}시'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 244, 242, 242),
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // 버튼 모서리 둥글게
                                ),
                                side: BorderSide(
                                  color: Color(0xFFEEEEEE), // 테두리 색
                                  width: 1.0, // 테두리 두께
                                )),
                          ),
                        );
                      }),
                    )),
                SizedBox(height: 15),
                Text(
                  '오후',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(12, (index) {
                        int hour =
                            (index + 12) % 12; // 0 -> 12, 1 -> 1, ..., 11 -> 11
                        String PmTime =
                            (hour == 0) ? '12' : '$hour'; // 12시를 표시하도록 처리

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print('${PmTime}선택됨');
                            },
                            child: Text('${PmTime}시'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 244, 242, 242),
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // 버튼 모서리 둥글게
                                ),
                                side: BorderSide(
                                  color: Color(0xFFEEEEEE), // 테두리 색
                                  width: 1.0, // 테두리 두께
                                )),
                          ),
                        );
                      }),
                    )),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
                  width: double.infinity, // 너비를 화면 전체로 설정
                  decoration: BoxDecoration(
                    color: Colors.black, // 배경색을 검정색으로 설정
                    borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                  ),
                  child: InkWell(
                    onTap: () {
                      // 버튼을 눌렀을 때의 동작을 여기에 구현
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      print("다음 버튼이 눌렸습니다.");
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
            ))));
  }

  Widget buildStep3() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '대여 일시',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFEEEEEE), // 테두리 색
                      width: 2.0, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0), // 테두리 모서리 둥글게
                    ),
                  ),
                  child: CalendarWidget(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '오전',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(12, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print('${index}선택됨');
                            },
                            child: Text('${index}시'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 244, 242, 242),
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // 버튼 모서리 둥글게
                                ),
                                side: BorderSide(
                                  color: Color(0xFFEEEEEE), // 테두리 색
                                  width: 1.0, // 테두리 두께
                                )),
                          ),
                        );
                      }),
                    )),
                SizedBox(height: 15),
                Text(
                  '오후',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(12, (index) {
                        int hour =
                            (index + 12) % 12; // 0 -> 12, 1 -> 1, ..., 11 -> 11
                        String PmTime =
                            (hour == 0) ? '12' : '$hour'; // 12시를 표시하도록 처리

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print('${PmTime}선택됨');
                            },
                            child: Text('${PmTime}시'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 244, 242, 242),
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // 버튼 모서리 둥글게
                                ),
                                side: BorderSide(
                                  color: Color(0xFFEEEEEE), // 테두리 색
                                  width: 1.0, // 테두리 두께
                                )),
                          ),
                        );
                      }),
                    )),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
                  width: double.infinity, // 너비를 화면 전체로 설정
                  decoration: BoxDecoration(
                    color: Colors.black, // 배경색을 검정색으로 설정
                    borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                  ),
                  child: InkWell(
                    onTap: () {
                      // 버튼을 눌렀을 때의 동작을 여기에 구현
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      print("다음 버튼이 눌렸습니다.");
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
            ))));
  }

  Widget buildStep4() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '연락처',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text('대사관',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 60,
                      ),
                      Expanded(
                        child: Container(
                          height: 50, // 높이 지정
                          color: Color(0xFFF9F9F9),
                          child: TextField(
                            keyboardType: TextInputType.datetime,
                            onChanged: (value) {
                              setState(() {
                                birthDate = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // 높이와 여백 조정
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Text('현지 경찰',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Container(
                          height: 50, // 높이 지정
                          color: Color(0xFFF9F9F9),
                          child: TextField(
                            keyboardType: TextInputType.datetime,
                            onChanged: (value) {
                              setState(() {
                                birthDate = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // 높이와 여백 조정
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height:28,
                  ),
                  Row(
                    children: [
                      Text('보호자',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 60,
                      ),
                      Expanded(
                        child: Container(
                          height: 50, // 높이 지정
                          color: Color(0xFFF9F9F9),
                          child: TextField(
                            keyboardType: TextInputType.datetime,
                            onChanged: (value) {
                              setState(() {
                                birthDate = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // 높이와 여백 조정
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 353,
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
                        // 버튼을 눌렀을 때의 동작을 여기에 구현
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        print("다음 버튼이 눌렸습니다.");
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
              ),
            )));
  }

  Widget buildStep5() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '예약 상품',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 370,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(
                    0x201F64C3,
                  ),
                  border: Border.all(
                    color: Color(0xAF1F64C3), // 테두리 색
                    width: 2.0, // 테두리 두께
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0), // 테두리 모서리 둥글게
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 120,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Color(
                              0xFF1F64C3,
                            ),
                            border: Border.all(
                                color: Color(0xAF1F64C3), // 테두리 색
                                width: 0 // 테두리 두께
                                ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0), // 테두리 모서리 둥글게
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '인천국제공항점',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text('RAVIS 응급구조키트 4일', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Text('2024. 10. 04 금'),
                        SizedBox(width: 10,),
                        Container(width: 1, height: 20, color: Colors.grey,),
                        SizedBox(width: 10,),
                        Text('오후 3:10 주문')
                      ],),
                    ],
                  ),
                )),
                SizedBox(height: 50),
                Text('할인', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                DropDown(),
                SizedBox(height: 20,),
                Text('결제 수단', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                PaymentList(),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    value: _isAuto,
                    
                    onChanged: (value) {
                      setState(() {
                        _isAuto = value!;
                      });
                    },
                  ),
                  SizedBox(width: 5,),
                  Text('선택한 결제 수단을 다음에도 사용', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
                    ],
                  ),
                )
                ,SizedBox(height: 50,)
                ,Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('결제 금액', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('00000원', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                ],),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('상품 금액', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  Text('00000원', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
                ],),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('할인 금액', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  Text('00000원', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
                ],),
                SizedBox(height: 30,),
                AgreementForm(),
                SizedBox(height: 20,),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
                    width: double.infinity, // 너비를 화면 전체로 설정
                    decoration: BoxDecoration(
                      color: Colors.black, // 배경색을 검정색으로 설정
                      borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                    ),
                    child: InkWell(
                      onTap: () {
                        // 버튼을 눌렀을 때의 동작을 여기에 구현
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        print("다음 버튼이 눌렸습니다.");
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
                  ),
                SizedBox(height: 15,),

          ],
        ),
      ),
    ));
  }

  Widget buildStep6(){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.all(25),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(' RAVIS 예약이\n 완료되었습니다.', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Color(0xFF1F64C3)),)
          ],),
          SizedBox(height: 40,),
          Container(
            child: SvgPicture.asset('assets/character.svg')
          ),
          SizedBox(height: 70,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('결제 금액', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            Text('00000원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF555555)),)
          ],),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('결제 수단', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            Text('카카오페이', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF555555)),)
          ],),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('처리상태', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            Text('결제완료', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF555555)),)
          ],),
          SizedBox(height: 60,),
          Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
                    width: double.infinity, // 너비를 화면 전체로 설정
                    decoration: BoxDecoration(
                      color: Colors.black, // 배경색을 검정색으로 설정
                      borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
                    ),
                    child: InkWell(
                      onTap: () {
            // 페이지를 이전 페이지로 이동
            Navigator.pop(context);
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
                  )
        ],
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBar(),
      body: PageView(
        controller: _controller,
        children: [
          buildStep1(),
          buildStep2(),
          buildStep3(),
          buildStep4(),
          buildStep5(),
          buildStep6()
        ],
      ),
    );
  }
}


class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  int _selectedIndex = -1; // 선택된 인덱스를 저장

  final List<String> paymentMethods = [
    '토스페이', 
    '카카오페이', 
    '무통장 입금', 
    '일반결제'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(paymentMethods.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index; // 선택된 인덱스를 업데이트
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
              border: Border.all(
                color: Color(0xFFF7F7F7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                // 동그란 체크박스
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _selectedIndex == index ? Colors.blue : Colors.white,
                    border: Border.all(
                      color: Color(0x30A4A4A4),
                      width: 2,
                    ),
                  ),
                  child: _selectedIndex == index
                      ? Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        )
                      : null,
                ),
                SizedBox(width: 15), // 체크박스와 텍스트 사이의 간격
                Expanded(
                  child: Text(
                    paymentMethods[index], // 결제 방법 리스트에 맞는 텍스트
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isAuto = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAuto = !_isAuto;
        });
      },
      child: ClipOval(
        child: Container(
          width: 50,  // 동그라미의 너비
          height: 50, // 동그라미의 높이
          color: _isAuto ? Colors.green : Colors.grey, // 선택 여부에 따라 색상 변경
          child: Center(
            child: Icon(
              _isAuto ? Icons.check : Icons.check_box_outline_blank,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AgreementForm extends StatefulWidget {
  @override
  _AgreementFormState createState() => _AgreementFormState();
}

class _AgreementFormState extends State<AgreementForm> {

  bool _isTermsChecked = false;
  bool _isLocationChecked = false;
  bool _isPrivacyChecked = false;
  bool _isPrivacySharingChecked = false;
  bool _isPaymentChecked = false;
  bool _isBookingChecked = false;

  // 체크박스를 눌렀을 때 나머지 체크박스들도 모두 자동으로 눌리게끔 설정하는 함수
  void _onBookingCheckedChanged(bool? value) {
    setState(() {
      _isBookingChecked = value!;
      // 예약 내용 확인 및 결제 동의가 체크되면 모든 체크박스를 체크함
      if (_isBookingChecked) {
        _isTermsChecked = true;
        _isLocationChecked = true;
        _isPrivacyChecked = true;
        _isPrivacySharingChecked = true;
        _isPaymentChecked = true;
      } else {
        _isTermsChecked = false;
        _isLocationChecked = false;
        _isPrivacyChecked = false;
        _isPrivacySharingChecked = false;
        _isPaymentChecked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: _isBookingChecked,
                onChanged: _onBookingCheckedChanged,
                activeColor: Colors.blue,
                checkColor: Colors.white,
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  '예약 내용 확인 및 결제 동의',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        _buildCheckboxItem(
          value: _isTermsChecked,
          onChanged: (value) {
            setState(() {
              _isTermsChecked = value!;
            });
          },
          label: "필수) 알림 서비스 이용약관 동의",
        ),
        _buildCheckboxItem(
          value: _isLocationChecked,
          onChanged: (value) {
            setState(() {
              _isLocationChecked = value!;
            });
          },
          label: "필수) 위치기반 서비스 이용약관 동의",
        ),
        _buildCheckboxItem(
          value: _isPrivacyChecked,
          onChanged: (value) {
            setState(() {
              _isPrivacyChecked = value!;
            });
          },
          label: "필수) 개인정보 수집 / 이용 동의",
        ),
        _buildCheckboxItem(
          value: _isPrivacySharingChecked,
          onChanged: (value) {
            setState(() {
              _isPrivacySharingChecked = value!;
            });
          },
          label: "필수) 개인정보 제3자 정보 제공 동의",
        ),
        _buildCheckboxItem(
          value: _isPaymentChecked,
          onChanged: (value) {
            setState(() {
              _isPaymentChecked = value!;
            });
          },
          label: "필수) 결제대행 서비스 이용약관 동의",
        ),
      ],
    );
  }

  Widget _buildCheckboxItem({
    required bool value,
    required ValueChanged<bool?> onChanged,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
            checkColor: Colors.white,
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


