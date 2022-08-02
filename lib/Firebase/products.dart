import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'firebaseParent.dart';
import 'package:http/http.dart' as http;


class ProductsChild extends FireBaseController{

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



}
