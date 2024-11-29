import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ravis/widget/widget_appbar.dart';
import 'package:ravis/widget/widget_calendar.dart';
import 'package:ravis/widget/widget_dropdown.dart';
import 'package:ravis/widget/widget_dropdown2.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart'; // intl 패키지 임포트
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, dynamic> info;
  final VoidCallback onFetchData;
  const BookingScreen({super.key, required this.info, required this.onFetchData});
  

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _currentPage = 0; // 현재 페이지를 추적합니다.
  // Step 1 데이터
  String name = '';
  String phone = '';
  String birthDate = '';
  String email = '';
  String travelName = '';
  String travelCountry = '';

  // Step 2 데이터
  DateTime rentalDate = DateTime.now();
  DateTime returnDate = DateTime.now();

  //step5
  bool _isAuto = false;
  Duration difference = Duration(days: 0); // 24일

  String payment = '';

  // PageController to handle page transitions
  final PageController _controller = PageController();

  void updateDates(
      DateTime startDate, DateTime endDate, Duration newDifference) {
    setState(() {
      rentalDate = startDate;
      returnDate = endDate;
      difference = newDifference;
    });
  }

  Future<void> _saveImage(Uint8List bytes, path) async {
    //final directory = await Directory.systemTemp.createTemp();
    final file = File(path);
    // response.data is List<int> type

    // 바이트 데이터를 이미지 파일로 저장
    await file.writeAsBytes(bytes);

    print('이미지 저장 위치: ${file.path}');
  }

  Widget buildStep1() {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    name = widget.info['username'];
    phone = widget.info['phonenumber'];
    birthDate = widget.info['birth'];

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '회원정보',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('이름',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF555555))),
                  Container(
                      height: 50, // 높이 지정
                      width: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9), // 배경 색
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        border: Border.all(
                          color: Color(0xFFEDEDED), // 비활성화 상태에서의 테두리 색
                          width: 2.0, // 테두리 두께
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 18.0), // 여백 적용
                      child: Text(
                        name, // 표시할 텍스트
                        style: TextStyle(
                          color: Color(0xFFAAAAAA), // 텍스트 색
                          fontSize: 16, // 폰트 크기
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('전화번호',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF555555))),
                  Container(
                      height: 50, // 높이 지정
                      width: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9), // 배경 색
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        border: Border.all(
                          color: Color(0xFFEDEDED), // 비활성화 상태에서의 테두리 색
                          width: 2.0, // 테두리 두께
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 18.0), // 여백 적용
                      child: Text(
                        phone, // 표시할 텍스트
                        style: TextStyle(
                          color: Color(0xFFAAAAAA), // 텍스트 색
                          fontSize: 16, // 폰트 크기
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('생년월일',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF555555))),
                  Container(
                      height: 50, // 높이 지정
                      width: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9), // 배경 색
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        border: Border.all(
                          color: Color(0xFFEDEDED), // 비활성화 상태에서의 테두리 색
                          width: 2.0, // 테두리 두께
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 18.0), // 여백 적용
                      child: Text(
                        birthDate, // 표시할 텍스트
                        style: TextStyle(
                          color: Color(0xFFAAAAAA), // 텍스트 색
                          fontSize: 16, // 폰트 크기
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                '여행정보',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('여행명',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF555555))),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    travelName = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true, // 배경색을 채우기 위해 true로 설정
                  fillColor: Color(0xFFF9F9F9), // 배경색 설정 (여기서는 연한 회색)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 18.0), // 높이와 여백 조정

                  // 비활성화된 상태에서의 테두리 색
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFEDEDED), // 기본 테두리 색 (비활성화 상태)
                      width: 2.0, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  // 활성화된 상태에서의 테두리 색
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue, // 활성화 상태에서의 테두리 색
                      width: 2.0, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('여행 국가',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF555555))),
                  DropDown2(
                    width: screenWidth * 0.7,
                    onCountrySelected: (selectedCountry) {
                      setState(() {
                        travelCountry =
                            selectedCountry; // 선택된 국가 값을 travelCountry에 저장
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 150,
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
                    if (travelCountry != '') {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('여행 국가를 선택해주세요'),
                          duration: Duration(seconds: 2), // 메시지가 2초간 표시됩니다
                          backgroundColor: Colors.red, // 배경 색상 (원하는 색으로 변경 가능)
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
              ),
            ],
          ),
        )));
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
                  child: CalendarWidget(
                    rentalDate: rentalDate,
                    returnDate: returnDate,
                    difference: difference,
                    onDatesChanged: updateDates,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '대여 시간',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      child: Text(
                        '확인',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ), // 버튼 텍스트
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      '반납시간',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
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
            ))));
  }

  Widget buildStep5() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
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
                                  '${travelCountry}국제공항점',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'RAVIS 응급구조키트 ${difference.inDays + 1}일',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF222222)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat('yyyy. MM. dd EEEE', 'ko_KR')
                                    .format(DateTime.now()), // 날짜와 요일 포맷
                                style: TextStyle(color: Color(0xFF666E79)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 1,
                                height: 20,
                                color: Color(0xFF666E79),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                DateFormat('a hh:mm', 'ko_KR')
                                        .format(DateTime.now()) +
                                    ' 주문',
                                style: TextStyle(color: Color(0xFF666E79)),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 50),
                Text(
                  '할인',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                DropDown(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '결제 수단',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                PaymentList(
                  onPaymentSelected: (selectedPayment) {
                    setState(() {
                      payment = selectedPayment; // 부모 위젯에서 결제 방법을 갱신
                    });
                  },
                ),
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
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '선택한 결제 수단을 다음에도 사용',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '결제 금액',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222222)),
                    ),
                    Text(
                      '00000원',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222222)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '상품 금액',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF555555)),
                    ),
                    Text(
                      '00000원',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF555555)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '할인 금액',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF555555)),
                    ),
                    Text(
                      '00000원',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF555555)),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                AgreementForm(),
                SizedBox(
                  height: 20,
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
                      // POST 요청을 보낼 URL
                      String url = 'http://43.203.22.130:8000/create-booking';

                      // POST 요청을 위한 데이터 구성
                      Map<String, dynamic> data = {
                        "email": email,
                        "username": name, // username에 name을 넣은 경우
                        "startday": DateFormat('yyyy-MM-dd').format(rentalDate),
                        "endday": DateFormat('yyyy-MM-dd').format(returnDate),
                        "combination": 0, // 실제 값으로 교체
                        'travelCountry': travelCountry,
                      };

                      // Dio 인스턴스 생성
                      Dio dio = Dio();
                      var tempDir = await getApplicationDocumentsDirectory();
                      String path = tempDir.path;
                      String finalPath =
                          "${path}/${email}_${DateFormat('yyyy-MM-dd').format(rentalDate)}_${DateFormat('yyyy-MM-dd').format(returnDate)}.png";
                      try {
                        // POST 요청 보내기
                        Response response = await dio.post(url,
                            data: data,
                            options: Options(
                              responseType:
                                  ResponseType.bytes, // 바이트 형식으로 응답 받기
                            ));
                        if (response.statusCode == 200) {
                          File file = File(finalPath);
                          var raf = file.openSync(mode: FileMode.write);
                          // response.data is List<int> type
                          raf.writeFromSync(response.data);
                          await raf.close();

                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      } catch (e) {
                        // 에러 처리
                        print("Error occurred: $e");
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
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildStep6() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' RAVIS 예약이\n 완료되었습니다.',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F64C3)),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(child: SvgPicture.asset('assets/character.svg')),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '결제 금액',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222222)),
                ),
                Text(
                  '00000원',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF555555)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '결제 수단',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222222)),
                ),
                Text(
                  '${payment}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF555555)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '처리상태',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222222)),
                ),
                Text(
                  '결제완료',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF555555)),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0), // 버튼의 높이
              width: double.infinity, // 너비를 화면 전체로 설정
              decoration: BoxDecoration(
                color: Colors.black, // 배경색을 검정색으로 설정
                borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
              ),
              child: InkWell(
                //Navigator.pop(context);
                onTap: () {
                  widget.onFetchData();
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
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    name = widget.info['username'];
    phone = widget.info['phonenumber'];
    birthDate = widget.info['birth'];
    email = widget.info['email'];
    // 텍스트 필드에 초기값 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'RAVIS 대여 예약',
      ),
      body: PageView(
        controller: _controller, // PageController 설정
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page; // 페이지 변경 시 현재 페이지 업데이트
          });
        },
        physics: NeverScrollableScrollPhysics(), // 슬라이드 방지
        children: [
          buildStep1(),
          buildStep2(),
          buildStep5(),
          buildStep6(),
        ],
      ),
    );
  }
}

class PaymentList extends StatefulWidget {
  final Function(String) onPaymentSelected; // 결제 방법을 부모 위젯으로 전달하는 콜백

  const PaymentList({super.key, required this.onPaymentSelected});
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  int _selectedIndex = -1; // 선택된 인덱스를 저장

  final List<String> paymentMethods = ['토스페이', '카카오페이', '무통장 입금', '일반결제'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(paymentMethods.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index; // 선택된 인덱스를 업데이트
              widget.onPaymentSelected(paymentMethods[index]);
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
          width: 50, // 동그라미의 너비
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
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF444444)),
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
                color: Color(0xFF555555),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
