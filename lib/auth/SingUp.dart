import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'auth_util.dart';  
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wyrzer/auth/SingIn.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _avatarController = TextEditingController();
  final picker = ImagePicker();

  Future<void> _openImagePicker() async {
    try {
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        setState(() {
          _avatarController.text = pickedFile.path;
        });
      }
    } catch (e) {
      print('Erro ao selecionar imagem: $e');
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
            SvgPicture.asset(
              'assets/img/logo.svg',
              height: 50,
              width: 50,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _openImagePicker,
              child: CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: SizedBox(
                    width: 100, 
                    height: 100,
                    child: _avatarController.text.isNotEmpty &&
                            File(_avatarController.text).existsSync()
                        ? Image.file(
                            File(_avatarController.text),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/img/avatar_placeholder.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),


            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome completo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Text('W',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Eastman-Demi',
                      color: Colors.black,
                    )),
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
                  MaterialPageRoute(builder: (context)=> LoginPage()),
                  );
              },
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Já tem conta bro? ',
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
