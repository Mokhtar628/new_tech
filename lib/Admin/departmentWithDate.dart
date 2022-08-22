import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newtech/widgets/layout.dart';
import '../objects.dart';


class AllDepartmentWithDate extends StatefulWidget {
  List<String> dates = [];

  AllDepartmentWithDate(List<String> dates){
    this.dates = dates;
  }

  @override
  _AllDepartmentWithDateState createState() => _AllDepartmentWithDateState(dates);
}




class _AllDepartmentWithDateState extends State<AllDepartmentWithDate> {

  List<String> dates = [];

  _AllDepartmentWithDateState(List<String> dates){
    this.dates = dates;
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar("عرض الاقسام بالتواريخ المحددة"),

        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: SingleChildScrollView(
            child: Column(
              children: productsChild.deptWithDate
                  .map((key, value) => MapEntry(key, userWidget(dept: {'dept': key, 'rate': value},context: context, dates: this.dates)))
                  .values
                  .toList(),
            ),
          ),
        ),



      ),
    );
  }
}

Widget userWidget({Map dept = const {} , required BuildContext context, required List<String> dates})
{
  if(true){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: InkWell(
                      onTap: (){
                        List<Query> refs = [];
                        for(String date in dates){
                          refs.add(FirebaseDatabase.instance.reference().child("products").child(date).child(dept['dept']).child("products"));
                        }
                        productsChild.getDepartmentsproductsWithRefs(refs,context,dept['dept'],dates);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 280,
                        height: 90,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color. fromRGBO(31,52,67, 1.0),
                            Color. fromRGBO(39,67,89, 1.0),
                            Color. fromRGBO(48,80,103, 1.0)]),
                          borderRadius: BorderRadius.circular(30),
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
                SizedBox(height: 4,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  else{
    return Container();
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



