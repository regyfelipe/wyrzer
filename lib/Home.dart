import 'dart:typed_data';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final String email;
  final List<dynamic> avatarBytes;

  HomeScreen({
    required this.username,
    required this.email,
    required this.avatarBytes,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = Uint8List.fromList(List<int>.from(avatarBytes));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: MemoryImage(bytes),
                  radius: 15.0,
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$username',
                      style: TextStyle(
                          fontSize: 15.0, fontFamily: 'Eastman-Regular'),
                    ),
                    Text(
                      'Fortaleza-ce',
                      style: TextStyle(
                          fontSize: 9.0, fontFamily: 'Eastman-Regular'),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icon/search.svg',
              height: 20.0,
              width: 20.0,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Conteúdo para a Página Inicial'),
      ),
    );
  }
}
