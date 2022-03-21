import 'package:ecom_user_side_app/screens/login_screen.dart';
import 'package:ecom_user_side_app/screens/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final storage = new FlutterSecureStorage();

  bool isLogged = false;

  @override
  void initState() {
    storage.read(key: 'LOGIN_STATUS').then((value) {
      if (value == null) {
        isLogged = false;
      } else {
        isLogged = true;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLogged ? ProfileView() : LoginScreen();
  }
}
