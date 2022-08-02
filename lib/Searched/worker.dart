import 'package:flutter/material.dart';

class SearchedWorker extends StatefulWidget {
  String name = "", pass = "", type = "";
  SearchedWorker(String name,String pass, String type){
    this.name=name;
    this.pass=pass;
    this.type=type;
  }
  @override
  _SearchedWorkerState createState() => _SearchedWorkerState(name,pass,type);
}

class _SearchedWorkerState extends State<SearchedWorker> {
  String name = "",pass = "", type="";
  _SearchedWorkerState(String this.name,String this.pass, String this.type);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          body: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              width: 280,
                              height: 90,
                              //alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color. fromRGBO(31,52,67, 1.0),
                                  Color. fromRGBO(39,67,89, 1.0),
                                  Color. fromRGBO(48,80,103, 1.0)]),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Name : "+name,style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Password : "+pass,style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Type : "+type,style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}


