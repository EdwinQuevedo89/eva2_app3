import 'package:eval_dos/screens/login_screen.dart';
import 'package:eval_dos/screens/peliculas_screen.dart';
import 'package:eval_dos/screens/puntuacion_screen.dart';
import 'package:eval_dos/screens/registro_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Puntuación de Películas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => WelcomeScreen(), // Bienvenida
        '/login': (context) => LoginScreen(), // Login
        '/registro': (context) => RegistroScreen(), // Registro
        '/puntuacion': (context) => PuntuacionScreen(), // Puntuación
        '/peliculas': (context) => PeliculasScreen(), // Películas
      },
    );
  }
}
