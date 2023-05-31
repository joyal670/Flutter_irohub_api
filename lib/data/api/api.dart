import 'dart:convert';

import 'package:api_example/data/urls/url.dart';
import 'package:api_example/model/get_product_response/datum.dart';
import 'package:api_example/model/get_product_response/get_product_response.dart';
import 'package:api_example/model/login_response.dart';
import 'package:api_example/model/register_response/register_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiClass {
  ValueNotifier<List<Datum>> productNotifier = ValueNotifier([]);
  ApiClass._internal();
  static ApiClass instance = ApiClass._internal();
  factory() {
    return instance;
  }

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

  getProducts() async {
    final result = await dio.get(url.productBaseUrl + url.productsEndpoint);
    final getProduct = GetProductResponse.fromJson(result.data);
    if (getProduct.data != null) {
      productNotifier.value.clear();
      productNotifier.value.addAll(getProduct.data!);
    } else {
      productNotifier.value.clear();
    }
  }
}
