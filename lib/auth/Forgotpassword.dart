import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueceu a senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              'Esqueceu a senha?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            
            Text(
              'Informe seu e-mail ou nome de usuário cadastrado e enviaremos as instruções para redefinir sua senha.',
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            // Email or username input field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail ou usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20),

           
            ElevatedButton(
              onPressed: () {
                
                _handleForgotPassword(context);
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleForgotPassword(BuildContext context) {

    Navigator.pop(context); 
  }
}
