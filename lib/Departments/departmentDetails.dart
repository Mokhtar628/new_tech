import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:intl/intl.dart';

import '../objects.dart';



class ViewDepartmentProduct extends StatefulWidget {
  String dept = "";

  ViewDepartmentProduct(String dept){
    this.dept = dept;
  }
  @override
  _ViewDepartmentProductState createState() => _ViewDepartmentProductState(dept);
}


class _ViewDepartmentProductState extends State<ViewDepartmentProduct> {
  String dept = "";

  _ViewDepartmentProductState(String dept){
    this.dept = dept;
  }
  Query _ref = FirebaseDatabase.instance.reference().child("products");
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("products").child(DateFormat("yyyy-MM-dd").format(DateTime.now())).child(dept).child("products");
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          titleSpacing: 0,
          title: TextBox(),
          actions: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              onPressed: () {
                setState(() {
                  //productsChild.search(controllers.SearchCont.text,context);
                });
              },
              child: Icon(Icons.search),
            ),
          ],

          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color. fromRGBO(31,52,67, 1.0),
                      Color. fromRGBO(39,67,89, 1.0),
                      Color. fromRGBO(48,80,103, 1.0)
                    ])
            ),
          ),
        ),// app bar end here --------------------------

        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
            Map product = snapshot.value;
            return userWidget(product: product);
          }),
        ),


      ),
    );
  }
}

Widget userWidget({Map product = const {}})
{
  if(true){//SearchCont.text == emp['name']
    return SingleChildScrollView(
      child: Container(
        child: Column(
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
                        width: 285,
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color. fromRGBO(31,52,67, 1.0),
                            Color. fromRGBO(39,67,89, 1.0),
                            Color. fromRGBO(48,80,103, 1.0)]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Machine : ${product['machine']}",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Product code : ${product['product_code']}",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Production rate : ${product['production_rate']}",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Worker: ${product['workerName']}",style: TextStyle(color: Colors.white),)
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
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      height: 80,
      child: TextField(
        controller: controllers.SearchCont,
        decoration:
        InputDecoration(border: InputBorder.none, hintText: 'Search product',contentPadding: EdgeInsets.fromLTRB(20,0,0,0),),
      ),
    );
  }
}



