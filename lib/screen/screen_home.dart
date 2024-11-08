import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // 미디어 쿼리를 사용해 화면 크기 가져오기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 16.0, right: 12.0), // 위쪽, 좌측, 우측에 패딩을 추가
        child: SingleChildScrollView( // 전체 화면을 스크롤 가능하게 만듬
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // 위젯들이 화면 중앙에 정렬되도록 설정
            children: [
              // 첫 번째 TravelTicket 위젯
              SingleChildScrollView(  // Row를 감싸는 가로 스크롤 뷰
                scrollDirection: Axis.horizontal,  // 가로 스크롤을 활성화
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,  // 위젯들이 왼쪽 정렬
                  children: [
                    // 첫 번째 Review 위젯
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: TravelTicket(width: screenWidth * 0.9, height: screenHeight * 0.25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: TravelTicket(width: screenWidth * 0.9, height: screenHeight * 0.25),
                    )
                  ],
                ),
              ),
              // 추가적인 위젯들
              SizedBox(height: 33),
              HomeMenu(),
              SizedBox(height: 23),
              TextMenu(),
              SizedBox(height: 5),
              // 가로 스크롤 가능한 Row
              SingleChildScrollView(  // Row를 감싸는 가로 스크롤 뷰
                scrollDirection: Axis.horizontal,  // 가로 스크롤을 활성화
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,  // 위젯들이 왼쪽 정렬
                  children: [
                    // 첫 번째 Review 위젯
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: Review(width: screenWidth * 0.8, height: screenHeight * 0.3, path: 'assets/reviewimage.png',name: '김 * 희', star: 5, date: '24. 11. 08',),
                    ),
                    // 두 번째 Review 위젯
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: Review(width: screenWidth * 0.8, height: screenHeight * 0.3, path: 'assets/reviewimage2.png', name: '오 * 진',star: 4, date: '24. 11. 11',),
                    ),
                    // 세 번째 Review 위젯
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: Review(width: screenWidth * 0.8, height: screenHeight * 0.3, path: 'assets/reviewimage.png', name: '최 * 랑',star: 3, date: '24. 11. 14'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              NewsMenu(),
              SizedBox(height: 10),
              News(width: screenWidth * 0.9, height: screenHeight * 0.13, path: 'assets/news1.png',),
              SizedBox(height: 10),
              News(width: screenWidth * 0.9, height: screenHeight * 0.13, path: 'assets/news2.png'),
              SizedBox(height: 10),
              News(width: screenWidth * 0.9, height: screenHeight * 0.13, path: 'assets/news3.png'),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
