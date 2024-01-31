import '../models/insumoMedico.dart';

class ProductoController {
  InsumoMedico insumoMedico;
  String uid;
  // String uid;

  ProductoController({
    required this.insumoMedico,
    required this.uid,
  });

  Future<void> guardarDetalleProducto() async {
    return insumoMedico.actualizarDetalle(this.uid);
  }
}
