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

  ProductsChild(DatabaseReference connection){
    this.connection = connection;
  }

  void setDepartment(String dept){
    this.connection = FirebaseDatabase.instance.reference().child("products").child(DateFormat("yyyy-MM-dd").format(DateTime.now())).child(dept);
  }

  Future<void> add(String name,String productCode,int productRate, String machine, String dept) async {
    connection.child("products").push().set({'workerName':name.trim(),'product_code':productCode.trim(),'production_rate':productRate, 'machine':machine});
    var snapshot = await connection.child("rate").once();
    if(snapshot.value == null){
      connection.update({"rate": (productRate), "dept": dept});
    }else{
      connection.update({"rate": (productRate + snapshot.value), "dept": dept});
    }
  }

  Future<void> getDepartmentsWithRefs(List<Query> refs,BuildContext context) async{
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
    navigator.viewDepartmentWithDateUI(context);
  }

  // Future<void> search(String text,BuildContext context) async{
  //   final String url = "https://newtech-ae012-default-rtdb.firebaseio.com/products.json";
  //   final http.Response res = await http.get(url);
  //   final data = json.decode(res.body) as Map<String, dynamic>;
  //   print("text is"+text);
  //   Products products;
  //   data.forEach((key, value) {
  //     products =  Products(
  //        value["machine"],
  //        value["product_code"] ,
  //        value["production_rate"],
  //        value['workerName'],
  //     );
  //     print("is are");
  //     if(products.product_code.toLowerCase() == text.trim().toLowerCase()){
  //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchedProduct(value["machine"],value["product_code"],value["production_rate"],value["workerName"])));
  //     }
  //   });
  // }



}


class Products {
  String machine = "";
  String product_code = "";
  String production_rate = "";
  String workerName = "";

  Products(String machine, String product_code, String production_rate,
      String workerName) {
    this.machine = machine;
    this.product_code = product_code;
    this.production_rate = production_rate;
    this.workerName = workerName;
  }


  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'machine': machine,
      'product_code': product_code,
      'production_rate': production_rate,
      'workerName': workerName,
    };
  }
}
