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
  Item("مثقاب تخويش 4","data"),
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
  Item("الدور الارضي","sep"),
  Item("فريزة CNC 18","data"),
  Item("مخرطة CNC 19","data"),
  Item("مخرطة CNC 20","data"),
  Item("مخرطة CNC 31","data"),
  Item("فريزة CNC 32","data"),
  Item("فريزة CNC 33","data"),
  Item("فريزة CNC 34","data"),
  Item("مخرطة CNC 35","data"),
  Item("مخرطة CNC 36","data"),
  Item("مخرطة CNC 38","data"),
  Item("مخرطة CNC 60","data"),
  Item("مخرطة 2","data"),
  Item("مخرطة 3","data"),
  Item("مخرطة 7","data"),
  Item("مخرطة برجية 9","data"),
  Item("مخرطة برجية 11","data"),
  Item("مخرطة نصف اوتوماتيك 12","data"),
  Item("مخرطة صيني 63","data"),
  Item("مخرطة صيني 64","data"),
  Item("مثقاب عمودي 6","data"),
  Item("مثقاب عمودي 13","data"),
  Item("مثقاب 1-8","data"),
  Item("مثقاب 41","data"),
  Item("مثقاب 59","data"),
  Item("مثقاب 66","data"),
  Item("مثقاب 67","data"),
  Item("مثقاب 68","data"),
  Item("مثقاب 69","data"),
  Item("مثقاب 70","data"),
  Item("مثقاب 72","data"),
  Item("مثقاب 73","data"),
  Item("مثقاب 74","data"),
  Item("م لحام ارجون 39","data"),
  Item("م لحام CO2 40","data"),
  Item("م لحام CO2 41","data"),
  Item("م لحام ارجون 42","data"),
  Item("م لحام كهرباء 43","data"),


];
