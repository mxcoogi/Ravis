import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//첫번째 티켓위젯
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // 화면 비율에 맞는 너비
      height: widget.height, // 화면 비율에 맞는 높이
      margin: EdgeInsets.only(top: 10.0), // 마진을 사용하여 아래로 밀기

      child: Row(
        children: [
          // 왼쪽 부분 3분의 1 영역
          Expanded(
            flex: 1, // 3분의 1 비율
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1F64C3), // 배경 색상
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), // 왼쪽 위 모서리 둥글게
                  bottomLeft: Radius.circular(15), // 왼쪽 아래 모서리 둥글게
                ),
                // 왼쪽 경계를 제외한 다른 경계에만 테두리 추가
              ),
              child: Stack(
                children: [
                  // 디데이
                  Align(
                    alignment: Alignment.topLeft, // 왼쪽 상단에 위치
                    child: Padding(
                      padding: EdgeInsets.all(10.0), // 왼쪽 위에 여백 추가
                      child: SvgPicture.asset(
                        'assets/kakaoIcon.svg', // 왼쪽 위 아이콘 경로
                        width: 30.0, // 아이콘의 너비
                        height: 30.0, // 아이콘의 높이
                      ),
                    ),
                  ),

                  // 큐알
                  Align(
                    alignment: Alignment.bottomLeft, // 왼쪽 하단에 위치
                    child: Padding(
                      padding: EdgeInsets.all(10.0), // 왼쪽 아래에 여백 추가
                      child: SvgPicture.asset(
                        'assets/kakaoIcon.svg', // 왼쪽 아래 아이콘 경로
                        width: 30.0, // 아이콘의 너비
                        height: 30.0, // 아이콘의 높이
                      ),
                    ),
                  ),

                  // 오른쪽 끝에 아이콘
                  Align(
                    alignment: Alignment.centerRight, // 아이콘을 오른쪽 끝에 정렬
                    child: Padding(
                      padding: EdgeInsets.only(right: 2.0), // 오른쪽에 여백 추가
                      child: SvgPicture.asset(
                        'assets/ticket_logo.svg', // 실제 아이콘 파일 경로
                        width: 50.0, // 아이콘의 너비
                        height: 220.0, // 아이콘의 높이
                        color: Colors.black, // 아이콘 색상
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 오른쪽 부분 3분의 2 영역
          Expanded(
            flex: 2, // 3분의 2 비율
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 236, 236), // 배경 색상
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), // 오른쪽 위 모서리 둥글게
                  bottomRight: Radius.circular(15), // 오른쪽 아래 모서리 둥글게
                ),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // 상단, 중간, 하단 여백을 균등하게 분배
                children: [
                  // 맨 위 텍스트 (더 위로)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0), // 맨 위로 간격 추가
                    child: Align(
                      alignment: Alignment.topCenter, // 세로 맨 위, 가로 중앙
                      child: Text(
                        "첫 번째 텍스트", // 텍스트 내용
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // 두 번째 텍스트와 세 번째 텍스트 (가로로 가운데)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 가로로 중앙 정렬
                    children: [
                      Text(
                        "두 번째 텍스트", // 두 번째 텍스트
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 10.0), // 두 텍스트 간 간격
                      Text(
                        "세 번째 텍스트", // 세 번째 텍스트
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),

                  // 네 번째 텍스트 (화면 맨 아래)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0), // 맨 아래로 간격 추가
                    child: Align(
                      alignment: Alignment.bottomCenter, // 세로 맨 아래, 가로 중앙
                      child: Text(
                        "네 번째 텍스트", // 네 번째 텍스트
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2번째 홈메뉴위젯
class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1), // 패딩 추가
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // 아이콘 사이에 동일한 간격을 설정
        children: [
          // 첫 번째 아이콘과 라벨
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print("홈 아이콘 클릭");
                },
                child: SvgPicture.asset(
                  'assets/homemenu1.svg',
                  width: 45.0,
                  height: 45.0,
                ),
              ),
              SizedBox(height: 8.0), // 아이콘과 텍스트 사이의 간격
              Text(
                "대여 예약",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // 두 번째 아이콘과 라벨
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print("설정 아이콘 클릭");
                },
                child: SvgPicture.asset(
                  'assets/homemenu2.svg',
                  width: 45.0,
                  height: 45.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "상품 사용법",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // 세 번째 아이콘과 라벨
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print("알림 아이콘 클릭");
                },
                child: SvgPicture.asset(
                  'assets/homemenu3.svg',
                  width: 45.0,
                  height: 45.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "일정 등록",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // 네 번째 아이콘과 라벨
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print("프로필 아이콘 클릭");
                },
                child: SvgPicture.asset(
                  'assets/homemenu4.svg',
                  width: 45.0,
                  height: 45.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "공관 찾기",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//3번째 위젯 이용후기와 전체보기 위젯
class TextMenu extends StatelessWidget {
  const TextMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // 패딩 추가
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 두 텍스트 사이에 간격을 추가
        children: [
          // 이용후기 텍스트 버튼
          TextButton(
            onPressed: () {
              // 이용후기 페이지로 이동
              print('이용후기 클릭됨');
            },
            child: Text(
              '121개 이용후기',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),

          // 전체보기 텍스트 버튼
          TextButton(
            onPressed: () {
              print('전체보기 클릭됨');
            },
            child: Text(
              '전체보기',
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}

// 4번째 리뷰위젯
class Review extends StatefulWidget {
  final double width; // 너비
  final double height; // 높이
  final String path;

  const Review({
    super.key,
    required this.width,
    required this.height,
    required this.path
  });

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,  // 너비
      height: widget.height,  // 높이
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),  // 외부 둥근 모서리 적용
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.path),  // 배경 이미지 경로
                    fit: BoxFit.cover,  // 이미지를 꽉 채우도록 설정
                  ),
                ),
                child: Center(
                  child: Text(
                    'Top Section', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,  // 두 번째 컨테이너 색상
                child: Center(
                  child: Text(
                    'Bottom Section', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//5번째 뉴스 텍스트
class NewsMenu extends StatelessWidget {
  const NewsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // 패딩 추가
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 두 텍스트 사이에 간격을 추가
        children: [
          // 이용후기 텍스트 버튼
          TextButton(
            onPressed: () {
              // 이용후기 페이지로 이동
              print('이용후기 클릭됨');
            },
            child: Text(
              'Ravis News',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),

          // 전체보기 텍스트 버튼
          TextButton(
            onPressed: () {
              print('전체보기 클릭됨');
            },
            child: Text(
              '전체보기',
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

//6번째 위젯 뉴스
class News extends StatefulWidget {
  final double width; // 너비
  final double height; // 높이

  const News({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // 너비
      height: widget.height, // 높이
      decoration: BoxDecoration(
        color: Colors.red, // 배경색
        borderRadius: BorderRadius.circular(20), // 모서리를 둥글게
      ),
      child: Center(
        child: Text(
          "뉴스 위젯",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
