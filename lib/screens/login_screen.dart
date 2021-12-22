import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Email ID'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Password'),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [Text("Forgot Password?")],
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
