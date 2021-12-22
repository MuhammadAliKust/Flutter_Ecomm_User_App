import 'package:flutter/material.dart';

class AddressDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Details Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Contact Number'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Delivery Address'),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}
