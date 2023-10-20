import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UsersDataSource {
  final Dio dio = Dio()
  ..options = BaseOptions(
    headers: {
      "Content-Type": "application/json",
    },
  );
  final String serverUrl = 'https://captive-portal-server.vercel.app/api/tekqore';
  
  Future<dynamic> createUser({
    required String fullName,
    required String mobileNumber,
    required String email,
  }) async {
    dynamic result;
    print({
      "fullName": fullName,
      "mobileNumber": mobileNumber,
      "email": email
    });
    try {
      Response response = await dio.post(
        '$serverUrl/user-post',
        data: {
            "fullName": fullName,
            "mobileNumber": mobileNumber,
            "email": email
        },
      );
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = e.response?.data;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = e.message;
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}