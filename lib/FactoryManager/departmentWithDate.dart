import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:intl/intl.dart';
import 'package:newtech/widgets/layout.dart';
import '../objects.dart';


class DepartmentWithDate extends StatefulWidget {
  List<String> dates = [];
  List<Query> _ref = [];

  DepartmentWithDate(List<String> dates) {
    this.dates = dates;
    for(String date in dates){
      _ref.add(FirebaseDatabase.instance.reference().child("products").child(date));
    }
    productsChild.getDepartmentsWithRefs(_ref);
  }

  @override
  _DepartmentWithDateState createState() => _DepartmentWithDateState();
}




class _DepartmentWithDateState extends State<DepartmentWithDate> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar("عرض الاقسام"),

        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: Column(
            children: productsChild.deptWithDate
                .map((key, value) => MapEntry(key, Text(value.toString())))
                .values
                .toList(),
          ),
        ),



      ),
    );
  }
}

Widget userWidget({Map dept = const {} , required BuildContext context})
{
  if(true){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: InkWell(
                      onTap: (){
                        navigator.viewDepartmentProductUI(context, dept['dept']);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 280,
                        height: 90,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color. fromRGBO(31,52,67, 1.0),
                            Color. fromRGBO(39,67,89, 1.0),
                            Color. fromRGBO(48,80,103, 1.0)]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Department : ${dept['dept']}",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Rate : ${dept['rate']}",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
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
        InputDecoration(border: InputBorder.none, hintText: 'بحث عن عامل',contentPadding: EdgeInsets.fromLTRB(20,0,0,0),),
      ),
    );
  }
}



