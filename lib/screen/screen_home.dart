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
      backgroundColor: Colors.white,
      body: 
      Padding(
        
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
                      child: Review(width: screenWidth * 0.8, height: screenHeight * 0.35, path: 'assets/reviewimage.png',name: '김*희', star: 5, date: '24. 10. 04',product: '옵션: 손전등,LED', review: '응급상황이 발생해도 도움을 요청할 수 있어\n마음편하게 관광할 수 있어요.',),
                    ),
                    // 두 번째 Review 위젯
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: Review(width: screenWidth * 0.8, height: screenHeight * 0.35, path: 'assets/reviewimage2.png', name: '오*진', star: 5, date: '24. 11. 10',product: '옵션: 호신용 스프레이', review: '안전에 대한 걱정이 줄어서 마음이 편해요!\n걱정이 많은 분들은 추천합니다.'),
                    ),
                    // 세 번째 Review 위젯
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
                      child: Review(width: screenWidth * 0.8, height: screenHeight * 0.35, path: 'assets/reviewimage.png',name: '모*현', star: 5, date: '24. 12. 5',product: '옵션: 카메라', review: '조난당할 뻔 했는데 덕분에 살았습니다.\n'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              NewsMenu(),
              SizedBox(height: 10),
              News(width: screenWidth * 0.93, height: screenHeight * 0.13, path: 'assets/news1.png',title: '프랑스 파리 실종 ... 한국인', content: '프랑스 파리에서 실종 신고된 한국인 여행객 남\n성의 소재가 15일 만에 파악됐다. 주프랑스 한...',),
              SizedBox(height: 10),
              News(width: screenWidth * 0.93, height: screenHeight * 0.13, path: 'assets/news2.png', title: '“애타는 가족, 실종 한국인 41명”',content: '지난 5년간 외국에서 실종된 한국인 중 41명의\n행방은 여전히 알려지지 않는 것으로 나타났습...',),
              SizedBox(height: 10),
              News(width: screenWidth * 0.93, height: screenHeight * 0.13, path: 'assets/news3.png', title: '해외여행서 실종, 사망 급증…',content: '피해 발생 국가별로 보면 아시아·태평양 국가 중\n에서는 베트남이 633명으로 가장 많았고, 중...',),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
