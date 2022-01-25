import 'package:ecom_user_side_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel();

  void saveUserData(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  UserModel get getUserData => _userModel;
}
