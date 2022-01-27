import 'package:ecom_user_side_app/provider/user_provider.dart';
import 'package:ecom_user_side_app/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Text("User Name"),
          Text(userData.getUserData.name.toString()),
          Text("User Email"),
          Text(userData.getUserData.email.toString()),
          Text("User Number"),
          Text(userData.getUserData.contactNumber.toString()),
          RaisedButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfileView()));
          })
        ],
      ),
    );
  }
}
