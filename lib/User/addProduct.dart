import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../objects.dart';

class AddProductC extends StatefulWidget {
  String name = "";
  String dept = "";

  AddProductC(String name, String dept){
    this.name=name;
    this.dept = dept;
  }

  @override
  _AddProductCState createState() => _AddProductCState(this.name, this.dept);
}

class _AddProductCState extends State<AddProductC> {
  String name = "";
  String machineDropdownValue =  "A";
  String workerDropdownValue = "momo";
  String dept = "";

  _AddProductCState(String name, String dept){
    this.name=name;
    this.dept = dept;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('اضافة معدل انتاج'),
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
            //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)/100,

            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),

              child: SingleChildScrollView(

                child: Container(

                  height: 420,
                  alignment: Alignment.center,
                  color: Color(0x70000000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(12.0),
                        child: TextField(
                          controller: controllers.codeCont,
                          //save inputs
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          //input text color
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color. fromRGBO(39,67,89, 1.0)),
                              //  when the TextFormField in unfocused
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amberAccent),
                              //  when the TextFormField in focused
                            ),
                            hintText: "كود المنتج",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            icon: Icon(
                              Icons.qr_code,
                              color: Color. fromRGBO(39,67,89, 1.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),//name

                      Container(
                        margin: EdgeInsets.all(12.0),
                        child: TextField(
                          controller: controllers.rateCont,
                          //save inputs
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          //input text color
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color. fromRGBO(39,67,89, 1.0)),

                              //  when the TextFormField in unfocused
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amberAccent),
                              //  when the TextFormField in focused
                            ),
                            hintText: "معدل الانتاج",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            icon: Icon(
                              Icons.precision_manufacturing_outlined,
                              color: Color. fromRGBO(39,67,89, 1.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),


                      Container(
                        //padding: EdgeInsets.only(left: 44.0),
                        child: DropdownButton<String>(
                          hint:  Text("اسم العامل",style: TextStyle(color: Colors.white),),
                          dropdownColor: Color. fromRGBO(39,67,89, 1.0),
                          focusColor: Color. fromRGBO(39,67,89, 1.0),
                          iconEnabledColor: Color. fromRGBO(39,67,89, 1.0),
                          value: workerDropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.white),
                          underline: Container(
                            height: 1,
                            color: Color. fromRGBO(39,67,89, 1.0),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              workerDropdownValue = newValue.toString();
                            });
                          },
                          items: usersChild.workers
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      Container(
                        //padding: EdgeInsets.only(left: 44.0),
                        child: DropdownButton<String>(
                          hint:  Text("اسم الماكينه",style: TextStyle(color: Colors.white),),
                          dropdownColor: Color. fromRGBO(39,67,89, 1.0),
                          focusColor: Color. fromRGBO(39,67,89, 1.0),
                          iconEnabledColor: Color. fromRGBO(39,67,89, 1.0),
                          value: machineDropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.white),
                          underline: Container(
                            height: 1,
                            color: Color. fromRGBO(39,67,89, 1.0),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              machineDropdownValue = newValue.toString();
                            });
                          },
                          items: <String>['A','B','C','D']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      RaisedButton(
                        onPressed: () {
                          if(controllers.codeCont.text=="" || controllers.rateCont.text=="" || controllers.op_description.text==""){
                            setState(() {
                              InvalidStatement="الرجاء ادخال كل الحقول";
                              validStatement="";
                            });
                          }else{
                            setState(() {
                              controllers.codeCont.text="";
                              controllers.rateCont.text="";
                              controllers.op_description.text="";
                              controllers.worker.text="";
                              validStatement="تم اضافة المنتج";
                              InvalidStatement="";
                            });
                          }
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: 235,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.red,
                                Colors.redAccent,
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child:
                          const Text('اضافة', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Text(validStatement,style: TextStyle(color: Colors.green),),
                      Text(InvalidStatement,style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
