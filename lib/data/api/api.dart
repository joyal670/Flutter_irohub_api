import 'dart:convert';

import 'package:api_example/data/urls/url.dart';
import 'package:api_example/model/login_response.dart';
import 'package:api_example/model/register_response/register_response.dart';
import 'package:dio/dio.dart';

class ApiClass {
  final dio = Dio();
  final url = URL();

  ApiClass() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.json,
    );
  }

  Future<RegisterResponse?> registerUserApi(FormData formData) async {
    try {
      final result = await dio.post(url.registerEndpoint, data: formData);
      return RegisterResponse.fromJson(jsonDecode(result.data));
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<LoginResponse?> loginUserApi(FormData formData) async {
    try {
      final result = await dio.post(url.loginEndpoint, data: formData);
      return LoginResponse.fromJson(jsonDecode(result.data));
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
