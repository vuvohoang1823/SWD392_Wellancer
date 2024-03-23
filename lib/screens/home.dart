import 'package:flutter/material.dart';
import 'package:wellancer/models/bottomsheet.dart';
import 'package:wellancer/models/profile.dart';
import 'package:wellancer/widgets/widgets.dart';
import 'package:wellancer/screens/details.dart';
import 'package:provider/provider.dart';
import 'package:wellancer/models/profileProvider.dart';
import 'package:wellancer/widgets/jobcontainer.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class JobModel {
  final String title, enterprise, description, initialFunding;

  JobModel(
      {required this.title,
      required this.enterprise,
      required this.description,
      required this.initialFunding});
}

Future<List<JobModel>> fetchJobs() async {
  final dio = Dio();
  // final headers = {
  //   'Authorization':
  //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjExIiwiaWF0IjoxNzExMDgwODEyLCJleHAiOjE3MTExNjcyMTJ9.pzn-d9EzATwkFYImvlaEnYBk0qD0hOVm1TwSaJ4nyyY',
  //   // Add any other headers if needed
  // };

  // final response =
  //     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments')
  //         // headers: headers,
  //         );

  final response =
      await dio.post('http://localhost:8080/api/v1/posts/getPosts');

  // Print the response status code and body
  // print('Response status code: ${response.statusCode}');
  // print('Response body: ${response.body}');

  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.data}');

  if (response.statusCode == 200) {
    final jsonResponse = response.data['data']['projects'];
    return jsonResponse
        .map<JobModel>((job) => JobModel(
              title: job['title'],
              enterprise: job['createdByAccount']['username'],
              description: job['description'],
              initialFunding: job['initialFunding'].toString(),
            ))
        .toList();
  } else {
    throw Exception('Failed to load jobs');
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<JobModel>>(
      future: fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<JobModel> jobs = snapshot.data!;
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xfff0f0f6),
              body: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 7.0,
                          ),
                          Row(
                            children: <Widget>[
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Text(
                                  'Admin',
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2017/06/09/07/37/notebook-2386034_960_720.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 51,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "Search",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Color(0xffe6e6ec),
                                      filled: true,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe6e6ec),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.tune),
                                    onPressed: () {
                                      Provider.of<MyBottomSheetModel>(context,
                                              listen: false)
                                          .changeState();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: jobs.length,
                              itemBuilder: (ctx, i) {
                                return JobContainer(
                                  title: jobs[i].title,
                                  enterprise: jobs[i].enterprise,
                                  description: jobs[i].description,
                                  initialFunding: jobs[i].initialFunding,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => DetailsScreen(
                                        id: i,
                                        title: jobs[i].title,
                                        enterprise: jobs[i].enterprise,
                                        description: jobs[i].description,
                                        initialFunding: jobs[i].initialFunding,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 60,
                    child: MyBottomNavBar(),
                  ),
                  Provider.of<MyBottomSheetModel>(context).visible
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: MyBottomSheet(),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // Show a loading spinner while waiting for data
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
