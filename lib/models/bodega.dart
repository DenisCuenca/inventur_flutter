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
    return BodegaDAO().retornarListaProducto(this.idBodega);
  }

  Future<void> actualizaStock(String uid, int capacidad) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore
        .collection("bodegas")
        .doc(uid)
        .update({"capacidadAlmacenamiento": capacidad});
  }
}
