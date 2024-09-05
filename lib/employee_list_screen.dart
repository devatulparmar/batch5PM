import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {

  List tempList = [];
  List employeeList = [];

  Future getEmployeeList() async {
    Response responseObj = await http.get(Uri.parse('https://reqres.in/api/users'));

    if(responseObj.statusCode == 200){
      var jsonDataObj = jsonDecode(responseObj.body);
      var total = jsonDataObj['total'].toString();
      print('total is $total');
      tempList = jsonDataObj['data'] as List;
      setState(() {});
    }
    else {
      print('error');
    }
  }

  @override
  void initState() {
    super.initState();
    getEmployeeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List Screen'),
      ),
      body: ListView.builder(
        itemCount: tempList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(tempList[index]['avatar']),
                    radius: 100,
                  ),
                  Text('Employee ID :${tempList[index]['id']}'),
                  Text('First Name :${tempList[index]['first_name']}'),
                  Text('Last Name :${tempList[index]['last_name']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
