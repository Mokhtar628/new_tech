import 'package:flutter/material.dart';

import '../objects.dart';
import '../widgets/layout.dart';


class Manager extends StatefulWidget {
  String? name;
  String? type;

  Manager(String name, String type){
    this.name=name;
    this.type = type;
  }

  @override
  _ManagerState createState() => _ManagerState(name, type);
}

class _ManagerState extends State<Manager> {
  String? name;
  String? type;

  _ManagerState(String? name, String? type){
    this.name=name;
    this.type=type;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: appBar(" أهلا "+this.name.toString()),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(210, 0, 0, 0),
                color:Color. fromRGBO(39,67,89, 1.0),
                child: Text(this.type.toString(),style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 25,
                  padding: EdgeInsets.all(20),
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color. fromRGBO(39,67,89, 1.0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.white,spreadRadius: 0.5),
                          ],
                        ),
                        child: Text("اضافة عامل",style: TextStyle(color: Colors.white,fontSize: 20)),
                      ),
                      onTap: () {
                        navigator.addWorkerUI(context);
                      },
                    ),

                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color. fromRGBO(39,67,89, 1.0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.white,spreadRadius: 0.5),
                          ],
                        ),
                        child: Text("اضافة منتج",style: TextStyle(color: Colors.white,fontSize: 20)),
                      ),
                      onTap: () {
                        navigator.addProductManagerUI(context,this.name.toString(),this.type.toString());
                      },
                    ),

                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color. fromRGBO(39,67,89, 1.0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.white,spreadRadius: 0.5),
                          ],
                        ),
                        child: Text("عرض العمال",style: TextStyle(color: Colors.white,fontSize: 20,)),
                      ),
                      onTap: () {
                        navigator.viewWorkerUI(context);
                        // TODO select which worker to appear
                      },
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color. fromRGBO(39,67,89, 1.0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.white,spreadRadius: 0.5),
                          ],
                        ),
                        child: Text("عرض الاقسام",style: TextStyle(color: Colors.white,fontSize: 20)),
                      ),
                      onTap: () {
                        navigator.viewManagerDepartmentUI(context);
                      },
                    ),


                  ],

                ),
              )

            ],
          ),
        ),


      ),
    );
  }
}
