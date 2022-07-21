import 'package:flutter/material.dart';

AppBar appBar(String text){
  return AppBar(
    title: Text(text),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color. fromRGBO(31,52,67, 1.0),
                Color. fromRGBO(39,67,89, 1.0),
                Color. fromRGBO(48,80,103, 1.0)
              ])
      ),
    ),
  );
}