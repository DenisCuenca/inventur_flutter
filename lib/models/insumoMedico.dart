import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventur_v2/models/producto.dart';
import 'package:inventur_v2/presistencia/prouctoDAO.dart';

class InsumoMedico extends Producto {
  String registroSanitario;
  String tipoInsumoM;

  InsumoMedico({
    required this.registroSanitario,
    required this.tipoInsumoM,
    required super.idProducto,
    required super.idCategoria,
    required super.codigo,
    required super.nombre,
    required super.fechaElaboracion,
    required super.fechaCaducidad,
    required super.descripcion,
    required super.precio,
    required super.cantidad,
    required super.bodega,
    required super.proveedor,
    required super.estado,
  });

  // Métodos de la clase InsumoMedico
//  void verificarRegistroSanitario() {}
//  void almacenarInsumo() {}

  Future<void> actualizarDetalle(String uid) async {
    final obj = {
      "name": this.nombre,
      "cantidad": this.cantidad,
      "codigo": this.codigo,
      "estado": this.estado,
      "descripcion": this.descripcion,
      "fechaCaducidad": this.fechaCaducidad,
      "fechaElaboracion": this.fechaElaboracion,
      "id_categoria": this.idCategoria,
      "precio": this.precio,
      "registroSanitario": this.registroSanitario,
      "tipoInsumo": this.tipoInsumoM,
    };
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // await firestore.collection("insumos").doc(uid).update(obj);

    ProductoDAO().actualizarDetalle(uid, obj);
  }
}
