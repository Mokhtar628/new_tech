import 'package:flutter/material.dart';

import '../objects.dart';
import '../widgets/layout.dart';


class Admin extends StatefulWidget {
  String? name;

  Admin(String name){
    this.name=name;
  }

  @override
  _AdminState createState() => _AdminState(name);
}

class _AdminState extends State<Admin> {
  String? name;

  _AdminState(String? name){
    this.name=name;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: appBar("Welcome Mr: "+name.toString()),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(210, 0, 0, 0),
                color:Color. fromRGBO(39,67,89, 1.0),
                child: Text("Admin Field",style: TextStyle(color: Colors.white),),
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
                        child: Text("Add user",style: TextStyle(color: Colors.white,fontSize: 20)),
                      ),
                      onTap: () {
                        navigator.addUserUI(context);
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
                        child: Text("View machines",style: TextStyle(color: Colors.white,fontSize: 20,)),
                      ),
                      onTap: () {
                        navigator.viewMachinesUI(context);
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
                        child: Text("View users",style: TextStyle(color: Colors.white,fontSize: 20,)),
                      ),
                      onTap: () {
                        navigator.viewUsersUI(context);
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
                        child: Text("View departments",style: TextStyle(color: Colors.white,fontSize: 20,)),
                      ),
                      onTap: () {
                        navigator.viewAdminDepartmentUI(context);
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
