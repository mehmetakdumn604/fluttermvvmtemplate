import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';
import 'package:fluttermvvmtemplate/core/init/caching/locale_manager.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  static NetworkManager get instance => _instance;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: AppConstans.BASEURL,
    );
    _dio = Dio(baseOptions);
  }

  Dio? _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    try {
      final response = await _dio?.get(path);

      // _dio?.interceptors.add(InterceptorsWrapper(
      //   onRequest: (options, handler) {
      //     //  options.baseUrl = "https://jsonplaceholder.typicode.com";
      //     options.path += path;
      //   },
      //   onError: (e, handler) {
      //     log(e.toString());
      //   },
      //   onResponse: (Response response, handler) {
      //     log("message");
      //     final responseBody = response.data;
      //     log(responseBody.toString());
      //     if (responseBody is List) {
      //       responseBody.map((e) => model.fromJson(e)).toList();
      //       for (var element in responseBody) {
      //         log(element.toString());
      //       }
      //     }
      //     //  log(response.data.toString()); // gelen base modelden gerekli olan verileri burda convert işlemleri yapılabilir.
      //   },
      // ));

      switch (response?.statusCode) {
        case HttpStatus.ok:
          return response!.data;
          
        //todo check other conditions(errors)
        default:
      }

      return response!.data;
    } catch (e) {
      log(e.toString());
    }
  }
}
