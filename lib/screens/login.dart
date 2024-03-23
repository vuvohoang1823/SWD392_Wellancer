import 'package:flutter/material.dart';
import 'package:wellancer/screens/details.dart';
import 'package:wellancer/screens/home.dart';
import 'package:wellancer/models/profileProvider.dart';
import 'package:provider/provider.dart';
import 'package:wellancer/models/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:onesignal_flutter/onesignal_flutter.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void initState() {
    super.initState();
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize('e832ee39-f668-45ce-9f23-d3b64e602ee5');
    OneSignal.Notifications.requestPermission(true).then((value) {
      print('signal value: $value');
    });
  }

  bool _showPass = false;

  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _passEditingController = new TextEditingController();
  var _emailError = "Email not valid";
  var _passError = "Password not valid";
  var _emailInvalid = false;
  var _passInvalid = false;

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
            r"(fpt.edu|FPT.EDU|gmail|GMAIL)\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  void onSignInClicked() {
    setState(() {
      _emailInvalid = !validateEmail(_emailEditingController.text);
      _passInvalid = _passEditingController.text.length < 4;
      if (!_emailInvalid && !_passInvalid) {
        Navigator.push(context, MaterialPageRoute(builder: goToHome));
      }
    });
  }

  Widget goToHome(BuildContext context) {
    return HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.fromLTRB(120, 0, 0, 100),
            child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffd8d8d8)),
              child: Image(
                image: AssetImage(
                    'assets/Logo.png'), // Replace 'png' with your actual file extension (e.g., 'jpg')
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Text(
              "Welcome Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              controller: _emailEditingController,
              decoration: InputDecoration(
                labelText: "Email",
                errorText: _emailInvalid ? _emailError : null,
                labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget>[
                TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _passEditingController,
                  obscureText: !_showPass,
                  decoration: InputDecoration(
                    labelText: "Password",
                    errorText: _passInvalid ? _passError : null,
                    labelStyle:
                        TextStyle(color: Color(0xff888888), fontSize: 15),
                  ),
                ),
                GestureDetector(
                  onTap: onToggleShowPass,
                  child: Text(
                    _showPass ? "HIDE" : "SHOW",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FloatingActionButton(
                backgroundColor: Color(0xff74BA7B),
                onPressed: onSignInClicked,
                child: Text("SIGN IN")),
          ),
          Container(
            height: 130,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Text(
                  "NEW USER?                                                                  ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "SIGN UP",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
