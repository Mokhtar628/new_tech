import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../objects.dart';
import 'firebaseParent.dart';
import 'package:http/http.dart' as http;

class UsersChild extends FireBaseController{

  UsersChild(DatabaseReference connection){
    super.connection = connection;
  }

  void add(String name,String pass,String type){
    connection.push().set({'name':name.trim(),'password':pass,'type':type});
  }

  Future<void> CheckUsers(String name,String pass,BuildContext context) async{
    final String url = "https://newtech-ae012-default-rtdb.firebaseio.com/users.json";
    final http.Response res = await http.get(url);
    final data = json.decode(res.body) as Map<String, dynamic>;
    Users user;
    int wrong = 0,ctr=0;
    data.forEach((key, value) {
      user = new Users(value['name'],value['password'],value['type']);
      if(user.name.toLowerCase()==name.toLowerCase().trim() && user.password==pass){
        ctr++;
        if(user.type=="admin"){
          navigator.adminUI(context,user.name);
        }else {
          navigator.userUI(context, user.name, user.type);
        }
      }
      else{
        wrong++;
        ctr++;
      }
    });
  }

}

class Users {
  String name = "";
  String password = "";
  String type = "";

  Users(String name, String password, String type){
    this.name = name;
    this.password = password;
    this.type = type;

  }


  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'type': type,
    };
  }
}