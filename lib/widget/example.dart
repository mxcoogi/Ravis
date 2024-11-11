import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    // 미디어 쿼리를 사용해 화면 크기 가져오기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: 30.0, left: 16.0, right: 12.0), // 위쪽, 좌측, 우측에 패딩을 추가
        child: SingleChildScrollView(
          // 전체 화면을 스크롤 가능하게 만듬
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // 위젯들이 화면 중앙에 정렬되도록 설정
            children: [
              // 첫 번째 TravelTicket 위젯
              SingleChildScrollView(
                // Row를 감싸는 가로 스크롤 뷰
                scrollDirection: Axis.horizontal, // 가로 스크롤을 활성화
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // 위젯들이 왼쪽 정렬
                  children: [
                    // 첫 번째 Review 위젯
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: TravelTicket(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.25),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: TravelTicket(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.25),
                    )
                  ],
                ),
              ),
              // 추가적인 위젯들
            ],
          ),
        ),
      ),
    );
  }
}

class TravelTicket extends StatefulWidget {
  final double width; // 너비
  final double height; // 높이

  const TravelTicket({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<TravelTicket> createState() => _TravelTicketState();
}

class _TravelTicketState extends State<TravelTicket> {
  double leftPosition = 0.0; // Initialize to 0.0 or another default value
  double rightPosition = 0.0; // 오른쪽 영역의 위치

  @override
  void initState() {
    super.initState();
    leftPosition = widget.width * 0.65;
    rightPosition = widget.width * 0.35;
  }

  // 슬라이드 토글 함수
  void _toggleSlide() {
    setState(() {
      if (leftPosition == widget.width * 0.01) {
        leftPosition = widget.width * 0.65;
        rightPosition = widget.width * 0.35;
      } else {
        leftPosition = widget.width * 0.01;
        rightPosition = widget.width * 0.99;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // 화면 비율에 맞는 너비
      height: widget.height, // 화면 비율에 맞는 높이
      margin: EdgeInsets.only(top: 10.0), // 마진을 사용하여 아래로 밀기
      child: Stack(
        children: [
          // 왼쪽 부분 3분의 1 영역 (Blue background)
          AnimatedPositioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: leftPosition, // 왼쪽 영역이 슬라이드할 때 오른쪽 끝 위치
            duration: Duration(milliseconds: 500), // 슬라이드 애니메이션 속도 설정
            curve: Curves.easeInOut,
            child: Container(
              width: widget.width * 0.35, // 왼쪽 영역 너비
              decoration: BoxDecoration(
                color: Color(0xFF1F64C3), // 배경 색상
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), // 왼쪽 위 모서리 둥글게
                  bottomLeft: Radius.circular(15), // 왼쪽 아래 모서리 둥글게
                ),
              ),
              child: Stack(
                children: [
                  // 디데이 텍스트
                  Positioned(
                    left: 15,
                    top: 15,
                    child: Text(
                      'D-4',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),

                  // 큐알 아이콘과 네모 아이콘을 각각 Positioned로 배치
                  Positioned(
                    left: 10, // 큐알 아이콘 왼쪽 위치
                    bottom: 10, // 큐알 아이콘 아래 위치
                    child: Image.asset(
                      'assets/qrexample.png', // 큐알 아이콘 경로
                      width: 60.0, // 아이콘의 너비
                      height: 60.0, // 아이콘의 높이
                    ),
                  ),

                  // 네모 아이콘 (큐알 아이콘 오른쪽에 위치
                  // 오른쪽 끝에 아이콘
                  Positioned(
                    right: 2.0,
                    top: 0,
                    bottom: 0,
                    child: SvgPicture.asset(
                      'assets/ticket_logo.svg', // 아이콘 경로
                      width: 50.0, // 아이콘의 너비
                      height: 220.0, // 아이콘의 높이
                      color: Colors.black, // 아이콘 색상
                    ),
                  ),
                  Positioned(
                    left: 80, // 네모 아이콘은 큐알 아이콘 오른쪽에 배치
                    bottom: 17, // 네모 아이콘의 아래 위치
                    child: InkWell(
                      onTap: () {
                        print("Icon tapped!");
                        _toggleSlide();
                      }, // 큐알 아이콘을 클릭 시 슬라이드 트리거
                      child: SvgPicture.asset(
                        'assets/ticketbotton.svg', // 네모 아이콘 경로
                        width: 20.0, // 아이콘의 너비
                        height: 20.0, // 아이콘의 높이
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 오른쪽 부분 3분의 2 영역 (Grey background)
          AnimatedPositioned(
            right: 0,
            top: 0,
            bottom: 0,
            left: rightPosition, // 왼쪽 영역이 35% 차지하고, 나머지 65%가 오른쪽 영역
            duration: Duration(milliseconds: 500), // 오른쪽 영역 애니메이션 속도
            curve: Curves.easeInOut,
            child: Container(
              width: widget.width * 0.65, // 오른쪽 영역 65% 크기
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 236, 236), // 배경 색상
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), // 오른쪽 위 모서리 둥글게
                  bottomRight: Radius.circular(15), // 오른쪽 아래 모서리 둥글게
                ),
              ),
              // 텍스트 영역을 스크롤할 수 있게 하기 위해 SingleChildScrollView 사용
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0), // 스크롤 내용에 패딩 추가
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 첫 번째 텍스트
                    Text(
                      "첫 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16), // 텍스트 사이에 간격

                    // 두 번째 텍스트
                    Text(
                      "두 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 16), // 텍스트 사이에 간격

                    // 세 번째 텍스트
                    Text(
                      "세 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 16), // 텍스트 사이에 간격

                    // 네 번째 텍스트
                    Text(
                      "네 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
