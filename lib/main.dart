import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inventur_v2/controllers/bodegaControllers.dart';
import 'package:inventur_v2/models/bodeguero.dart';
import 'package:inventur_v2/models/distrito.dart';
import 'package:inventur_v2/models/insumoMedico.dart';
import 'package:inventur_v2/pages/editProductPage.dart';
import 'package:inventur_v2/pages/gestionarBodega.dart';
import './models/bodega.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(HomePage());
}

Future<void> addDocument() async {
  // Reference to a Firestore collection

  // final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // CollectionReference collection = firestore.collection('bodegas');
  // try {
  //   await collection.doc().set({
  //     "idbodega": "bod_02",
  //     "nombre": 23,
  //     "ubicacion": "bod_001",
  //     "capacidadAlmacenamiento": 50000,
  //     "responsableBodega": "001_bod",
  //     "distrito": "001_distrito",
  //   });
  //   print('Supplier added successfully');
  // } catch (e) {
  //   print('Error adding supplier: $e');
  // }

  // Add a document to the collection

  // try {
  //   await collection.doc().set({
  //     "bodega": "bod_02",
  //     "cantidad": 23,
  //     "codigo": "bod_001",
  //     "descripcion": "",
  //     "estado": "buen",
  //     "fechaElaboracion": "1974-03-20 00:00:00.000",
  //     "fechaCaducidad": "2024-03-20 00:00:00.000",
  //     "id_categoria": "dispositivos",
  //     "id_proveedor": "12_01",
  //     "name": "tensiómetro",
  //     "precio": 32.54,
  //     "registroSanitario": "no tiene",
  //     "tipoInsumo": "tipo insumo"
  //   });
  //   print('Supplier added successfully');
  // } catch (e) {
  //   print('Error adding supplier: $e');
  // }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    addDocument();
    return MaterialApp(
      routes: {
        "/": (context) => ListaProductos(),
        "/edit": (context) => DetalleProducto(),
      },
      initialRoute: "/",
    );
  }
}
