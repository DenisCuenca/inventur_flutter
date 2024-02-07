import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inventur_v2/controllers/bodegaControllers.dart';
import 'package:inventur_v2/models/bodeguero.dart';
import 'package:inventur_v2/models/distrito.dart';
import 'package:inventur_v2/models/insumoMedico.dart';
import 'package:inventur_v2/borde/editProductPage.dart';
import 'package:inventur_v2/borde/gestionarBodega.dart';
import './models/bodega.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // addDocument();
    return MaterialApp(
      routes: {
        "/": (context) => ListaProductos(),
        "/edit": (context) => DetalleProducto(),
      },
      initialRoute: "/",
    );
  }
}
