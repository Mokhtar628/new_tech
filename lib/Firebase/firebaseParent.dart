import 'package:firebase_database/firebase_database.dart';


abstract class FireBaseController{
  DatabaseReference connection = FirebaseDatabase.instance.reference().child("users");
}