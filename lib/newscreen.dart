// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:interview/model.dart';

// class Employee {
//   final String name;
//   final String age;
//   final String networth;

//   Employee(this.name, this.age, this.networth);
// }

// class ApiService {
//   // final String baseUrl = "";

//   Future<List<EmployerModel>> fetchEmployeeList() async {
//     final response = await http
//         .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees/'));

//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       final data = json.decode(response.body);
//       return List<EmployerModel>.from(data['data']);
//     } else {
//       print(response.statusCode);
//       throw Exception('Failed to load employee list');
//     }
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final ApiService apiService = ApiService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee List'),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: apiService.fetchEmployeeList(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No data available.'));
//           } else {
//             final employees = snapshot.data!
//                 .map((e) => Employee(e['employee_name'], e['employee_age'],
//                     e['employee_salary']))
//                 .toList();
//             return ListView.builder(
//               itemCount: employees.length,
//               itemBuilder: (context, index) {
//                 final employee = employees[index];
//                 return ListTile(
//                   title: Text('Name: ${employee.name}'),
//                   subtitle: Text(
//                       'Age: ${employee.age} | Networth: ${employee.networth}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
