import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'firebaseParent.dart';
import 'package:http/http.dart' as http;


class MachineChild extends FireBaseController{
  MachineChild(DatabaseReference connection){
    this.connection = connection;
  }


  void add(String machineName, int rate) {
    var id;
    bool isUpdated = false;

    connection.once().then((DataSnapshot snapshot){
      if(snapshot.value == null){
        connection.push().set({'name': machineName,'rate': rate});
        print("pushed from 21");
        isUpdated = true;
      }else{
      snapshot.value.forEach((key,values) {
        if(values['name']==machineName){
          id= key;
          final String url = "https://newtech-ae012-default-rtdb.firebaseio.com/machines/${DateFormat("yyyy-MM-dd").format(DateTime.now())}/machines/$id.json";
          update(url, machineName, values['rate'], rate);
          isUpdated = true;
          print("Is updated = " + isUpdated.toString());
          return;
        }
      });
    }
    if(!isUpdated){
      print("pushed from 41");
      connection.push().set({'name': machineName,'rate': rate});
      isUpdated = false;
    }
    });
  }

  Future<void> update(String url, String machineName, int valueRate, int rate) async {
    var res = await http.patch(url,body: json.encode({
      "name": machineName,
      "rate": valueRate + rate
    }));
  }
}