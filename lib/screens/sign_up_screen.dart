import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Email ID'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Password'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Confirm Password'),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("SignUp"),
          )
        ],
      ),
    );
  }
}
