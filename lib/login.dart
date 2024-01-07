import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste/registration_screen.dart';
import 'auth_service.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> _login(BuildContext context) async {
    final currentContext = context;

    try {
      final user = await _authService.loginUser(
          _usernameController.text, _passwordController.text);

      if (user != null) {
        String? avatarPath;
        if (user['avatar'] is String) {
          avatarPath = user['avatar'];
        } else if (user['avatar'] is List<dynamic> &&
            user['avatar'].isNotEmpty &&
            user['avatar'][0] is String) {
          avatarPath = user['avatar'][0];
        }

        Navigator.pushReplacement(
          currentContext,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              username: user['username'],
              email: user['email'],
              avatarBytes: user['avatar'] ?? [],
            ),
          ),
        );
      } else {
        showDialog(
          context: currentContext,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Authentication Failed'),
              content: Text('Invalid username or password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(currentContext);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Login failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: SvgPicture.asset(
                'assets/logo.svg', 
                height: 60,
                width: 60,
              ),
            ),
            SizedBox(height: 60),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                // );
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
              onPressed: () => _login(context),
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Text('Y',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Eastman-Demi',
                        color: Colors.black)),
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
              ),
            ),

            SizedBox(height: 80),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Não tem conta bro? ',
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
          ],
        ),
      ),
    );
  }
}


