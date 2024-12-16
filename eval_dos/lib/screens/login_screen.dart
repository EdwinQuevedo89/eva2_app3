// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  // Método para manejar el login con Firebase
  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      // Intentar iniciar sesión con Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Si la autenticación es exitosa, navegar a la pantalla de puntuación
      Navigator.pushReplacementNamed(context, '/puntuacion');
    } on FirebaseAuthException catch (e) {
      setState(() {
        // Mostrar un mensaje de error dependiendo del tipo de error
        if (e.code == 'user-not-found') {
          _errorMessage = "No se encontró un usuario con ese correo.";
        } else if (e.code == 'wrong-password') {
          _errorMessage = "La contraseña es incorrecta.";
        } else {
          _errorMessage = "Ocurrió un error: ${e.message}";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Correo"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text("Iniciar sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
