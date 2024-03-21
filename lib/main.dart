import 'package:flutter/material.dart';
import 'package:wellancer/screens/details.dart';
import 'package:wellancer/screens/login.dart';
import 'package:wellancer/screens/home.dart';
import 'package:wellancer/screens/profile.dart';
import 'package:wellancer/models/bottomsheet.dart';
import 'package:provider/provider.dart';
import 'package:wellancer/models/profileProvider.dart';

void main() => runApp(MyApp());

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
          '/jobdetail': (context) => DetailsScreen(id: 0),
          '/account': (context) => AccountScreen(),
        },
      ),
    );
  }
}
