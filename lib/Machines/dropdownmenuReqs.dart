import 'package:flutter/material.dart';

class Item {
  String name = "";
  String type = "";

  Item(String name, String type){
    this.name = name;
    this.type = type;
  }
}

class DropdownMenuItemSeparator<T> extends DropdownMenuItem<T> {
  final String name;

  DropdownMenuItemSeparator({required this.name, Key? key})
      : super(
    key: key,
    child: Text(
      name,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
    ), // Trick the assertion.
  );
}

List<Item> items = [
  Item("مصنع الهيدارات","sep"),
  Item("ماكينة نقطيع رقم 1 single","data"),
  Item("ماكينة تقطيع رقم 2 double","data"),
  Item("ماكينة تكويع multifunction","data"),
  Item("خط التكويع اليدوي","data"),
  Item("مصنع 2","sep"),
  Item("a","data"),
  Item("b","data"),
  Item("c","data"),
];
