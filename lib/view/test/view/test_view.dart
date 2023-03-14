import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/test_controller.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TestController data = context.watch();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("TestView"),
            MaterialButton(
              onPressed: () async {
                await getReq(data);
              },
              child: const Text("Tap me "),
            )
          ],
        ),
      ),
    );
  }

  Future getReq(TestController data) async => data.getSampleReq();
}
