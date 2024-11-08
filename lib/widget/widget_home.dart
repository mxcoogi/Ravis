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
          InkWell(
            onTap: () {
              print("홈 아이콘 클릭");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/homemenu1.svg',
                  width: 45.0,
                  height: 45.0,
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
          ),

          // 두 번째 아이콘과 라벨
          InkWell(
            onTap: () {
              print("설정 아이콘 클릭");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/homemenu2.svg',
                  width: 45.0,
                  height: 45.0,
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
          ),

          // 세 번째 아이콘과 라벨
          InkWell(
            onTap: () {
              print("알림 아이콘 클릭");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/homemenu3.svg',
                  width: 45.0,
                  height: 45.0,
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
          ),

          // 네 번째 아이콘과 라벨
          InkWell(
            onTap: () {
              print("프로필 아이콘 클릭");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/homemenu4.svg',
                  width: 45.0,
                  height: 45.0,
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
  final String name;
  final int star;
  final String date;

  const Review(
      {super.key,
      required this.width,
      required this.height,
      required this.path,
      required this.name,
      required this.star,
      required this.date});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // 너비
      height: widget.height, // 높이
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // 외부 둥근 모서리 적용
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.path), // 배경 이미지 경로
                    fit: BoxFit.cover, // 이미지를 꽉 채우도록 설정
                  ),
                ),
                child: Stack(
                  children: [
                    // 왼쪽 위에 이름 텍스트
                    Positioned(
                      left: 16, // 왼쪽 여백
                      top: 16, // 위쪽 여백
                      child: Text(
                        widget.name, // 이름 텍스트
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    // 왼쪽 위에 별점 아이콘 (이름 밑에 배치)
                    Positioned(
                      left: 16,
                      top: 48, // 이름 아래에 위치하도록 설정
                      child: Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < widget.star
                                ? Icons.star
                                : Icons.star_border, // 4개 별은 채워지고 나머지는 빈 별
                            color: Color(0xFF94BEF8),
                            size: 15,
                          );
                        }),
                      ),
                    ),

                    // 오른쪽 위에 날짜 텍스트
                    Positioned(
                      right: 16, // 오른쪽 여백
                      top: 16, // 위쪽 여백
                      child: Text(
                        widget.date, // 날짜 텍스트 (예시 날짜)
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color.fromARGB(255, 243, 238, 238), // 두 번째 컨테이너 색상
                child: Padding(
                  padding: const EdgeInsets.all(
                      16.0), // 패딩을 추가하여 텍스트가 컨테이너의 가장자리에 붙지 않도록 함
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                    mainAxisAlignment: MainAxisAlignment.start, // 세로 방향으로 위쪽 정렬
                    children: [
                      // 첫 번째 텍스트
                      Text(
                        'First Text',
                        style: TextStyle(
                            color: Color(0xFF666E79),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height:
                              8), // 첫 번째 텍스트와 두 번째 텍스트 사이에 간격을 주기 위해 SizedBox 사용

                      // 두 번째 텍스트
                      Text(
                        'Second Text',
                        style: TextStyle(
                          color: Color(0xFF666E79),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                          height:
                              16), // 두 번째 텍스트와 Row 사이에 간격을 주기 위해 SizedBox 사용

                      // Row (세 개의 텍스트를 나란히 배치)
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Row 내에서 텍스트를 가운데 정렬
                        children: [
                          // 첫 번째 텍스트를 Container로 감싸고 배경색을 남색으로 설정
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12), // 크기를 더 작게 만들기 위한 여백 조정
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFF1853A4), // 남색 배경 (color는 decoration 안에 넣음)
                              borderRadius:
                                  BorderRadius.circular(8), // 모서리 둥글게 만들기
                            ),
                            child: Text(
                              'Text 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12, // 텍스트 크기도 조금 더 작게 설정
                              ),
                            ),
                          ),
                          SizedBox(width: 16), // 텍스트들 간 간격을 위한 SizedBox

                          // 두 번째 텍스트를 Container로 감싸고 배경색을 남색으로 설정
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12), // 크기를 더 작게 만들기 위한 여백 조정
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFF1853A4), // 남색 배경 (color는 decoration 안에 넣음)
                              borderRadius:
                                  BorderRadius.circular(8), // 모서리 둥글게 만들기
                            ),
                            child: Text(
                              'Text 2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12, // 텍스트 크기도 조금 더 작게 설정
                              ),
                            ),
                          ),
                          SizedBox(width: 16), // 텍스트들 간 간격을 위한 SizedBox

                          // 세 번째 텍스트를 Container로 감싸고 배경색을 남색으로 설정
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12), // 크기를 더 작게 만들기 위한 여백 조정
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFF1853A4), // 남색 배경 (color는 decoration 안에 넣음)
                              borderRadius:
                                  BorderRadius.circular(8), // 모서리 둥글게 만들기
                            ),
                            child: Text(
                              'Text 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12, // 텍스트 크기도 조금 더 작게 설정
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
              'Ravis 뉴스',
              style: TextStyle(fontSize: 20, color: Color(0xFF444444)),
            ),
          ),

          // 전체보기 텍스트 버튼
          TextButton(
            onPressed: () {
              print('전체보기 클릭됨');
            },
            child: Text(
              '전체보기',
              style: TextStyle(fontSize: 15, color: Color(0xFFAAAAAA)),
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
  final String path;
  const News(
      {super.key,
      required this.width,
      required this.height,
      required this.path});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // 너비
      height: widget.height, // 높이
      child: Row(
        children: [
          // 첫 번째 Container (비율 1)
          Expanded(
            flex: 2, // 2의 비율
            child: Container(
              width: widget.width, // 너비
              height: widget.height, // 높이
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.path), // 배경 이미지 경로
                  fit: BoxFit.cover, // 이미지를 컨테이너 크기에 맞게 채움
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ), // 모서리를 둥글게
              ),
            ),
          ),

          // 두 번째 Container (비율 4)
          Expanded(
            flex: 4, // 4의 비율
            child: Container(
              width: widget.width, // 너비
              height: widget.height, // 높이
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 238, 238), // 배경색 하얀색
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ), // 모서리를 둥글게
              ),
              child: Padding(
                padding: EdgeInsets.all(16), // 패딩 추가
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // 텍스트 간격을 유지
                  children: [
                    // 첫 번째 텍스트: 왼쪽 정렬
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "맨 위 텍스트", // 첫 번째 텍스트
                        style: TextStyle(
                          fontSize: 16, // 텍스트 크기
                          fontWeight: FontWeight.bold, // 텍스트 두껍게
                          color: Color(0xFF555555), // 텍스트 색상
                        ),
                      ),
                    ),

                    // 두 번째 텍스트: 아래쪽 정렬
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "아래쪽 텍스트", // 두 번째 텍스트
                        style: TextStyle(
                          fontSize: 14, // 텍스트 크기
                          color: Color(0xFF666E79), // 텍스트 색상
                        ),
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
