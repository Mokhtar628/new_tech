import 'package:flutter/material.dart';
import '../Admin/addUser.dart';
import '../Admin/home.dart';
import '../User/addProduct.dart';
import '../User/addWorker.dart';
import '../User/home.dart';
import '../User/viewWorker.dart';
import '../Worker/addProduct.dart';

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

  void addWorkerUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWorker()));
  }

  void viewWorkerUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewWorker()));
  }

  void addProductUI(BuildContext context, String name){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProduct(name)));
  }
  void addProductCUI(BuildContext context, String name, String dept){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProductC(name,dept)));
  }
}