import 'dart:io';

import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class RegisterDetailsScreen extends StatelessWidget {
  const RegisterDetailsScreen({
    Key? key,
    // required this.name,
    // required this.email,
    // required this.gender,
    // required this.status,
    // required this.hobbies,
    // required this.state,
    // required this.city,
    // required this.dob,
    required this.arguments,
  }) : super(key: key);

  // final String name, email, gender, status, hobbies, state, city, dob;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Details Screen'),
      ),
      body: Column(
        children: [

          CircleAvatar(
            radius: 100,
            backgroundImage: FileImage(File(arguments['path'])),
          ),
          Row(
            children: [
              Text('Name :${arguments['name']}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('Email :${arguments['email']}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('Gender :${arguments['gender']}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('Marital Status :${arguments['status']}'),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(
              (arguments['hobbies'] as List<String>).length,
              (index) => Row(
                children: [
                  Text('Hobbies :${arguments['hobbies'][index]}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('State :${arguments['state']}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('City :${arguments['city']}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('Date of Birth :${arguments['dob']}'),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
