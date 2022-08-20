import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import '../objects.dart';
import 'firebaseParent.dart';
import 'package:http/http.dart' as http;


class MachineChild extends FireBaseController{
  Map<String, int> machinesWithDate = {};

  MachineChild(DatabaseReference connection){
    this.connection = connection;
  }


  void add(String machineName, int rate) {
    var id;
    bool isUpdated = false;

    connection.once().then((DataSnapshot snapshot){
      if(snapshot.value == null){
        connection.push().set({'name': machineName,'rate': rate});
        isUpdated = true;
      }else{
      snapshot.value.forEach((key,values) {
        if(values['name']==machineName){
          id= key;
          final String url = "https://newtech-ae012-default-rtdb.firebaseio.com/machines/${DateFormat("yyyy-MM-dd").format(DateTime.now())}/machines/$id.json";
          update(url, machineName, values['rate'], rate);
          isUpdated = true;
          return;
        }
      });
    }
    if(!isUpdated){
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

  Future<void> getMachinesWithRefs(List<Query> refs, BuildContext context, List<String> dates) async {
    Map<String, int> retreivedMachines = {};

    for(var ref in refs){
      var snapshot = await ref.once();
      if(snapshot.value == null){

      }else{
        var data = snapshot.value as Map<Object?,Object?>;
        data.forEach((key, value){
          var valuesOfMachines = value as Map<Object?,Object?>;
          if(retreivedMachines.containsKey(valuesOfMachines['name'])){
            retreivedMachines[valuesOfMachines['name'].toString()] = int.parse(retreivedMachines[valuesOfMachines['name'].toString()].toString()) + int.parse(valuesOfMachines['rate'].toString());
          }else{
            retreivedMachines.addAll({valuesOfMachines['name'].toString(): int.parse(valuesOfMachines['rate'].toString())});
          }
        });
      }
    }
    this.machinesWithDate = retreivedMachines;
    navigator.viewMachinesWithDateUI(context);
  }
}