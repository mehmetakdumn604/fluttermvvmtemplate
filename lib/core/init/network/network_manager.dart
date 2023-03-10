import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/core/init/caching/locale_manager.dart';

import '../../base/model/base_error.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl:"https://jsonplaceholder.typicode.com/",// "BASE_URL",
      headers: {
        "token": PreferencesKey.token.getStringValue(),
      },
    );
    _dio = Dio(baseOptions);
    _dio?.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        //example can add options.path += "/get-services";
      },
      onError: (e, handler) {
        log(e.message.toString());
      },
      // onResponse: (e, handler) {
      //   log(e.data); // gelen veri burda convert işlemleri yapılabilir.
      // },
    ));
  }

  Dio? _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio?.get(path);

    switch (response?.statusCode) {
      case HttpStatus.ok:
        final responseBody = response!.data;
        if (responseBody is List) {
          responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String,dynamic>) {
          return model.fromJson(responseBody);
        }
        return responseBody;

      default:
    }
  }
}
