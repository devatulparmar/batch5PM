import 'dart:async';
import 'dart:convert';

import 'package:batch5pm/model/employee_list_model.dart';
import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  int total = 0;
  List tempList = [];
  List<EmployeeData> employeeList = [];
  bool isLoader = false;

  final StreamController _streamController = StreamController();

  Stream getEmployeeList() async* {
    print('api called');
    try {
      setState(() => isLoader = true);
      Response responseObj =
          await http.get(Uri.parse('https://reqres.in/api/users'));

      if (responseObj.statusCode == 200) {
        var jsonDataObj = jsonDecode(responseObj.body);
        tempList = jsonDataObj['data'] as List;
        total = jsonDataObj['total'];
        employeeList = tempList
            .map((dynamic element) => EmployeeData.fromJson(element))
            .toList();
        setState(() => isLoader = false);
      } else {
        setState(() => isLoader = false);
        MySnackBar.showMySnackBar(
            context: context, content: 'Something went wrong!');
      }
    } catch (error) {
      setState(() => isLoader = false);
      MySnackBar.showMySnackBar(context: context, content: error.toString());
    }
  }

  Future getEmployeeListOld() async {
    print('api called');
    try {
      setState(() => isLoader = true);
      Response responseObj =
          await http.get(Uri.parse('https://reqres.in/api/users'));

      if (responseObj.statusCode == 200) {
        var jsonDataObj = jsonDecode(responseObj.body);
        tempList = jsonDataObj['data'] as List;
        total = jsonDataObj['total'];
        employeeList = tempList
            .map((dynamic element) => EmployeeData.fromJson(element))
            .toList();
        setState(() => isLoader = false);
      } else {
        setState(() => isLoader = false);
        MySnackBar.showMySnackBar(
            context: context, content: 'Something went wrong!');
      }
    } catch (error) {
      setState(() => isLoader = false);
      MySnackBar.showMySnackBar(context: context, content: error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _streamController.addStream(getEmployeeList());
    _streamController.sink;
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Employee List Screen'),
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
            body: Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () => getEmployeeListOld(),
                  backgroundColor: Colors.red,
                  color: Colors.white,
                  strokeWidth: 5,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  // displacement: 250,
                  // edgeOffset: 10,
                  // semanticsLabel: 'semantics label',
                  // semanticsValue: 'semantic value',
                  child: ListView.builder(
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
                                    backgroundImage: NetworkImage(
                                        employeeList[index].avatar ?? ""),
                                    radius: 100,
                                  ),
                                ),
                                Text(
                                    'Employee ID :${employeeList[index].id ?? ''}'),
                                Text(
                                    'First Name :${employeeList[index].firstName ?? ''}'),
                                Text(
                                    'Last Name :${employeeList[index].lastName ?? ""}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: isLoader,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
