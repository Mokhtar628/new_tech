import 'package:flutter/material.dart';

import '../objects.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String dropdownValue = "مخارط بلدي";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Add users'),
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

          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 130, 40, 0),
            child: SingleChildScrollView(

              child: Container(
                height: 400,
                alignment: Alignment.center,
                color: Color(0x70000000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextField(
                        maxLength: 30,
                        controller: controllers.nameCont,
                        //save inputs
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        //input text color
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Color. fromRGBO(39,67,89, 1.0),),
                            //  when the TextFormField in unfocused
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                            //  when the TextFormField in focused
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          icon: Icon(
                            Icons.person,
                            color: Color. fromRGBO(39,67,89, 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),//name

                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextField(
                        maxLength: 30,
                        controller: controllers.passCont,
                        //save inputs
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        //input text color
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color. fromRGBO(39,67,89, 1.0),),
                            //  when the TextFormField in unfocused
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                            //  when the TextFormField in focused
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          icon: Icon(
                            Icons.vpn_key,
                            color:
                            Color. fromRGBO(39,67,89, 1.0),

                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),//pass
/*
                    Container(
                      //padding: EdgeInsets.only(left: 44.0),
                      child: DropdownButton<String>(
                        hint:  Text("Select Type",style: TextStyle(color: Colors.white),),
                        dropdownColor: Colors.purpleAccent,
                        focusColor: Colors.purpleAccent,
                        iconEnabledColor: Colors.purpleAccent,
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        underline: Container(
                          height: 1,
                          color: Colors.purpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue.toString();
                          });
                        },
                        items: <String>['admin','worker' , 'المخارط البلدى', 'مثاقيب النحاس الاصفر','المكابس','الفرايز CNC','المخزن الفرعى','التقطيع','التكويع اليدوي','التكويع CNC','مثاقيب النحاس الاحمر','لحام الاكسيجين','لحام الكهرباء','الفرز والتعبئة والتغليف']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
*/
                    RaisedButton(
                      onPressed: () {
                        if(controllers.nameCont.text=="" || controllers.passCont.text==""){
                          setState(() {
                            InvalidStatement="Please enter all fields!!";
                          });
                        }else{
                          //usersChild.add(controllers.nameCont.text, controllers.passCont.text,dropdownValue);
                          setState(() {
                            controllers.nameCont.text = "";
                            controllers.passCont.text = "";
                            InvalidStatement="Added successfully";
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
                              Color. fromRGBO(31,52,67, 1.0),
                              Color. fromRGBO(39,67,89, 1.0),
                              Color. fromRGBO(48,80,103, 1.0)
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child:
                        const Text('Submit', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Text(InvalidStatement,style: TextStyle(color: Colors.red),),

                  ],
                ),
              ),
            ),
          ),
        ),


      ),
    );
  }
}

