import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // Function to handle login logic
  void _loginUser(BuildContext context) {
    // Perform login logic here
    // For demonstration purposes, let's assume the login is successful
    bool isLoggedIn = true;

    if (isLoggedIn) {
      // Navigate to the welcome page
      Navigator.pushReplacementNamed(context, '/welcome');
      // Handle failed login
    } else {
      // Show error message or perform other actions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Call the login function when the button is pressed
                _loginUser(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
