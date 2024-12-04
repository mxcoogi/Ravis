import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ravis/main.dart';

class MapGoogle extends StatefulWidget {
  const MapGoogle({super.key});

  @override
  State<MapGoogle> createState() => MapGoogleState();
}

class MapGoogleState extends State<MapGoogle> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor? markerIcon1;  // markerIcon을 nullable로 변경하여 초기화 전에는 null 상태로 처리
  BitmapDescriptor? markerIcon2;
  BitmapDescriptor? markerIcon3;
  BitmapDescriptor? markerIcon4;
  String country = '';
  final Dio dio = Dio();
  List<Map<String, dynamic>> responseData = [];
  final Map<String, List<Map<String, double>>> countryCoordinates = {
  "미국": [
    // 치안이 좋은 도시
    {"lat": 40.7128, "lng": -74.0060}, // 뉴욕
    {"lat": 34.0522, "lng": -118.2437}, // 로스앤젤레스
    {"lat": 33.4484, "lng": -112.0740}, // 피닉스
    
    // 치안이 안 좋은 도시
    {"lat": 41.8781, "lng": -87.6298}, // 시카고
    {"lat": 29.7604, "lng": -95.3698},  // 휴스턴
    {"lat": 38.8954, "lng": -77.0369} //수도
  ],
  "중국": [
    // 치안이 좋은 도시
    {"lat": 39.9042, "lng": 116.4074}, // 베이징
    {"lat": 31.2304, "lng": 121.4737}, // 상하이
    {"lat": 22.5431, "lng": 114.0579}, // 선전
    
    // 치안이 안 좋은 도시
    {"lat": 23.1291, "lng": 113.2644}, // 광저우
    {"lat": 30.5728, "lng": 104.0668}, // 청두
    {"lat": 39.9042, "lng": 116.4074} 
  ],
  "일본": [
    // 치안이 좋은 도시
    {"lat": 35.6895, "lng": 139.6917}, // 도쿄
    {"lat": 34.6937, "lng": 135.5023}, // 오사카
    {"lat": 35.0116, "lng": 135.7681}, // 교토
    
    // 치안이 안 좋은 도시
    {"lat": 35.1815, "lng": 136.9066}, // 나고야
    {"lat": 33.5904, "lng": 130.4017},  // 후쿠오카
    {"lat": 35.6895, "lng": 139.6917} //수도
  ],
  "태국": [
    // 치안이 좋은 도시
    {"lat": 13.7563, "lng": 100.5018}, // 방콕
    {"lat": 18.7883, "lng": 98.9853},  // 치앙마이
    {"lat": 12.5684, "lng": 99.9577},  // 후아힌

    // 치안이 안 좋은 도시
    {"lat": 7.8804, "lng": 98.3923},  // 푸켓
    {"lat": 12.9278, "lng": 100.8771},  // 파타야
    {"lat": 13.7563, "lng": 100.5018} //수도
  ]
};
  // 마커 생성 함수
  Set<Marker> _generateMarkers(country) {
  Set<Marker> markers = {};

  for (var booking in responseData) {
    country = booking["travelCountry"];

    // 해당 국가의 도시 리스트 가져오기
    List<Map<String, double>>? cityList = countryCoordinates[country];

    if (cityList != null && cityList.isNotEmpty) {
      // 도시 리스트에서 첫 번째 좌표로 마커 생성
      Map<String, double> City1 = cityList[0];
      Map<String, double> City2 = cityList[1];
      Map<String, double> City3 = cityList[2];
      Map<String, double> City4 = cityList[3];
      Map<String, double> City5 = cityList[4];
      markers.add(
        Marker(
          markerId: MarkerId('$country-${booking["email"]}'),
          position: LatLng(City1["lat"]!, City1["lng"]!),
          icon: markerIcon1!,
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('$country-${booking["email"]}'),
          position: LatLng(City2["lat"]!, City2["lng"]!),
          icon: markerIcon1!,
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('$country-${booking["email"]}'),
          position: LatLng(City3["lat"]!, City3["lng"]!),
          icon: markerIcon2!,
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('$country-${booking["email"]}'),
          position: LatLng(City4["lat"]!, City4["lng"]!),
          icon: markerIcon3!,
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('$country-${booking["email"]}'),
          position: LatLng(City5["lat"]!, City5["lng"]!),
          icon: markerIcon4!,
        ),
      );
    }
  }

  return markers;
}
  
  // GET 요청을 보내는 메서드
  Future<void> fetchData() async {
    try {
      // 요청을 보낼 URL
      String url = 'http://43.203.22.130:8000/get-bookings'; // 실제 API URL로 교체
      String? value = await storage.read(key: 'access_token');

      // GET 요청 보내기
      Response response = await dio.post(url, data: {"access_token" : value});

      if (response.statusCode == 200) {
        // 응답 데이터가 리스트 형식일 경우
        List<dynamic> dataList = response.data;

        // 리스트 데이터를 Map<String, dynamic> 형식으로 변환
        setState(() {
          responseData = dataList.map((item) => item as Map<String, dynamic>).toList();
        });
        print('Data fetched: $responseData');
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  //나의 현재 좌표
  static const CameraPosition _Hannam = CameraPosition(
    target: LatLng(36.3547, 127.4210),  
    zoom: 14.4746, 
  );
  
  CameraPosition _me = CameraPosition(
    target: LatLng(36.3547, 127.4210),  
    zoom: 14.4746, 
  );

  @override
  void initState() {
    super.initState();
    fetchData();
    setCustomMapPin();  // 앱 초기화 시 커스텀 마커 아이콘 설정
  }

  // 커스텀 마커 아이콘을 설정하는 함수
  void setCustomMapPin() async {
    markerIcon1 = await getBytesFromAsset('assets/safe_marker.png', 80);  // 이미지 파일을 바이트로 변환
    markerIcon2 = await getBytesFromAsset('assets/normal_marker.png', 80);
    markerIcon3 = await getBytesFromAsset('assets/alter_marker.png', 80);
    markerIcon4 = await getBytesFromAsset('assets/danger_marker.png', 80);
    
    setState(() {});  // 마커 아이콘이 설정되면 UI를 갱신
  }

  // 자산에서 이미지를 바이트로 변환하는 함수
  Future<BitmapDescriptor> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);  // 경로에 있는 이미지를 ByteData로 로드
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);  // 이미지를 지정된 너비로 디코딩
    ui.FrameInfo fi = await codec.getNextFrame();  // 이미지를 프레임으로 추출
    final byteData = await fi.image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());  // 바이트 데이터를 BitmapDescriptor로 변환
  }

  @override
  Widget build(BuildContext context) {

  if (country == ''){
      _me = CameraPosition(
    target: LatLng(36.3547, 127.4210),  
    zoom: 14.4746, 
    );
  }

    if (markerIcon1 == null || markerIcon2 == null || markerIcon3 == null || markerIcon4 == null) {
      return Scaffold(
        body: const Center(child: CircularProgressIndicator()),  // 로딩 중 표시
      );
    }

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _me,  // 서울 좌표를 기본 위치로 설정
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _generateMarkers(country)
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToSeoul,
        label: const Text('Go to me!'),
        icon: const Icon(Icons.location_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // 왼쪽 아래 위치
    );
  }

  // "Go to Seoul!" 버튼 클릭 시 서울로 이동하는 기능
  Future<void> _goToSeoul() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_Hannam));
  }
}