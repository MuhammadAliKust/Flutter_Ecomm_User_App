import 'package:ecom_user_side_app/helper/data_entry_handler.dart';
import 'package:ecom_user_side_app/screens/category_listing_screen.dart';
import 'package:ecom_user_side_app/screens/product_listing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryListingScreen(),
    );
  }
}


