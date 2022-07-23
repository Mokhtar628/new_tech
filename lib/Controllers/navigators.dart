import 'package:flutter/material.dart';
import '../Admin/addUser.dart';
import '../Admin/home.dart';
import '../User/home.dart';

class Navigators{
  void adminUI(BuildContext context, String name){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admin(name)));
  }

  void userUI(BuildContext context, String name, String type){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => User(name, type)));
  }

  void addUserUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddUser()));
  }
}