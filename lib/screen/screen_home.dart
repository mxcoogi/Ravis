import 'package:flutter/material.dart';
import 'package:ravis/widget/widget_home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // JSON 파싱을 위해 필요
import 'package:ravis/http/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Post> posts = []; // 받은 데이터를 저장할 리스트

  // 데이터를 가져오는 함수
  Future<void> fetchData() async {
    final url = Uri.parse('http://10.0.2.2:8000/posts'); // 서버 URL

    try {
      // GET 요청을 보내기
      final response = await http.get(
        url,
        headers: {'Accept': 'application/json'}, // 'Accept' 헤더 설정
      );

      if (response.statusCode == 200) {
        // 서버에서 정상적인 응답을 받은 경우
        final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        // 받은 데이터를 상태에 저장
        setState(() {
          posts = data.map((postData) => Post.fromJson(postData)).toList();
        });
      } else {
        // 응답 코드가 200이 아닌 경우
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // 예외 처리: 네트워크 오류 등
      print('Error fetching data: $e');
      throw Exception('Error fetching data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // 화면이 로드될 때 데이터를 가져옴
  }


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
                  children:posts.map((post) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0), // 오른쪽에 간격을 추가
              child: Review(
                width: screenWidth * 0.8,
                height: screenHeight * 0.3,
                path: 'assets/reviewimage.png', // 이미지 경로
                name: post.name,  // 이름
                star: post.star,  // 별점
                date: post.date,  // 날짜
              ),
            );
          }).toList()
                ),
              ),
              SizedBox(height: 5),
              NewsMenu(),
              SizedBox(height: 10),
              News(width: screenWidth * 0.93, height: screenHeight * 0.13, path: 'assets/news1.png',),
              SizedBox(height: 10),
              News(width: screenWidth * 0.93, height: screenHeight * 0.13, path: 'assets/news2.png'),
              SizedBox(height: 10),
              News(width: screenWidth * 0.93, height: screenHeight * 0.13, path: 'assets/news3.png'),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
