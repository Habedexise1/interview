// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:interview/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeListWidget extends StatefulWidget {
  @override
  _EmployeeListWidgetState createState() => _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  List<EmployerModel> employees = [];
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    fetchEmployeeList();
    loadTheme();
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode;
      prefs.setBool('isDarkMode', isDarkMode);
    });
  }

  Future<void> fetchEmployeeList() async {
    final response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final employeeData = jsonData['data'];

      List<EmployerModel> employeeList = [];
      // Limit the number of employees to 20
      for (var i = 0; i < 20 && i < employeeData.length; i++) {
        employeeList.add(EmployerModel.fromJson(employeeData[i]));
      }

      setState(() {
        employees = employeeList;
      });
    } else {
      print('Failed to load employees');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Set the theme based on the selected mode
      home: Scaffold(
        appBar: AppBar(
          title: Text('Employee List'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: toggleTheme,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final employee = employees[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: ListTile(
                    title: Text('Name: ${employee.employeeName}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Age: ${employee.employeeAge}'),
                        Text('Networth: \$${employee.employeeSalary}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
