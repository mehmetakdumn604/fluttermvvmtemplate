import 'package:flutter/material.dart';

extension EnumExtension<T extends Object> on List<T> {
  List<DropdownMenuItem> toDropdown() {
    List<DropdownMenuItem> dropdownList = [];

    forEach((element) {
      Enum enumValue = element as Enum;
      dropdownList.add(DropdownMenuItem(
        value: enumValue.name,
        child: Text(enumValue.name),
      ));
    });
    return dropdownList;
  }
}

// ignore: constant_identifier_names
enum DayList { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }
