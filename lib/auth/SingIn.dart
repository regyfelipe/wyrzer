import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wyrzer/Home.dart';
import 'package:wyrzer/auth/Forgotpassword.dart';
import 'package:wyrzer/auth/SingUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo SVG
            SvgPicture.asset(
              'assets/img/logo.svg', 
              height: 70,
              width: 70,
            ),

            SizedBox(height: 60),

            // Nome de usuário ou e-mail
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nome de usuário ou e-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

           
            SizedBox(height: 05),

            
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: 'Esqueceu a senha? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Eastman-Regular',
                    ),
                    children: [
                      TextSpan(
                        text: 'Clique aqui',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 103, 43),
                          fontFamily: 'Eastman-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Botão de login
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Text('Y', style: TextStyle(fontSize: 24, fontFamily: 'Eastman-Demi',color: Colors.black)),
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
              ),
            ),

            SizedBox(height: 80),

            
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> RegisterPage())
                );
              },
              child: Align(alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Não tem conta bro? ',
                  style: TextStyle(color: Colors.black, fontFamily: 'Eastman-Regular',),
                  children: [
                    TextSpan(
                      text: 'Clique aqui',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 103, 43),
                        fontFamily: 'Eastman-Regular',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
