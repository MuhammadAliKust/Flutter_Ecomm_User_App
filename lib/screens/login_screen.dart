import 'package:ecom_user_side_app/helper/wrapper.dart';
import 'package:ecom_user_side_app/provider/user_provider.dart';
import 'package:ecom_user_side_app/screens/profile_view.dart';
import 'package:ecom_user_side_app/screens/sign_up_screen.dart';
import 'package:ecom_user_side_app/services/auth_services.dart';
import 'package:ecom_user_side_app/services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _pwdController = TextEditingController();

  AuthServices _authServices = AuthServices();

  bool isLoading = false;

  UserServices _userServices = UserServices();

  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
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
              onPressed: () {
                makeLoadingTrue();
                _authServices
                    .loginUser(
                        email: _emailController.text,
                        password: _pwdController.text)
                    .then((firebaseUser) async {
                  makeLoadingFalse();
                  await _userServices
                      .fetchUserRecord(firebaseUser.user!.uid.toString())
                      .first
                      .then((userData) async {
                    print(userData.toJson('docID'));
                    Provider.of<UserProvider>(context, listen: false)
                        .saveUserData(userData);

                    // await storage.write(key: 'LOGIN_STATUS', value: 'exist');
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileView()));
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
              child: Text("Login"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text("SignUP"),
            ),
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
