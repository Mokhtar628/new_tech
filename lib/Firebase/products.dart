import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Searched/products.dart';
import '../objects.dart';
import 'firebaseParent.dart';
import 'package:http/http.dart' as http;


class ProductsChild extends FireBaseController{
  Map<String, int> deptWithDate = {};
  List< Map<Object?,Object?>> deptProductsWithDate = [];

  ProductsChild(DatabaseReference connection){
    this.connection = connection;
  }

  void setDepartment(String dept){
    this.connection = FirebaseDatabase.instance.reference().child("products").child(DateFormat("yyyy-MM-dd").format(DateTime.now())).child(dept);
  }

  Future<void> add(String name,String productCode,int productRate, String machine, String dept) async {
    connection.child("products").push().set({'workerName':name.trim(),'product_code':productCode.trim(),'production_rate':productRate, 'machine':machine, 'date': DateFormat("yyyy-MM-dd").format(DateTime.now()).toString()});
    var snapshot = await connection.child("rate").once();
    if(snapshot.value == null){
      connection.update({"rate": (productRate), "dept": dept});
    }else{
      connection.update({"rate": (productRate + snapshot.value), "dept": dept});
    }
  }

  Future<void> getDepartmentsWithRefs(List<Query> refs,BuildContext context, List<String> dates) async{
    Map<String, int> retreivedDepts = {};

    for(var ref in refs){
      var snapshot = await ref.once();
      if(snapshot.value == null){

      }else{
        var data = snapshot.value as Map<Object?,Object?>;
        data.forEach((key, value){
          var valuesOfDepts = value as Map<Object?,Object?>;
          if(retreivedDepts.containsKey(key)){
            retreivedDepts[key.toString()] = int.parse(retreivedDepts[key.toString()].toString()) + int.parse(valuesOfDepts['rate'].toString());
          }else{
            retreivedDepts.addAll({key.toString(): int.parse(valuesOfDepts['rate'].toString())});
          }
        });
      }
    }
    this.deptWithDate = retreivedDepts;
    navigator.viewDepartmentWithDateUI(context,dates);
  }

  Future<void> getDepartmentsproductsWithRefs(List<Query> refs, BuildContext context, String dept, List<String> dates) async{
    List< Map<Object?,Object?>> retreivedDeptProduct = [];

    for(var ref in refs){
      var snapshot = await ref.once();
      if(snapshot.value == null){

      }else{
        snapshot.value.forEach((key, value){
          retreivedDeptProduct.add(value as  Map<Object?,Object?>);
        });
      }
    }
    this.deptProductsWithDate = retreivedDeptProduct;
    navigator.viewDepartmentProductWithDateUI(context, dept);
  }

  Future<void> getSpecificDepartmentWithRefs(List<Query> refs, BuildContext context, List<String> dates, String deptName) async {
    List<Map<String, int>> retreivedDepts = [];
    Map<String, int> finalData = {};

    for(var ref in refs){
      var snapshot = await ref.once();
      if(snapshot.value != null){
        if(snapshot.value.containsKey(deptName)){
          var data = snapshot.value[deptName] as Map<Object?,Object?>;
          retreivedDepts.add({data['dept'].toString(): int.parse(data['rate'].toString())});
        }else{
        }
      }
    }
    for(var map in retreivedDepts){
      if(finalData.containsKey(deptName)){
        finalData.update(deptName, (value) => int.parse(map[deptName].toString())+int.parse(finalData[deptName].toString()));
      }else{
        finalData.addAll({deptName: int.parse(map[deptName].toString())});
      }
    }
    this.deptWithDate = finalData;
    navigator.viewDepartmentWithDateUI(context,dates);
  }

}


class Products {
  String machine = "";
  String product_code = "";
  String production_rate = "";
  String workerName = "";
  String date = "";

  Products(String machine, String product_code, String production_rate,
      String workerName, String date) {
    this.machine = machine;
    this.product_code = product_code;
    this.production_rate = production_rate;
    this.workerName = workerName;
    this.date = date;
  }


  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'machine': machine,
      'product_code': product_code,
      'production_rate': production_rate,
      'workerName': workerName,
      'date': date
    };
  }
}
