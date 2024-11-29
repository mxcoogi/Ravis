import 'package:dio/dio.dart';
import 'package:ravis/main.dart';
// 사용자 정보 모델 클래스


class UserInfo {
  final Dio dio = Dio();
  final String url = 'http://43.203.22.130:8000/userinfo';  // API URL

  // 사용자 정보를 백엔드 API로부터 받아오는 함수
  Future<Map<String, dynamic>> fetchUserInfo() async {
    try {
      // Secure Storage에서 토큰을 읽어옴
      final token = await storage.read(key: "access_token");
      if (token == null) {
        throw Exception("Access token not found.");
      }

      // POST 요청을 통해 사용자 정보를 요청
      final response = await dio.post(url, data: {'access_token': token});

      // 응답 상태가 200이면 데이터를 처리
      if (response.statusCode == 200) {
        return response.data;  // JSON을 UserInfoResponse 객체로 변환
      } else {
        throw Exception("Failed to load user info: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred while fetching user info: $e");
    }
  }
}


/*
Time rentaltime = Time(hour: 0, minute: 0);
  Time returntime = Time(hour: 0, minute: 0);

  // 시간 변경시 호출되는 콜백 함수
  void onTimeChanged(Time newTime) {
    setState(() {
      rentaltime = newTime;  // 새로운 시간으로 업데이트
    });
  }
  Navigator.of(context).push(
            showPicker(
                context: context,
                value: Time(hour: 0, minute: 0),
                sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                sunset: TimeOfDay(hour: 18, minute: 0), // optional
                duskSpanInMinutes: 120, // optional
                onChange: onTimeChanged,
            ),
        ); */