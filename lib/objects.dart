import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:newtech/Firebase/machines.dart';
import 'package:newtech/Firebase/products.dart';
import 'Controllers/controllers.dart';
import 'Controllers/navigators.dart';
import 'Firebase/users.dart';

String InvalidStatement = "";
String validStatement = "";
Navigators navigator = new Navigators();
Controllers controllers = new Controllers();
UsersChild usersChild = new UsersChild(FirebaseDatabase.instance.reference().child("users"));
ProductsChild productsChild = new ProductsChild(FirebaseDatabase.instance.reference().child("products").child(DateFormat("yyyy-MM-dd").format(DateTime.now())).child("products"));
MachineChild machineChild = new MachineChild(FirebaseDatabase.instance.reference().child("machines").child(DateFormat("yyyy-MM-dd").format(DateTime.now())).child("machines"));
