import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:intl/intl.dart';
import '../objects.dart';
import '../widgets/layout.dart';



class ViewMachines extends StatefulWidget {
  @override
  _ViewMachinesState createState() => _ViewMachinesState();
}




class _ViewMachinesState extends State<ViewMachines> {
  Query _ref = FirebaseDatabase.instance.reference().child("machines").child(DateFormat("yyyy-MM-dd").format(DateTime.now())).child("machines");
  var loading = false;
  @override
  void initState() {
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child("machines").child(DateFormat("yyyy-MM-dd").format(DateTime.now())).child("machines");
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
        appBar: appBar("عرض الماكينات بتاريخ اليوم"),// app bar end here --------------------------

        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot,Animation<double>animation,int index){
            Map machine = snapshot.value;
            return userWidget(machine: machine);
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
                        _ref.add(FirebaseDatabase.instance.reference().child("machines").child(date).child("machines"));
                      }
                      machineChild.getMachinesWithRefs(_ref,context,dates);
                    })
              ],
            ),
          ),
        ),

      ),
    );
  }
}

Widget userWidget({Map machine = const {}})
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
                                Text("Name : ${machine['name']}",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                            Row(
                              children: [
                                Text("rate : ${machine['rate']}",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ],
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
}





