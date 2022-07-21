import 'package:flutter/material.dart';
import '../Admin/addUser.dart';
import '../Admin/home.dart';

class Navigators{
  void adminUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admin("Hossam")));
  }

  void addUserUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddUser()));
  }
}