import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newtech/widgets/layout.dart';
import '../objects.dart';


class MachinesWithDate extends StatefulWidget {

  @override
  _MachinesWithDateState createState() => _MachinesWithDateState();
}




class _MachinesWithDateState extends State<MachinesWithDate> {

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
              children: machineChild.machinesWithDate
                  .map((key, value) => MapEntry(key, userWidget(machines: {'name': key, 'rate': value},context: context)))
                  .values
                  .toList(),
            ),
          ),
        ),



      ),
    );
  }
}

Widget userWidget({Map machines = const {} , required BuildContext context})
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
                                Text("Name : ${machines['name']}",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Rate : ${machines['rate']}",style: TextStyle(color: Colors.white),)
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
    );
  }
  else{
    return Container();
  }
}





