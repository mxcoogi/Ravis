import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  const Map({super.key});


  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor? markerIcon;  // markerIcon을 nullable로 변경하여 초기화 전에는 null 상태로 처리
  CameraPosition? _initialPosition;  // 초기 카메라 위치
  Position? _currentPosition;  // 현재 위치 저장 변수
  /*final List<City> cities = [
    City(id: 'Seoul', name: '서울', latitude: 37.5665, longitude: 126.9780),
    City(id: 'Busan', name: '부산', latitude: 35.1796, longitude: 129.0756),
    City(id: 'Incheon', name: '인천', latitude: 37.4563, longitude: 126.7052),
    City(id: 'Daegu', name: '대구', latitude: 35.8722, longitude: 128.6025),
    City(id: 'Daejeon', name: '대전', latitude: 36.3504, longitude: 127.3845),
    City(id: 'Ulsan', name: '울산', latitude: 35.5373, longitude: 129.3114),
    City(id: 'Gwangju', name: '광주', latitude: 35.1595, longitude: 126.8526),
    City(id: 'LosAngeles', name: '로스앤젤레스', latitude: 34.0522, longitude: -118.2437),
  City(id: 'LongBeach', name: '롱비치', latitude: 33.7683, longitude: -118.1956),
  City(id: 'SantaMonica', name: '산타모니카', latitude: 34.0226, longitude: -118.4957),
  City(id: 'Venice', name: '베니스', latitude: 33.9850, longitude: -118.4695),
  City(id: 'Hollywood', name: '할리우드', latitude: 34.0928, longitude: -118.3287),
  City(id: 'BeverlyHills', name: '베버리 힐스', latitude: 34.0696, longitude: -118.4053),
  City(id: 'Pasadena', name: '패서디나', latitude: 34.1478, longitude: -118.1445),
  City(id: 'CulverCity', name: '컬버시티', latitude: 34.0219, longitude: -118.4132),
  City(id: 'FukuokaAirport', name: '후쿠오카 공항', latitude: 33.5850, longitude: 130.4511),
  City(id: 'FukuokaCity', name: '후쿠오카', latitude: 33.5902, longitude: 130.4017),
  City(id: 'Chikushino', name: '지쿠히', latitude: 33.5236, longitude: 130.5053),
  City(id: 'OhoriPark', name: '오호리 공원', latitude: 33.5936, longitude: 130.3835),
  City(id: 'Dazaifu', name: '다자이후', latitude: 33.5244, longitude: 130.5215),
  City(id: 'Hakata', name: '하카타', latitude: 33.5906, longitude: 130.4208),
  City(id: 'Momochi', name: '모모치', latitude: 33.5922, longitude: 130.3764),
  City(id: 'YafuokuDome', name: '야후 오크돔', latitude: 33.5890, longitude: 130.3480),
  City(id: 'Beijing', name: '베이징', latitude: 39.9042, longitude: 116.4074),
  City(id: 'Shanghai', name: '상하이', latitude: 31.2304, longitude: 121.4737),
  City(id: 'Guangzhou', name: '광저우', latitude: 23.1291, longitude: 113.2644),
  City(id: 'Shenzhen', name: '선전', latitude: 22.5431, longitude: 114.0579),
  City(id: 'Chengdu', name: '청두', latitude: 30.5728, longitude: 104.0668),
   City(id: 'Bangkok', name: '방콕', latitude: 13.7563, longitude: 100.5018),
  City(id: 'ChiangMai', name: '치앙마이', latitude: 18.7883, longitude: 98.9860),
  City(id: 'Phuket', name: '푸켓', latitude: 7.8804, longitude: 98.3923),
  City(id: 'Pattaya', name: '파타야', latitude: 12.9270, longitude: 100.8770),
  City(id: 'Ayutthaya', name: '아유타야', latitude: 14.3560, longitude: 100.5685),
  ];*/
  


  // 현재 위치를 가져오는 함수
  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
      _initialPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),  // 현재 위치로 설정
        zoom: 14.0,  // 줌 레벨 설정
      );
    });
  }
  

  @override
  void initState() {
    super.initState();
    setCustomMapPin();  // 앱 초기화 시 커스텀 마커 아이콘 설정
    _getCurrentLocation();
  }

  // 커스텀 마커 아이콘을 설정하는 함수
  void setCustomMapPin() async {
    markerIcon = await getBytesFromAsset('assets/safe_marker.png', 80);  // 이미지 파일을 바이트로 변환
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
  
    return Scaffold(
      body: _initialPosition == null
          ? Center(child: CircularProgressIndicator())
          :
      GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition!,  // 서울 좌표를 기본 위치로 설정
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToCurrentLocation,
        label: const Text('Go to my Location!'),
        icon: const Icon(Icons.location_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // 왼쪽 아래 위치
    );
  }


   // "Go to Seoul!" 버튼 클릭 시 서울로 이동하는 기능
  Future<void> _goToCurrentLocation() async {
    if (_currentPosition != null) {  // 위치가 가져와졌을 때만 이동
      final GoogleMapController controller = await _controller.future;
      CameraPosition currentPositionCamera = CameraPosition(
        target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        zoom: 14.0,
      );
      await controller.animateCamera(CameraUpdate.newCameraPosition(currentPositionCamera));
    }
}
}


