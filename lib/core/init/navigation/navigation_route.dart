import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/navigation/navigation_consts.dart';
import 'package:fluttermvvmtemplate/view/test/controller/test_controller.dart';
import 'package:fluttermvvmtemplate/view/test/view/test_view.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../components/card/not_found_widget.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConsts.SPLASHVIEW:
      case NavigationConsts.TESTVIEW:
        return _normalNavigate(const TestView());

      default:
        return _normalNavigate(const NotFoundWidget());
    }
  }

  Widget Function(BuildContext, Widget?)? rootBuilder(bool isLoading) => (BuildContext context, Widget? child) {
        return LoadingOverlay(
          isLoading: isLoading,
          child: GestureDetector(onTap: () => FocusScope.of(context).unfocus(), child: child!),
        );
      };

  MaterialPageRoute _normalNavigate(Widget page) => MaterialPageRoute(builder: (_) => page);
}
