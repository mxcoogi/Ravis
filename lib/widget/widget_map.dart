import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  // 서울의 좌표
  static const CameraPosition _kSeoul = CameraPosition(
    target: LatLng(37.5665, 126.9780),  // 서울의 위도와 경도
    zoom: 14.4746, // 기본 줌 레벨
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal, // 하이브리드 맵 사용 (위성 지도 + 거리 정보)
        initialCameraPosition: _kSeoul, // 서울 좌표를 기본 위치로 설정
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToSeoul,
        label: const Text('Go to Seoul!'),
        icon: const Icon(Icons.location_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // 왼쪽 아래 위치
    );
  }

  // "Go to Seoul!" 버튼 클릭 시 서울로 이동하는 기능
  Future<void> _goToSeoul() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kSeoul));
  }
}
