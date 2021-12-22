import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Email ID'),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Get Password Reset Link"),
          )
        ],
      ),
    );
  }
}
