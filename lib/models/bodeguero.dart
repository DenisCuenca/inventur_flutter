import 'package:cloud_firestore/cloud_firestore.dart';

class Bodeguero {
  final String idBodeguero;
  final String nombre;
  final String apellido;
  final int edad;
  final String cedula;
  final String correo;

  Bodeguero({
    required this.apellido,
    required this.nombre,
    required this.idBodeguero,
    required this.edad,
    required this.cedula,
    required this.correo,
  });

  factory Bodeguero.fromJson(Map<String, dynamic> json) {
    return Bodeguero(
      idBodeguero: json['idBodeguero'] ?? '',
      nombre: json['nombre'] ?? '',
      apellido: json['apellido'] ?? '',
      edad: json['edad'] ?? 0,
      cedula: json['cedula'] ?? '',
      correo: json['correo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idBodeguero': idBodeguero,
      'nombre': nombre,
      'apellido': apellido,
      'edad': edad,
      'cedula': cedula,
      'correo': correo,
    };
  }
}
