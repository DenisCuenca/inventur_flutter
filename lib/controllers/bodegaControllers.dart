import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bodega.dart';

class BodegaController {
  final Bodega bodega;

  BodegaController({required this.bodega});

  Future<List> consultarListaProductos() async {
    return bodega.retornarListaProducto();
  }
}
