import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventur_v2/models/bodega.dart';
import 'package:inventur_v2/models/proveedor.dart';

class Producto {
  final String idProducto;
  final String idCategoria;
  final String codigo;
  final String nombre;
  final String fechaElaboracion;
  final String fechaCaducidad;
  final String descripcion;
  final double precio;
  int cantidad;
  final String bodega;
  final String proveedor;
  String estado;

  Producto({
    required this.idProducto,
    required this.idCategoria,
    required this.codigo,
    required this.nombre,
    required this.fechaElaboracion,
    required this.fechaCaducidad,
    required this.descripcion,
    required this.precio,
    required this.cantidad,
    required this.bodega,
    required this.proveedor,
    required this.estado,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      idProducto: json['idProducto'] ?? '',
      idCategoria: json['idCategoria'] ?? '',
      codigo: json['codigo'] ?? '',
      nombre: json['nombre'] ?? '',
      fechaElaboracion: json['fechaElaboracion'] ?? '',
      fechaCaducidad: json['fechaCaducidad'] ?? '',
      descripcion: json['descripcion'] ?? '',
      precio: (json['precio'] ?? 0).toDouble(),
      cantidad: json['cantidad'] ?? 0,
      bodega: json['bodega'] ??
          '', // Asume que tienes un método fromJson en la clase Bodega
      proveedor: json['proveedor'] ??
          '', // Asume que tienes un método fromJson en la clase Proveedor
      estado: json['estado'] ?? '',
    );
  }

  Map<String, dynamic> retornarDatos() {
    return {
      'idProducto': idProducto,
      'idCategoria': idCategoria,
      'codigo': codigo,
      'nombre': nombre,
      'fechaElaboracion': fechaElaboracion,
      'fechaCaducidad': fechaCaducidad,
      'descripcion': descripcion,
      'precio': precio,
      'cantidad': cantidad,
      'bodega': bodega, // Asume que tienes un método toJson en la clase Bodega
      'proveedor':
          proveedor, // Asume que tienes un método toJson en la clase Proveedor
      'estado': estado,
    };
  }

  String retornarEstado() {
    return estado;
  }

  void asignarEstado(String estado) {
    this.estado = estado;
  }

  // Future<Map> actualizarDetalle() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   CollectionReference productsCollection = firestore.collection('productos');

  //   try {
  //     String documentId = idProducto;

  //     await productsCollection.doc(documentId).update(retornarDatos());
  //     // print('Datos del producto actualizados con éxito');
  //     return {"mns": "Datos del producto actualizados con éxito", "code": 200};
  //   } catch (e) {
  //     // print('Error al actualizar datos del producto: $e');
  //     return {"mns": "Error al actualizar datos del producto: $e", "code": 400};
  //   }
  // }
}
