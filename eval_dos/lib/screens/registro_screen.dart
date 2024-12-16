import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Método para registrar un nuevo usuario
  void _register() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Por favor, ingresa tu correo y contraseña.");
      return;
    }

    try {
      // Usando Firebase Authentication para registrar al usuario
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Si la creación es exitosa, navega a la pantalla de login
      Navigator.pushReplacementNamed(context, '/login');
    } on FirebaseAuthException catch (e) {
      // Manejar los errores específicos de Firebase
      String errorMessage = "Error al registrar el usuario.";
      if (e.code == 'email-already-in-use') {
        errorMessage = "Este correo ya está registrado.";
      } else if (e.code == 'weak-password') {
        errorMessage = "La contraseña es demasiado débil.";
      }
      _showErrorDialog(errorMessage);
    } catch (e) {
      // Manejo de otros errores generales
      _showErrorDialog("Ocurrió un error. Intenta de nuevo.");
    }
  }

  // Método para mostrar un AlertDialog con el mensaje de error
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo para el correo electrónico
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Correo"),
              keyboardType: TextInputType.emailAddress,
            ),
            // Campo para la contraseña
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            SizedBox(height: 20),
            // Botón para registrar al usuario
            ElevatedButton(
              onPressed: _register,
              child: Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
