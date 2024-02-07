import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventur_v2/presistencia/bodegaDTO.dart';

class BodegaDAO {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> retornarListaProducto(idBodega) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference productsCollection = firestore.collection('insumos');

    QuerySnapshot querySnapshot =
        await productsCollection.where('bodega', isEqualTo: idBodega).get();

    return BodegaDTO().getListaProductos(querySnapshot.docs);
  }
}
