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
  Item("ماكينة تكويع CNC 1","data"),
  Item("ماكينة تكويع CNC 2","data"),
  Item("ماكينة تكويع CNC 3","data"),
  Item("ماكينة تكويع CNC 4","data"),
  Item("ماكينة بنش 1","data"),
  Item("ماكينة بنش 2","data"),
  Item("ماكينة تقفيل from-end","data"),
  Item("مكبس كونكت تيوب 1","data"),
  Item("مكبس هيدروليك","data"),
  Item("مثقاب 1","data"),
  Item("مثقاب 2","data"),
  Item("مثقاب 3","data"),
  Item("مثقاب 4","data"),
  Item("مثقاب 5","data"),
  Item("مثقاب تخويش 1","data"),
  Item("مثقاب تخويش 2","data"),
  Item("مثقاب تخويش 3","data"),
  Item("مثقاب تخويش 3","data"),
  Item("لمبة لحام 1","data"),
  Item("لمبة لحام 2","data"),
  Item("لمبة لحام 3","data"),
  Item("لمبة لحام 4","data"),
  Item("لمبة لحام 5","data"),
  Item("لمبة لحام 6","data"),
  Item("لمبة لحام الدور الثاني 1","data"),
  Item("لمبة لحام الدور الثاني 2","data"),
  Item("لمبة لحام الدور الثاني 3","data"),
  Item("لمبة لحام الدور الثاني 4","data"),
  Item("ماكينة لحام كهرباء 1","data"),
  Item("ماكينة لحام كهرباء 2","data"),
  Item("ماكينة لحام كهرباء 3","data"),
  Item("ماكينة لحام كهرباء 4","data"),
  Item("قسم الفحص و التغليف","data"),
  Item("مصنع 2","sep"),
  Item("a","data"),
  Item("b","data"),
  Item("c","data"),
];
