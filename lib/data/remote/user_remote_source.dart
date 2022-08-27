import 'dart:convert';
import 'dart:developer';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRemoteSource {
  ApiClient apiClient;
  String resouce = "/user";

  UserRemoteSource(this.apiClient);

  Future<ApiResponse> paginate({String? page, int take = 10, String? sortBy, bool desc = true, String? filter}) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.get(resouce, queryParameters: {
        "filter": filter!,
        'sort': jsonEncode([
          {'selector': sortBy!, 'desc': desc}
        ]),
        "take": take.toString(),
        "page": page!,
      });

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> create(Map<String, dynamic> dataJson) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.post(resouce, data: dataJson);

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> show(String id) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.get("$resouce/$id");

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    }
  }

  Future<ApiResponse> update(Map<String, dynamic> dataJson, int id) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.put("$resouce/$id", data: dataJson);

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> changePassword(Map<String, dynamic> dataJson, int id) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.post("/change-password/$id", data: dataJson);

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    }
  }

  Future<ApiResponse> delete(String id) async {
    Dio dio = await apiClient.instance();
    try {
      Response registerResponse = await dio.delete("$resouce/$id");

      return SuccessResponse.fromJson(registerResponse.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> rolePermission(String id) async {
    Dio dio = await apiClient.instance();
    try {
      Response response = await dio.get("/role/user/$id");
      log(response.toString());

      return SuccessResponse.fromJson(response.data);
    } on DioError catch (e) {
      return FailedResponse(message: e.toString(), status: false);
    } catch (e) {
      rethrow;
    }
  }
}
