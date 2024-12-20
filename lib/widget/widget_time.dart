import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  int selectedBoxIndex = -1; // 선택된 박스의 인덱스 (-1은 선택 안 된 상태)
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 가로 스크롤 가능하도록 설정
      child: Row(
        children: List.generate(24, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBoxIndex = index; // 클릭된 박스의 인덱스를 업데이트
              });
            },
            child:Container(
  alignment: Alignment.center, // 가운데 정렬
  margin: const EdgeInsets.symmetric(horizontal: 8.0),
  width: screenWidth * 0.2,
  height: screenHeight * 0.045,
  decoration: BoxDecoration(
    color: selectedBoxIndex == index
        ? Color(0xFF0567ED).withOpacity(0.1) // 선택된 경우 파란색
        : Color(0xFFF9F9F9), // 선택되지 않은 경우 회색
    borderRadius: BorderRadius.circular(8.0),
    border: Border.all(
      color: selectedBoxIndex == index
          ? Color(0xFF0567ED).withOpacity(0.4)
          : Color(0xFFA4A4A4).withOpacity(0.15),
      width: 2.0,
    ),
  ),
  child: Text(
    "${index}시",
    style: const TextStyle(fontSize: 16), // 원하는 스타일 적용 가능
  ),
),
          );
        }),
      ),
    );
  }
}
