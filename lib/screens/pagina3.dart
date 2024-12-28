import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart'; 
import 'package:url_launcher/url_launcher.dart';

class Qr extends StatefulWidget {
  const Qr({super.key});

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  String ? dataScaneada;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MobileScanner(
            onDetect: (barcodes){
              final codigo = barcodes.barcodes;
              if (codigo.isNotEmpty && codigo.first.rawValue != null){
                setState(() {
                  dataScaneada = codigo.first.rawValue!;
                });
              }
            },
          )),
          Expanded(child: Center(
            child: dataScaneada == null ? 
            Text("No  se lee QR")
            :Column(children: [
              Text(dataScaneada!),
              FilledButton(onPressed: (){ _launchUrl(dataScaneada!);}, child: Text("Abrir"))
            ],)
          ))
        ],

      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  if(!await launchUrl(Uri.parse(url))){
    throw Exception('No se puede abrir');
  }
}
