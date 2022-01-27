import 'package:ecom_user_side_app/models/user_model.dart';
import 'package:ecom_user_side_app/provider/user_provider.dart';
import 'package:ecom_user_side_app/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  UserServices _userServices = UserServices();

  @override
  void initState() {
    // TODO: implement initState
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    _nameController =
        TextEditingController(text: userProvider.getUserData.name.toString());
    _numberController = TextEditingController(
        text: userProvider.getUserData.contactNumber.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            controller: _numberController,
            decoration: InputDecoration(labelText: 'Number'),
          ),
          RaisedButton(
            onPressed: () {
              var userProvider =
                  Provider.of<UserProvider>(context, listen: false);
              _userServices
                  .updateUserDetails(UserModel(
                      name: _nameController.text,
                      contactNumber: _numberController.text,
                      docId: userProvider.getUserData.docId.toString()))
                  .then((value) {
                _userServices
                    .fetchUserRecord(userProvider.getUserData.docId.toString())
                    .first
                    .then((userData) {
                  Provider.of<UserProvider>(context, listen: false)
                      .saveUserData(userData);
                  Navigator.pop(context);
                });
              });
            },
            child: Text("Edit Profile"),
          )
        ],
      ),
    );
  }
}
