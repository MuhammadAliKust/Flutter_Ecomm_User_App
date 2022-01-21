import 'package:ecom_user_side_app/models/user_model.dart';
import 'package:ecom_user_side_app/services/auth_services.dart';
import 'package:ecom_user_side_app/services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthServices _authServices = AuthServices();
  bool isLoading = false;
  TextEditingController _emailController = TextEditingController();

  TextEditingController _pwdController = TextEditingController();
  TextEditingController _confirmPwd = TextEditingController();
  UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(hintText: 'Email ID'),
          ),
          TextFormField(
            controller: _pwdController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          TextFormField(
            controller: _confirmPwd,
            decoration: InputDecoration(hintText: 'Confirm Password'),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              if (_pwdController.text == _confirmPwd.text) {
                makeLoadingTrue();
                _authServices
                    .registerUser(
                        email: _emailController.text,
                        password: _pwdController.text)
                    .then((value) {
                  _userServices.createUser(UserModel(
                      docId: value.user!.uid,
                      email: _emailController.text,
                      contactNumber: '2345678',
                      name: 'Test User'));
                  makeLoadingFalse();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Message!"),
                          content: Text("You have successfully registered."),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Okay'))
                          ],
                        );
                      });
                }).onError((error, stackTrace) {
                  makeLoadingFalse();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Message!"),
                          content: Text(error.toString()),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Okay'))
                          ],
                        );
                      });
                });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("Message!"),
                        content: Text('Password does not match.'),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Okay'))
                        ],
                      );
                    });
              }
            },
            child: Text("Register"),
          )
        ],
      ),
    );
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }
}
