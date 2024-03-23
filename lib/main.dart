import 'package:flutter/material.dart';
import 'package:wellancer/screens/details.dart';
import 'package:wellancer/screens/login.dart';
import 'package:wellancer/screens/home.dart';
import 'package:wellancer/screens/profile.dart';
import 'package:wellancer/models/bottomsheet.dart';
import 'package:provider/provider.dart';
import 'package:wellancer/models/profileProvider.dart';

import 'package:wellancer/widgets/jobcontainer.dart';

//firebase_cli
// import 'package:firebase_core/firebase_core.dart';
// import 'package:wellancer/firebase_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(),
        ),
        ChangeNotifierProvider<MyBottomSheetModel>(
          create: (_) => MyBottomSheetModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/signin',
        routes: {
          '/signin': (context) => SignInScreen(),
          '/main': (context) => HomeScreen(),
          '/jobdetail': (context) => DetailsScreen(
                id: 0,
                title: 'Job Title', // Replace with appropriate title value
                enterprise:
                    'Enterprise Name', // Replace with appropriate enterprise value
                description:
                    'Job Description', // Replace with appropriate description value
                initialFunding: '10000',
              ),
          '/account': (context) => AccountScreen(),
        },
      ),
    );
  }
}
