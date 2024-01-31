import '../models/bodega.dart';

class BodegaController {
  Bodega bodega;

  BodegaController({required this.bodega});

  Future<List> consultarListaProductos() async {
    return bodega.retornarListaProducto();
  }
}
