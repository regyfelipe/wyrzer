import 'package:flutter/material.dart';

class BellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bell Page'),
      ),
      body: Center(
        child: Text('Content for Bell Page'),
      ),
    );
  }
}
