import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('User Page'),
      ),
      body: Center(
        child: Text('Content for User Page'),
      ),
    );
  }
}
