import 'package:flutter/material.dart';
import 'package:newtech/Admin/viewDepartments.dart';
import 'package:newtech/Admin/viewUsers.dart';
import 'package:newtech/Departments/departmentDetails.dart';
import 'package:newtech/Departments/viewDepartmentProductWithDate.dart';
import 'package:newtech/FactoryManager/home.dart';
import '../Admin/addUser.dart';
import '../Admin/departmentWithDate.dart';
import '../Admin/home.dart';
import '../Departments/viewDepartmentSpecificProductWithDate.dart';
import '../FactoryManager/addProduct.dart';
import '../FactoryManager/department.dart';
import '../FactoryManager/departmentWithDate.dart';
import '../Machines/machinesWithDate.dart';
import '../Machines/viewMachines.dart';
import '../User/addProduct.dart';
import '../User/addWorker.dart';
import '../User/home.dart';
import '../User/viewSpecificDepartmentDetails.dart';
import '../User/viewWorker.dart';
import '../Worker/addProduct.dart';


class Navigators{
  void adminUI(BuildContext context, String name){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admin(name)));
  }

  void userUI(BuildContext context, String name, String type){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => User(name, type)));
  }

  void addUserUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddUser()));
  }

  void addWorkerUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddWorker()));
  }

  void viewWorkerUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewWorker()));
  }

  void addProductUI(BuildContext context, String name){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProduct(name)));
  }
  void addProductCUI(BuildContext context, String name, String dept){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProductC(name,dept)));
  }

  void addProductManagerUI(BuildContext context, String name, String dept){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProductManager(name,dept)));
  }
  //Edited..
  void managerUI(BuildContext context, String name, String type){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Manager(name,type)));
  }
  void viewManagerDepartmentUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Department()));
  }

  void viewDepartmentProductUI(BuildContext context, String dept){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDepartmentProduct(dept)));
  }

  void viewAdminDepartmentUI(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDepartment()));
  }

  void viewUsersUI(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewUsers()));
  }

  void viewDepartmentWithDateUI(BuildContext context, List<String> dates){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DepartmentWithDate(dates)));
  }

  void viewAllDepartmentWithDateUI(BuildContext context, List<String> dates){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllDepartmentWithDate(dates)));
  }

  void viewDepartmentProductWithDateUI(BuildContext context, String dept) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDepartmentProductWithDate(dept)));
  }

  void viewDepartmentSpecificProductWithDateUI(BuildContext context, String productCode) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDepartmentSpecificProductWithDate(productCode)));
  }

  void viewMachinesUI(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewMachines()));
  }

  void viewMachinesWithDateUI(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MachinesWithDate()));
  }

  void viewDeptDetailsUI(BuildContext context, String type) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewSpecificDepartmentDetails(type)));
  }

}