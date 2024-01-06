import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Center(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding:
                  EdgeInsets.all(8.0), 
              child: SvgPicture.asset(
                'assets/img/logo.svg',
                height: 20.0, 
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Content for Home Page'),
      ),
    );
  }
}
