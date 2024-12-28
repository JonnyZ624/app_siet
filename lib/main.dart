
import 'package:app_siete/screens/pagina3.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MYApp());
}

class MYApp extends StatelessWidget {
  const MYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ("Titulo de la aplicacion"),
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
      ),
      body: Qr(),
    );
  }
}