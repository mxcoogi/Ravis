
/*
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

class _TravelTicketState extends State<TravelTicket> with SingleTickerProviderStateMixin {
  double leftPosition = 0.0; // 왼쪽 영역 위치
  double rightPosition = 0.0; // 오른쪽 영역 위치
  bool isVisible = true;
  double qrwidth = 40.0; // 초기 QR 크기
  double qrheight = 40.0;
  double qrleft = 10; // 초기 위치
  double qrbottom = 30;
  late Animation<double> _qrSizeAnimation;
  late Animation<Offset> _qrPositionAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // 위치 초기화
    leftPosition = widget.width * 0.65;
    rightPosition = widget.width - leftPosition;

    // 애니메이션 컨트롤러 초기화
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    // QR 크기 애니메이션 정의
    _qrSizeAnimation = Tween<double>(begin: 40.0, end: 300.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));

    // QR 위치 애니메이션 정의
    _qrPositionAnimation = Tween<Offset>(begin: const Offset(10.0, 10.0), end: const Offset(35.0, 0))
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));

    // 애니메이션 시작
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // 리소스 해제
    super.dispose();
  }

  // 슬라이드 토글 함수
  void _toggleSlide() {
    setState(() {
      if (!isVisible) {
        // QR 코드가 원래 크기와 위치로 돌아갈 때
        leftPosition = widget.width * 0.65;
        rightPosition = widget.width * 0.35;
        _animationController.reverse(); // 애니메이션 되돌리기
      } else {
        // QR 코드가 커지고, 가운데로 이동할 때
        leftPosition = widget.width * 0.01;
        rightPosition = widget.width * 0.99;
        _animationController.forward(); // 애니메이션 진행
      }
      isVisible = !isVisible;
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
                  // 네모 아이콘 (큐알 아이콘 오른쪽에 위치)
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
                    left: _qrPositionAnimation.value.dx,  // 애니메이션에 따라 X 좌표 변화
                    top: _qrPositionAnimation.value.dy,   // 애니메이션에 따라 Y 좌표 변화
                    child: InkWell(
                      onTap: _toggleSlide,
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: _qrPositionAnimation.value,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500), // 애니메이션 속도
                              width: _qrSizeAnimation.value, // 애니메이션되는 QR의 너비
                              height: _qrSizeAnimation.value, // 애니메이션되는 QR의 높이
                              curve: Curves.easeIn, // 애니메이션 곡선
                              child: Image.asset(
                                'assets/qrcode2.png', // 큐알 아이콘 경로
                              ),
                            ),
                          );
                        },
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
            left: rightPosition, // 오른쪽 영역 애니메이션
            duration: Duration(milliseconds: 500), // 애니메이션 속도
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
              child: Stack(
                children: [
                  // 첫 번째 텍스트
                  Positioned(
                    left: 16.0, // 왼쪽 패딩과 일치
                    top: 16.0, // 첫 번째 텍스트의 위쪽 위치
                    child: Text(
                      "첫 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // 두 번째 텍스트
                  Positioned(
                    left: 16.0, // 왼쪽 패딩
                    top: 48.0, // 두 번째 텍스트의 위쪽 위치 (첫 번째 텍스트 아래)
                    child: Text(
                      "두 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),

                  // 세 번째 텍스트
                  Positioned(
                    left: 16.0, // 왼쪽 패딩
                    top: 80.0, // 세 번째 텍스트의 위쪽 위치 (두 번째 텍스트 아래)
                    child: Text(
                      "세 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),

                  // 네 번째 텍스트
                  Positioned(
                    left: 16.0, // 왼쪽 패딩
                    top: 112.0, // 네 번째 텍스트의 위쪽 위치 (세 번째 텍스트 아래)
                    child: Text(
                      "네 번째 텍스트",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

*/