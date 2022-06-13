import 'package:core/core.dart';
import 'package:core/resource/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRemoteSource {
  ApiClient apiClient;

  AuthRemoteSource(this.apiClient);

  Future<ApiResponse> login(String username, String password, String deviceName) async {
    Dio dio = apiClient.instance();
    try {
      Response response = await dio.post(
        "/mobile/sign-in",
        data: {
          "username": username,
          "password": password,
          "device_name": deviceName,
        },
      );

      return SuccessResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      rethrow;
    } catch (e) {
      print("test");
      return FailedResponse(message: e.toString(), status: false);
    }
  }

  register({required String username, required String phone, required String password}) {
    Dio dio = apiClient.instance();
  }

  Future<ApiResponse> checkToken() async {
    Dio dio = apiClient.instance();
    try {
      Response response = await dio.post("/mobile/check-token");
      return SuccessResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      rethrow;
    }
  }
}
