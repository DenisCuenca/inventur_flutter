import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventur_v2/models/bodeguero.dart';
import 'package:inventur_v2/models/distrito.dart';
import 'package:inventur_v2/presistencia/bodegaDAO.dart';

class Bodega {
  final String idBodega;
  final String nombre;
  final String ubicacion;
  int capacidadAlmacenamiento;
  final Bodeguero bodeguero;
  final Distrito distrito;

  Bodega({
    required this.idBodega,
    required this.nombre,
    required this.ubicacion,
    required this.capacidadAlmacenamiento,
    required this.bodeguero,
    required this.distrito,
  });

  factory Bodega.fromJson(Map<String, dynamic> json) {
    return Bodega(
      idBodega: json['idBodega'] ?? '',
      nombre: json['nombre'] ?? '',
      ubicacion: json['ubicacion'] ?? '',
      capacidadAlmacenamiento: json['capacidadAlmacenamiento'] ?? 0,
      bodeguero: Bodeguero.fromJson(json['bodeguero'] ??
          {}), // Asume que tienes un método fromJson en la clase Bodeguero
      distrito: Distrito.fromJson(json['distrito'] ??
          {}), // Asume que tienes un método fromJson en la clase Bodeguero
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idBodega': idBodega,
      'nombre': nombre,
      'ubicacion': ubicacion,
      'capacidadAlmacenamiento': capacidadAlmacenamiento,
      'bodeguero': bodeguero
          .toJson(), // Asume que tienes un método toJson en la clase Bodeguero
    };
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> retornarListaProducto() async {
    // return BodegaDAO().retornarListaProducto(this.idBodega);

    return BodegaDAO().retornarListaProducto(this.idBodega);
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference productsCollection = firestore.collection('insumos');
    // List products = [];
    // QuerySnapshot querySnapshot = await productsCollection
    //     .where('bodega', isEqualTo: this.idBodega)
    //     .get();

    // querySnapshot.docs.forEach((element) {
    //   final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    //   print(element.data());
    //   final prod = {
    //     "name": data["name"],
    //     "bodega": data["bodega"],
    //     "cantidad": data["cantidad"],
    //     "codigo": data["codigo"],
    //     "descripcion": data["descripcion"],
    //     "estado": data["estado"],
    //     "fechaCaducidad": data["fechaCaducidad"],
    //     "fechaElaboracion": data["fechaElaboracion"],
    //     "idCategoria": data["id_categoria"],
    //     "id_proveedor": data["id_proveedor"],
    //     "precio": data["precio"],
    //     "registroSanitario": data["registroSanitario"],
    //     "tipoInsumo": data["tipoInsumo"],
    //     "uid": element.id,
    //   };

    //   products.add(prod);
    // });
    // // print(products);
    // return products;
  }
}
