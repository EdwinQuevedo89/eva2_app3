import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeliculasScreen extends StatefulWidget {
  @override
  _PeliculasScreenState createState() => _PeliculasScreenState();
}

class _PeliculasScreenState extends State<PeliculasScreen> {
  List<dynamic> _peliculas = [];

  // Método para cargar las películas desde la API en línea
  Future<void> _cargarPeliculas() async {
    final response = await http.get(Uri.parse('https://jritsqmet.github.io/web-api/peliculas3.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _peliculas = data['peliculas'];
      });
    } else {
      throw Exception('Error al cargar las películas');
    }
  }

  void _mostrarInformacionPelicula(Map<String, dynamic> pelicula) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pelicula['titulo']),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Director: ${pelicula['director']}'),
              Text('Año: ${pelicula['anio']}'),
              Text('Lanzamiento: ${pelicula['lanzamiento']}'),
              SizedBox(height: 10),
              Text('Descripción: ${pelicula['descripcion']}'),
              SizedBox(height: 10),
              Image.network(pelicula['imagen']),
              SizedBox(height: 10),
              Text('Valoración: ${pelicula['valoracion']}'),
              SizedBox(height: 10),
              Text('Opiniones positivas:'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pelicula['opiniones']['opiniones_positivas']['detalles']
                    .map<Widget>((opinion) {
                  return Text('${opinion['opinion']} (Puntuación: ${opinion['detalles_usuario']['puntuacion']})');
                }).toList(),
              ),
              SizedBox(height: 10),
              Text('Opiniones negativas:'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pelicula['opiniones']['opiniones_negativas']['detalles']
                    .map<Widget>((opinion) {
                  return Text('${opinion['opinion']} (Puntuación: ${opinion['detalles_usuario']['puntuacion']})');
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _cargarPeliculas(); // Llamamos al método para cargar las películas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas'),
      ),
      body: _peliculas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _peliculas.length,
              itemBuilder: (context, index) {
                final pelicula = _peliculas[index];
                return ListTile(
                  leading: Image.network(
                    pelicula['imagen'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(pelicula['titulo']),
                  subtitle: Text('Año: ${pelicula['anio']}'),
                  onTap: () => _mostrarInformacionPelicula(pelicula),
                );
              },
            ),
    );
  }
}

void main() => runApp(MaterialApp(home: PeliculasScreen()));
