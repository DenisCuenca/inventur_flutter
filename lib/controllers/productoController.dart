import 'package:inventur_v2/controllers/bodegaControllers.dart';
import 'package:inventur_v2/models/bodega.dart';
import 'package:inventur_v2/models/bodeguero.dart';
import 'package:inventur_v2/models/distrito.dart';
import 'package:inventur_v2/presistencia/bodegaDAO.dart';

import '../models/insumoMedico.dart';

class ProductoController {
  InsumoMedico insumoMedico;
  String uid;
  // String uid;

  ProductoController({
    required this.insumoMedico,
    required this.uid,
  });

  Bodega bodgueroBodega = Bodega(
      idBodega: "bod_002",
      nombre: "IESS Loja",
      ubicacion: "Loja",
      capacidadAlmacenamiento: 50000,
      responsableBodega: Bodeguero(
          apellido: "apellido",
          nombre: "nombre",
          idBodeguero: "idBodeguero",
          edad: 23,
          cedula: "",
          correo: "correo"),
      distrito: Distrito(
          id: "id",
          nombre: "nombre",
          poblacion: "poblacion",
          ubicacion: "ubicacion"));

  Future<void> guardarDetalleProducto() async {
    insumoMedico.actualizarDetalle(
      this.uid,
    );
    bodgueroBodega.actualizaStock("BAD1rOHWqeq89YVyBnbl", 23);
  }
}
