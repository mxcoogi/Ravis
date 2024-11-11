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

class _TravelTicketState extends State<TravelTicket>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController; // 애니메이션 컨트롤러 선언
  late Animation<double> _leftWidthAnimation; // 왼쪽 영역의 너비 애니메이션
  late Animation<double> _rightWidthAnimation; // 오른쪽 영역의 너비 애니메이션
  late Animation<double> _qrSizeAnimation; // QR 크기 애니메이션
  late Animation<Offset> _qrPositionAnimation; // QR 위치 애니메이션

  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 초기화
    _animationController = AnimationController(
      vsync: this, // SingleTickerProviderStateMixin에서 제공하는 vsync
      duration: Duration(milliseconds: 500), // 애니메이션 duration
    );

    _leftWidthAnimation = Tween<double>(begin: 0.33, end: 0.99).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _rightWidthAnimation = Tween<double>(begin: 0.67, end: 0.01).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // 왼쪽 하단 버튼 크기 애니메이션 (QR 크기)
    _qrSizeAnimation = Tween<double>(begin: 50.0, end: 150.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // 왼쪽 하단 버튼 위치 애니메이션 (QR 위치)
    _qrPositionAnimation = Tween<Offset>(
      begin: Offset(10, 10), // 시작 위치: 왼쪽 하단
      end: Offset(70, 50), // 끝 위치: 화면 중앙
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose(); // 애니메이션 컨트롤러 리소스 해제
    super.dispose();
  }

  // 애니메이션 실행 함수
  void _toggleSlide() {
    if (_animationController.isCompleted) {
      _animationController.reverse(); // 애니메이션 되돌리기
    } else {
      _animationController.forward(); // 애니메이션 진행
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // 화면 비율에 맞는 너비
      height: widget.height,
      child: Row(
        children: [
          // 왼쪽 영역 (1대2 비율의 1)
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: widget.width * _leftWidthAnimation.value, // 왼쪽 영역의 너비
                height: widget.height,
                color: Colors.green, // 왼쪽 영역의 배경색
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.white,
                        child: Center(
                          child: Text('Top Left',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    // 왼쪽 하단 위젯
                    Positioned(
                      left: _qrPositionAnimation.value.dx,
                      bottom: _qrPositionAnimation.value.dy,
                      child: GestureDetector(
                        // 클릭 이벤트를 감지하는 GestureDetector 사용
                        onTap: () {
                          // 클릭 시 애니메이션을 토글하는 함수 호출
                          if (_animationController.isCompleted) {
                            _animationController.reverse(); // 애니메이션 되돌리기
                          } else {
                            _animationController.forward(); // 애니메이션 진행
                          }
                        },
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Container(
                              width: _qrSizeAnimation.value,
                              height: _qrSizeAnimation.value,
                              color: Colors.white,
                              child: Center(
                                child: Icon(Icons.star,
                                    color: Colors.black, size: 30),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // 오른쪽 중간 위젯
                    Positioned(
                      right: 10,
                      top: widget.height / 2 - 25, // 중간에 배치
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.white,
                        child: Center(
                          child: Text('Middle Right',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          // 오른쪽 영역 (1대2 비율의 2)
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: widget.width * _rightWidthAnimation.value, // 오른쪽 영역의 너비
                height: widget.height,
                color: Colors.red, // 오른쪽 영역의 배경색
              );
            },
          ),
        ],
      ),
    );
  }
}
