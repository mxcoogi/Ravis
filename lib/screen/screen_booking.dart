import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_appbar.dart';
import 'package:ravis/widget/widget_calendar.dart';

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
                Text('이 름\t\t\t\t\t\t',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0), // 높이와 여백 조정
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
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0), // 높이와 여백 조정
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
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                        hintText: 'YYYY-MM-DD 형식으로 입력',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0), // 높이와 여백 조정
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                    border: OutlineInputBorder(),
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
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                        border: OutlineInputBorder(),
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
                              border: OutlineInputBorder(),
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
                    height: 50,
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
                              border: OutlineInputBorder(),
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
                    height: 50,
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
                              border: OutlineInputBorder(),
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
                    height: 310,
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
        child: Column(
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
                DropDown()
                
          ],
        ),
      ),
    );
  }

  //Widget buildStep6(){}

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
          buildStep5()
        ],
      ),
    );
  }
}


class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  final _cities = ['서울', '대전', '대구', '부산', '인천', '울산', '광주'];
  String? _selectedCity;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedCity = _cities[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 370,
        child: DropdownButton(
          dropdownColor: Color(0xFFF9F9F9),
          icon: Align(alignment: Alignment.bottomRight,),
          value: _selectedCity,
          items: _cities
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedCity = value!;
            });
          },
        ),
      );
  }
}