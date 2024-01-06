import 'package:flutter/material.dart';

class PaperPlanePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Paper Plane Page'),
      ),
      body: Center(
        child: Text('Content for Paper Plane Page'),
      ),
    );
  }
}
