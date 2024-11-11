import 'dart:convert';

import 'package:batch5pm/model/employee_list_model.dart';
import 'package:batch5pm/repository/api_repository.dart';
import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  int total = 0;
  List tempList = [];
  List<EmployeeData> employeeList = [];
  bool isLoader = false;

  Future<List<EmployeeData>> getEmployeeList() async {
    try {
      setState(() => isLoader = true);
      dio.Response responseObj =
          await ApiRepository().getDioRequest('https://reqres.in/api/users');
      // Response responseObj = await http.get(Uri.parse('https://reqres.in/api/users'));

      if (responseObj.statusCode == 200) {
        var jsonDataObj = responseObj.data;
        tempList = jsonDataObj['data'] as List;
        total = jsonDataObj['total'];
        employeeList = tempList
            .map((dynamic element) => EmployeeData.fromJson(element))
            .toList();
        setState(() => isLoader = false);
        return employeeList;
      } else {
        setState(() => isLoader = false);
        MySnackBar.showMySnackBar(
            context: context, content: 'Something went wrong!');
      }
    } catch (error) {
      setState(() => isLoader = false);
      MySnackBar.showMySnackBar(context: context, content: error.toString());
    }
    return employeeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('User List Screen'),
        actions: [
          IconButton(
            onPressed: () => getEmployeeList(),
            icon: const Icon(
              Icons.refresh,
              size: 25,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getEmployeeList(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            return _helperWidgetList();
          } else if (snapShot.hasError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _helperWidgetList() {
    return ListView.builder(
      itemCount: employeeList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(employeeList[index].avatar ?? ""),
                      radius: 100,
                    ),
                  ),
                  Text('Employee ID :${employeeList[index].id ?? ''}'),
                  Text('First Name :${employeeList[index].firstName ?? ''}'),
                  Text('Last Name :${employeeList[index].lastName ?? ""}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
