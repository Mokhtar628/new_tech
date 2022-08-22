import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:intl/intl.dart';
import 'package:newtech/widgets/layout.dart';
import '../objects.dart';
import '../FactoryManager/department.dart';



class ViewDepartment extends StatefulWidget {
  @override
  _ViewDepartmentState createState() => _ViewDepartmentState();
}




class _ViewDepartmentState extends State<ViewDepartment> {
  Query _ref = FirebaseDatabase.instance.reference().child("products");
  @override
  void initState() {
    //retrieve();
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("products").child(DateFormat("yyyy-MM-dd").format(DateTime.now()));
  }
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  var loading = false;

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
        appBar: appBar("عرض الاقسام"),// app bar end here --------------------------

        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
            Map dept = snapshot.value;
            return userWidget(dept: dept, context: context);
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
                    child: SizedBox(
                      width: 70,
                      child: Row(
                        children: [
                          Text("بحث"),
                          SizedBox(width: 10,),
                          if(loading) SizedBox(width:15,height: 15, child: CircularProgressIndicator())
                        ],
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        loading = true;
                      });
                      Future.delayed(const Duration(seconds: 6), () {
                        setState(() {
                          loading = false;
                        });
                      });
                      var dates=getDaysInBetween(selectedStartDate,selectedEndDate);
                      List<Query> _ref = [];
                      for(String date in dates){
                        _ref.add(FirebaseDatabase.instance.reference().child("products").child(date));
                      }
                      productsChild.getAllDepartmentsWithRefs(_ref,context,dates);
                    })
              ],
            ),
          ),
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
        InputDecoration(border: InputBorder.none, hintText: 'بحث عن عامل',contentPadding: EdgeInsets.fromLTRB(20,0,0,0),),
      ),
    );
  }
}



