// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'models/job.dart';
// import 'models/profile.dart';
// import 'package:wellancer/models/profileProvider.dart';

// Future<List<JobModel>> fetchJobs() async {
//   final response =
//       await http.get(Uri.parse('https://your-api-endpoint.com/jobs'));

//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((job) => JobModel.fromJson(job)).toList();
//   } else {
//     throw Exception('Failed to load jobs');
//   }
// }

// // List<JobModel> jobList = [
// //   JobModel(
// //     description:
// //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum culpa ab vitae, totam voluptatum laudantium excepturi accusantium, incidunt sunt quos nihil, odit consequuntur non modi vel veniam. Eligendi, dicta? Eius.",
// //     iconUrl: "assets/Logo.png",
// //     location: "Austin, TX",
// //     title: "Flutter Developer",
// //     salary: "\$70,000 - 120,000\$",
// //     photos: [
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/09/05/22/33/office-925806_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/06/01/09/04/samsung-793043_1280.jpg",
// //     ],
// //   ),
// //   JobModel(
// //     description:
// //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum culpa ab vitae, totam voluptatum laudantium excepturi accusantium, incidunt sunt quos nihil, odit consequuntur non modi vel veniam. Eligendi, dicta? Eius.",
// //     iconUrl: "assets/Logo.png",
// //     location: "Company, San Francisco, CA",
// //     title: "Web Developer",
// //     salary: "\$50,000 - 80,000\$",
// //     photos: [
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/09/05/22/33/office-925806_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/06/01/09/04/samsung-793043_1280.jpg",
// //     ],
// //   ),
// //   JobModel(
// //     description:
// //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum culpa ab vitae, totam voluptatum laudantium excepturi accusantium, incidunt sunt quos nihil, odit consequuntur non modi vel veniam. Eligendi, dicta? Eius.",
// //     iconUrl: "assets/Logo.png",
// //     location: "Company, San Francisco, CA",
// //     title: "Backend Developer",
// //     salary: "\$170,000 - 230,000\$",
// //     photos: [
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/09/05/22/33/office-925806_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/06/01/09/04/samsung-793043_1280.jpg",
// //     ],
// //   ),
// //   JobModel(
// //     description:
// //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum culpa ab vitae, totam voluptatum laudantium excepturi accusantium, incidunt sunt quos nihil, odit consequuntur non modi vel veniam. Eligendi, dicta? Eius.",
// //     iconUrl: "assets/Logo.png",
// //     location: "Company, San Francisco, CA",
// //     title: "Web Designer",
// //     salary: "\$30,000 - 60,000\$",
// //     photos: [
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/09/05/22/33/office-925806_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/06/01/09/04/samsung-793043_1280.jpg",
// //     ],
// //   ),
// //   JobModel(
// //     description:
// //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum culpa ab vitae, totam voluptatum laudantium excepturi accusantium, incidunt sunt quos nihil, odit consequuntur non modi vel veniam. Eligendi, dicta? Eius.",
// //     iconUrl: "assets/Logo.png",
// //     location: "Company, Austin, TX",
// //     title: "AI Developer",
// //     salary: "\$120,000 - 160,000\$",
// //     photos: [
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/09/05/22/33/office-925806_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
// //       "https://cdn.pixabay.com/photo/2015/06/01/09/04/samsung-793043_1280.jpg",
// //     ],
// //   ),
// // ];
