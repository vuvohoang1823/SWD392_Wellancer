import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username = "John Doe"; // Replace with actual username
  final List<CompanyProject> projects = [
    CompanyProject(
      avatarUrl: "https://example.com/company1_avatar.jpg",
      companyName: "Company 1",
      projectName: "Project 1",
      projectTag: "Type: Backend Dev",
      price: "\$1000",
    ),
    CompanyProject(
      avatarUrl: "https://example.com/company2_avatar.jpg",
      companyName: "Company 2",
      projectName: "Project 2",
      projectTag: "Type: Frontend Dev",
      price: "\$1200",
    ),
    CompanyProject(
      avatarUrl: "https://example.com/company3_avatar.jpg",
      companyName: "Company 3",
      projectName: "Project 3",
      projectTag: "Type: Fullstack Dev",
      price: "\$1500",
    ),
    // Add more CompanyProject objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome, $username',
                  style: TextStyle(fontSize: 18.0),
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://example.com/avatar.jpg'),
                  radius: 20.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to search filter screen
                    // Navigator.pushNamed(context, '/searchFilter');
                  },
                  child: Text('Filter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(projects[index].avatarUrl),
                    ),
                    title: Text(projects[index].companyName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(projects[index].projectName),
                        Text(projects[index].projectTag),
                        Text('Price: ${projects[index].price}'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Navigate to project details screen
                        // Navigator.pushNamed(context, '/projectDetails');
                      },
                      child: Text('See Details'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyProject {
  final String avatarUrl;
  final String companyName;
  final String projectName;
  final String projectTag;
  final String price;

  CompanyProject({
    required this.avatarUrl,
    required this.companyName,
    required this.projectName,
    required this.projectTag,
    required this.price,
  });
}
