import 'package:flutter/material.dart';

//첫번째 티켓위젯
class TravelTicket extends StatefulWidget {
  final double width;  // 너비
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
      child: Center(
        child: Text(
          "여행 티켓 위젯", 
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blue, // 배경색
        borderRadius: BorderRadius.circular(20), // 모서리를 둥글게 하기
      
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
      padding: EdgeInsets.all(3), // 패딩 추가
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 아이콘 사이에 동일한 간격을 설정
        children: [
          // 첫 번째 아이콘
          IconButton(
            icon: Icon(Icons.home, size: 40, color: Colors.blue),
            onPressed: () {
              print('Home icon clicked');
            },
          ),
          // 두 번째 아이콘
          IconButton(
            icon: Icon(Icons.search, size: 40, color: Colors.blue),
            onPressed: () {
              print('Search icon clicked');
            },
          ),
          // 세 번째 아이콘
          IconButton(
            icon: Icon(Icons.notifications, size: 40, color: Colors.blue),
            onPressed: () {
              print('Notifications icon clicked');
            },
          ),
          // 네 번째 아이콘
          IconButton(
            icon: Icon(Icons.account_circle, size: 40, color: Colors.blue),
            onPressed: () {
              print('Profile icon clicked');
            },
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
              '1212123123개 이용후기',
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

// 4번째 리뷰위젯 
class Review extends StatefulWidget {
  final double width;  // 너비
  final double height; // 높이

  const Review({
    super.key,
    required this.width,
    required this.height,
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
      decoration: BoxDecoration(
        color: Colors.black, // 배경색
        borderRadius: BorderRadius.circular(20), // 모서리를 둥글게
      ),
      child: Center(
        child: Text(
          "이용 후기 위젯", 
          style: TextStyle(color: Colors.white),
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

  final double width;  // 너비
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
      width: widget.width,  // 너비
      height: widget.height,  // 높이
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


