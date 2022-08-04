import 'package:flutter/material.dart';

class searchedProduct extends StatefulWidget {
  String machine = "", product_code = "", production_rate = "", worker="";
  searchedProduct(String machine,String product_code, String production_rate, String worker){
    this.machine=machine;
    this.product_code=product_code;
    this.production_rate=production_rate;
    this.worker=worker;
  }
  @override
  _searchedProductState createState() => _searchedProductState(machine,product_code,production_rate,worker);
}

class _searchedProductState extends State<searchedProduct> {
  String machine = "", product_code = "", production_rate = "", worker="";
  _searchedProductState( this.machine, this.product_code,  this.production_rate, this.worker);
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
                              height: 150,
                              //alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color. fromRGBO(31,52,67, 1.0),
                                  Color. fromRGBO(39,67,89, 1.0),
                                  Color. fromRGBO(48,80,103, 1.0)]),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Machine : "+machine,style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Product code : "+product_code,style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("production rate : "+production_rate,style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Worker : "+worker,style: TextStyle(color: Colors.white),)
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


