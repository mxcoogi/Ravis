import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // SVG 패키지 임포트

class MyinfoCard extends StatefulWidget {
  const MyinfoCard({super.key});

  @override
  State<MyinfoCard> createState() => _MyinfoCardState();
}

class _MyinfoCardState extends State<MyinfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370, // 카드의 고정된 너비
      height: 220, // 카드의 고정된 높이
      decoration: BoxDecoration(
        color: Color(0xFF0567ED), // 배경 색상
        borderRadius: BorderRadius.circular(10.0), // 둥근 테두리
      ),
      child: Stack(
        children: [
          // 텍스트와 아이콘을 배치할 공간
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
              children: [
                Text(
                  "김태용님 안전한 여행되세요!", // 카드 제목
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8), // 제목과 설명 사이에 공간 추가
                Text(
                  "2312ty@gmail.com", // 카드 제목
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // 아이콘들 배치
          Positioned(
            left: 50,
            bottom: 27,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('아이콘 1 클릭됨');
                    // 여기에 아이콘 1 클릭 시 수행할 동작을 추가
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/cupounIcon.svg', // 아이콘 1의 경로
                        width: 40, // 아이콘 크기 조정
                        height: 40, // 아이콘 크기 조정
                      ),
                      SizedBox(height: 4),
                      Text(
                        '쿠폰',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 65), // 아이콘 사이 간격 조정
                GestureDetector(
                  onTap: () {
                    print('아이콘 2 클릭됨');
                    // 여기에 아이콘 2 클릭 시 수행할 동작을 추가
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/servicecenterIcon.svg', // 아이콘 2의 경로
                        width: 40, // 아이콘 크기 조정
                        height: 40, // 아이콘 크기 조정
                      ),
                      SizedBox(height: 4),
                      Text(
                        '고객센터',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 65), // 아이콘 사이 간격 조정
                GestureDetector(
                  onTap: () {
                    print('아이콘 3 클릭됨');
                    // 여기에 아이콘 3 클릭 시 수행할 동작을 추가
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/eventIcon.svg', // 아이콘 3의 경로
                        width: 40, // 아이콘 크기 조정
                        height: 40, // 아이콘 크기 조정
                      ),
                      SizedBox(height: 4),
                      Text(
                        '이벤트',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SVG 로고 배치
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/ticket_logo.svg', // SVG 파일 경로
              width: 50, // 아이콘 크기 조정
              height: 220, // 아이콘 크기 조정
            ),
          ),
        ],
      ),
    );
  }
}

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 370,
        height: 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 0), // 패딩값 설정
              child: Align(
                alignment: Alignment.centerLeft, // 텍스트를 왼쪽에 정렬
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Column 내에서 텍스트들 왼쪽 정렬
                  children: [
                    Text('내 정보',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600, color:Color(0xFF444444))),
                    SizedBox(height: 30),
                    Text('이름',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF555555))),
                    SizedBox(height:23),
                    Text('생년월일',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500,  color:Color(0xFF555555))),
                    SizedBox(height: 23),
                    Text('핸드폰 번호',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500, color:Color(0xFF555555))),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 0), // 패딩값 설정
              child: Align(
                alignment: Alignment.centerLeft, // 텍스트를 왼쪽에 정렬
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // Column 내에서 텍스트들 왼쪽 정렬
                  children: [
                    InkWell(
                      onTap: (){
                        print('수정 클릭');
                      },
                      child: Text('수정', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45)),
                    ),
                    SizedBox(height: 45),
                    Text('김태용',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45)),
                    SizedBox(height: 23),
                    Text('2001. 12. 26',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45)),
                    SizedBox(height: 23),
                    Text('010-0000-0000',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45)),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}


class Details extends StatelessWidget {
  final String detail_name;
  final double width;
  final double height;

  const Details({super.key, required this.detail_name, required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 클릭했을 때 처리할 동작
        print(detail_name + "클릭댐");
      },
      child: Container(
        width: width ,
        height: height * 0.07,
        alignment: Alignment.centerLeft,
        child: Text(
          detail_name,  // 전달된 detail_name 값 표시
          style: TextStyle(fontSize: 19, color:Color(0xFF444444), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
