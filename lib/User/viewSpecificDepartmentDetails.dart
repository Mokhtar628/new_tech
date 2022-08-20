import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:intl/intl.dart';
import 'package:newtech/widgets/layout.dart';
import '../objects.dart';


class ViewSpecificDepartmentDetails extends StatefulWidget {
  String departmentName = "";

  ViewSpecificDepartmentDetails(String dptName){
    this.departmentName = dptName;
  }

  @override
  _ViewSpecificDepartmentDetailsState createState() => _ViewSpecificDepartmentDetailsState(departmentName);
}




class _ViewSpecificDepartmentDetailsState extends State<ViewSpecificDepartmentDetails> {
  Query _ref = FirebaseDatabase.instance.reference().child("products");
  String departmentName = "";

  _ViewSpecificDepartmentDetailsState(String dptName){
    this.departmentName = dptName;
  }
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("products").child(DateFormat("yyyy-MM-dd").format(DateTime.now()));
  }

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  Future<void> _selectedStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectedEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  List<String> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<String> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(DateFormat("yyyy-MM-dd").format(startDate.add(Duration(days: i))));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar("عرض الاقسام بتاريخ اليوم"),// app bar end here --------------------------

        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
            Map dept = snapshot.value;
            if(dept['dept'] == this.departmentName){
              return userWidget(dept: dept, context: context);
            }else{
              return Container();
            }
          }),
        ),

        drawer: Drawer(
          child: Container(
            margin: EdgeInsets.fromLTRB(50,150,0,0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("${selectedStartDate.toLocal()}".split(' ')[0]),
                        SizedBox(height: 20.0,),
                        RaisedButton(
                          onPressed: () => _selectedStartDate(context),
                          child: Text('Start date'),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("${selectedEndDate.toLocal()}".split(' ')[0]),
                        SizedBox(height: 20.0,),
                        RaisedButton(
                          onPressed: () => _selectedEndDate(context),
                          child: Text('End date'),
                        ),
                      ],
                    ),
                  ],
                ),
                RaisedButton(
                    child: Text("بحث"),
                    onPressed: (){
                      var dates=getDaysInBetween(selectedStartDate,selectedEndDate);
                      List<Query> _ref = [];
                      for(String date in dates){
                        _ref.add(FirebaseDatabase.instance.reference().child("products").child(date));
                      }
                      productsChild.getSpecificDepartmentWithRefs(_ref,context,dates, departmentName);
                    })
              ],
            ),
          ),
        ),


      ),
    );
  }
}

Widget userWidget({Map dept = const {} , required BuildContext context})
{
  if(true){//SearchCont.text == emp['name']
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



