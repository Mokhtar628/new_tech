import 'package:flutter/material.dart';
import 'package:newtech/widgets/layout.dart';
import '../objects.dart';



class ViewDepartmentProductWithDate extends StatefulWidget {
  String dept = "";

  ViewDepartmentProductWithDate(String dept){
    this.dept = dept;

  }
  @override
  _ViewDepartmentProductWithDateState createState() => _ViewDepartmentProductWithDateState(dept);
}


class _ViewDepartmentProductWithDateState extends State<ViewDepartmentProductWithDate> {
  String dept = "";

  _ViewDepartmentProductWithDateState(String dept){
    this.dept = dept;

  }
  
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar("المنتج"),// app bar end here --------------------------

        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for(var i in productsChild.deptProductsWithDate) userWidget(product: i)
              ],
            ),
          ),
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
        controller: controllers.codeCont,
        decoration:
        InputDecoration(border: InputBorder.none, hintText: 'بحث عن منتج',contentPadding: EdgeInsets.fromLTRB(20,0,0,0),),
      ),
    );
  }
}



