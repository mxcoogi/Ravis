import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor? markerIcon;  // markerIcon을 nullable로 변경하여 초기화 전에는 null 상태로 처리

  // 서울의 좌표
  static const CameraPosition _kHannam = CameraPosition(
    target: LatLng(36.3547, 127.4210),  // 서울의 위도와 경도
    zoom: 14.4746, // 기본 줌 레벨
  );

  @override
  void initState() {
    super.initState();
    setCustomMapPin();  // 앱 초기화 시 커스텀 마커 아이콘 설정
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
    // markerIcon이 초기화되지 않은 경우, 로딩 화면을 보여줍니다.
    if (markerIcon == null) {
      return Scaffold(
        body: const Center(child: CircularProgressIndicator()),  // 로딩 중 표시
      );
    }

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kHannam,  // 서울 좌표를 기본 위치로 설정
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: MarkerId('Hannam'),  // 마커 ID 설정
            position: _kHannam.target,  // 마커 위치 설정
            icon: markerIcon!,  // 커스텀 아이콘 설정 (null이 아니므로 ! 사용)
          ),
        },
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToSeoul,
        label: const Text('Go to Hannam!'),
        icon: const Icon(Icons.location_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // 왼쪽 아래 위치
    );
  }

  // "Go to Seoul!" 버튼 클릭 시 서울로 이동하는 기능
  Future<void> _goToSeoul() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kHannam));
  }
}
