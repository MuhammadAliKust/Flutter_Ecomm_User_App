import 'package:ecom_user_side_app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();

  AuthServices _authServices = AuthServices();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password Screen"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Email ID'),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                makeLoadingTrue();
                _authServices
                    .resetPassword(email: _emailController.text)
                    .then((value) {
                  makeLoadingFalse();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Message!"),
                          content: Text(
                              "Password reset link has been sent to your mail box."),
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
              },
              child: Text("Set Password"),
            )
          ],
        ),
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
