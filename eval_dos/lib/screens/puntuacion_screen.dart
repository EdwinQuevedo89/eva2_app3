import 'package:flutter/material.dart';

class PuntuacionScreen extends StatefulWidget {
  @override
  _PuntuacionScreenState createState() => _PuntuacionScreenState();
}

class _PuntuacionScreenState extends State<PuntuacionScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _puntuacionController = TextEditingController();

  // Método para validar que la puntuación esté en un rango válido
  bool _isPuntuacionValida(String puntuacion) {
    final num? puntuacionNum = num.tryParse(puntuacion);
    return puntuacionNum != null && puntuacionNum >= 1 && puntuacionNum <= 10;
  }

  void _guardarPuntuacion() {
    final id = _idController.text;
    final nombre = _nombreController.text;
    final puntuacion = _puntuacionController.text;

    if (id.isNotEmpty && nombre.isNotEmpty && puntuacion.isNotEmpty) {
      if (!_isPuntuacionValida(puntuacion)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('La puntuación debe ser un número entre 1 y 10')));
        return;
      }
      
      // Aquí puedes guardar la puntuación en una base de datos o localmente
      print('ID: $id');
      print('Nombre de la película: $nombre');
      print('Puntuación: $puntuacion');

      // Limpiar los campos después de guardar
      _idController.clear();
      _nombreController.clear();
      _puntuacionController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Puntuación guardada')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Por favor, completa todos los campos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Puntuación")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Ir a Películas"), onTap: () => Navigator.pushNamed(context, '/peliculas')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: "ID de la película",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: "Nombre de la película",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _puntuacionController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Puntuación (1-10)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _guardarPuntuacion,
              child: Text("Guardar Puntuación"),
            ),
          ],
        ),
      ),
    );
  }
}
