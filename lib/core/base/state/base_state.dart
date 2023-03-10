import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  Size get _dynamicSize => MediaQuery.of(context).size;

  double dynamicHeight(double value) => _dynamicSize.height * value;
  double dynamicWidth(double value) => _dynamicSize.width * value;
}
