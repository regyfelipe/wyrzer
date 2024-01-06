import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wyrzer/pages/paper_plane_page.dart';
import 'package:wyrzer/pages/search_page.dart';
import 'package:wyrzer/pages/home_page.dart';
import 'package:wyrzer/pages/bell_page.dart';
import 'package:wyrzer/pages/user_page.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PaperPlanePage(),
    SearchPage(),
    HomePage(),
    BellPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/paper-plane.svg',
              height: 24,
              width: 24,
            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/search.svg',
              height: 24,
              width: 24,
            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/home.svg',
              height: 24,
              width: 24,
            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/bell.svg',
              height: 24,
              width: 24,
            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/user.svg',
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
