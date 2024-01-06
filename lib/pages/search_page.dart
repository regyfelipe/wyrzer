import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/img/user.jpg'),
                  radius: 15.0,
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'fep.ink',
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
