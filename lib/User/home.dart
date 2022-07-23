import 'package:flutter/material.dart';

import '../objects.dart';
import '../widgets/layout.dart';


class User extends StatefulWidget {
  String? name;
  String? type;

  User(String name, String type){
    this.name=name;
    this.type = type;
  }

  @override
  _UserState createState() => _UserState(name, type);
}

class _UserState extends State<User> {
  String? name;
  String? type;

  _UserState(String? name, String? type){
    this.name=name;
    this.type=type;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: appBar(this.name.toString()+"أهلا "),

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
                        child: Text("عرض العمال",style: TextStyle(color: Colors.white,fontSize: 20,)),
                      ),
                      onTap: () {
                        //navigator.viewProductsUI(context);
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
