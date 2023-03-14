import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';
import 'package:fluttermvvmtemplate/view/test/model/test_model.dart';

class TestController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getSampleReq() async {
    isLoading = true;
    try {
      final response = await NetworkManager.instance.dioGet<TestModel>("todos/", TestModel());

    //  log(response.toString());
      isLoading = false;
    } on Exception catch (e) {
      log(e.toString());
      isLoading = false;
    }
  }
}
