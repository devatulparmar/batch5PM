import 'dart:convert';

import 'package:batch5pm/model/UserListModel.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationListScreen extends StatefulWidget {
  const PaginationListScreen({super.key});

  @override
  State<PaginationListScreen> createState() => _PaginationListScreenState();
}

class _PaginationListScreenState extends State<PaginationListScreen> {
  List<UserData> employeeList = [];
  List tempList = [];
  final int _pageLimit = 10;
  final PagingController<int, UserData> _pagingController =
      PagingController(firstPageKey: 0);

  Future _getUserData(int offset) async {
    try {
      Response responseObj = await http.get(Uri.parse(
          'https://api.slingacademy.com/v1/sample-data/users?offset=$offset&limit=$_pageLimit'));

      if (responseObj.statusCode == 200) {
        var jsonDataObj = jsonDecode(responseObj.body);
        tempList = jsonDataObj['users'] as List;
        employeeList = tempList
            .map((dynamic element) => UserData.fromJson(element))
            .toList();

        final isLastPage = employeeList.length < _pageLimit;
        if (isLastPage) {
          _pagingController.appendLastPage(employeeList);
        } else {
          _pagingController.appendPage(employeeList, _pageLimit);
        }
        setState(() {});
      } else {
        MySnackBar.showMySnackBar(
            context: globalNavigationKey.currentContext!,
            content: 'Something went wrong! ');
      }
    } catch (error) {
      MySnackBar.showMySnackBar(
          context: globalNavigationKey.currentContext!,
          content: 'Something Went Wrong! ${_pagingController.error}');
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((dynamic pageKey) {
      _getUserData(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination List'),
      ),
      body: PagedListView<int, UserData>(
        pagingController: _pagingController,
        physics: const BouncingScrollPhysics(),
        builderDelegate: PagedChildBuilderDelegate<UserData>(
          animateTransitions: false,
          transitionDuration: const Duration(seconds: 3),
          firstPageProgressIndicatorBuilder: (BuildContext context) {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          },
          newPageProgressIndicatorBuilder: (BuildContext context) {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          },
          itemBuilder: (BuildContext context, dynamic item, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(item.profilePicture),
                      radius: 100,
                    ),
                    Text('Employee ID :${item.id}'),
                    Text('First Name :${item.firstName}'),
                    Text('Last Name :${item.lastName}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
