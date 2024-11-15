import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CopingScreen extends StatefulWidget {
  @override
  State<CopingScreen> createState() => _CopingScreenState();
}

class _CopingScreenState extends State<CopingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(213, 194, 207, 246),
                    Color.fromARGB(211, 229, 232, 241)
                  ]),
            ),
            child: Stack(
              children: [
                Positioned(left: -25 ,top: -55, width: 170, child: SvgPicture.asset('assets/backIcon.svg')),
                Positioned(right: -70 ,top: 80, width: 170, child: SvgPicture.asset('assets/backIcon.svg')),
                Padding(
                padding: EdgeInsets.only(top: 80, left: 15, right: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' 범죄 및 사고, 대응법은\n RAVIS가 알려드릴께요!',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: screenWidth * 0.95,
                        height: screenHeight * 0.15,
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '경범죄',
                                  style: TextStyle(
                                      color: Color(0xFF1F64C3),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '분실 및 도난, 부당한 체포 및 구금,\n보이스피싱 등',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF666E79)),
                                    ),
                                    SvgPicture.asset('assets/coping1.svg')
                                  ],
                                )
                              ],
                            )),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                          borderRadius: BorderRadius.circular(10), // 둥근 테두리
                          border: Border.all(
                            color: Color.fromARGB(255, 179, 205, 242)
                                .withOpacity(0.5), // 테두리 색과 투명도
                            width: 2, // 테두리 두께
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: screenWidth * 0.95,
                        height: screenHeight * 0.15,
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '강력범죄',
                                  style: TextStyle(
                                      color: Color(0xFF1F64C3),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '납치 및 감금, 마약 소지 및 복용,\n테러 및 폭발 등',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF666E79)),
                                    ),
                                    SvgPicture.asset('assets/coping2.svg')
                                  ],
                                )
                              ],
                            )),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                          borderRadius: BorderRadius.circular(10), // 둥근 테두리
                          border: Border.all(
                            color: Color.fromARGB(255, 179, 205, 242)
                                .withOpacity(0.5), // 테두리 색과 투명도
                            width: 2, // 테두리 두께
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: screenWidth * 0.95,
                        height: screenHeight * 0.15,
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '사고 및 의료',
                                  style: TextStyle(
                                      color: Color(0xFF1F64C3),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '단순 사소 및 각종 의료적 대처가\n필요한 상황',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF666E79)),
                                    ),
                                    SvgPicture.asset('assets/coping3.svg')
                                  ],
                                )
                              ],
                            )),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8), // 배경 색과 투명도 조절
                          borderRadius: BorderRadius.circular(10), // 둥근 테두리
                          border: Border.all(
                            color: Color.fromARGB(255, 179, 205, 242)
                                .withOpacity(0.5), // 테두리 색과 투명도
                            width: 2, // 테두리 두께
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            )
));
  }
}
