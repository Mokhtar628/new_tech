import 'package:firebase_database/firebase_database.dart';
import 'Controllers/controllers.dart';
import 'Controllers/navigators.dart';
import 'Firebase/users.dart';

String InvalidStatement = "";
String validStatement = "";
Navigators navigator = new Navigators();
Controllers controllers = new Controllers();
UsersChild usersChild = new UsersChild(FirebaseDatabase.instance.reference().child("users"));
