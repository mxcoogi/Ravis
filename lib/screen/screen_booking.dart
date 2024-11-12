import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_appbar.dart';

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
  TimeOfDay rentalTime = TimeOfDay.now();

  // Step 3 데이터
  DateTime returnDate = DateTime.now();
  TimeOfDay returnTime = TimeOfDay.now();

  // PageController to handle page transitions
  final PageController _controller = PageController();

  Widget buildStep1() {
    return SingleChildScrollView(
      child: Container
    (
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
            SizedBox(height: 150),
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
    )
    );
  }
  Widget buildStep2(){
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBar(),
      body: PageView(
        controller: _controller,
        children: [
          buildStep1(),
          buildStep2()
        ],
      ),
    );
  }
}
