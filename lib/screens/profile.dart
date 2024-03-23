import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class JobModel {
  final String username, email, phone, role;

  JobModel(
      {required this.username,
      required this.email,
      required this.phone,
      required this.role});
}

Future<List<JobModel>> fetchJobs() async {
  final dio = Dio();

  final response =
      await dio.post('http://localhost:8080/api/v1/posts/getPosts');

  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.data}');

  if (response.statusCode == 200) {
    final jsonResponse = response.data['data']['projects'];
    return jsonResponse
        .map<JobModel>((job) => JobModel(
              username: job['createdByAccount']['username'],
              email: job['createdByAccount']['email'],
              phone: job['createdByAccount']['phone'],
              role: job['createdByAccount']['role'],
            ))
        .toList();
  } else {
    throw Exception('Failed to load jobs');
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<JobModel>>(
      future: fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<JobModel> jobs = snapshot.data!;
          if (jobs.isNotEmpty) {
            JobModel job = jobs.first;
            return Scaffold(
              body: Container(
                color: Color.fromARGB(255, 224, 204, 203),
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                constraints: BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                      child: Text(
                        "PROFILE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(120, 0, 0, 100),
                      child: Container(
                        width: 200,
                        height: 200,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                        child: Image(
                          image: AssetImage('assets/Logo.png'),
                        ),
                      ),
                    ),
                    Text("UserName"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextField(
                        enabled: false, // Set to false to disable editing
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: job.username,
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 15),
                        ),
                      ),
                    ),
                    Text("Email"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextField(
                        enabled: false, // Set to false to disable editing
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: job.email,
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 15),
                        ),
                      ),
                    ),
                    Text("Phone"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextField(
                        enabled: false, // Set to false to disable editing
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: job.phone,
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 15),
                        ),
                      ),
                    ),
                    Text("Role"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextField(
                        enabled: false, // Set to false to disable editing
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: job.role,
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
