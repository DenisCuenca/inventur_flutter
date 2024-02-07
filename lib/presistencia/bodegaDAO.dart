import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventur_v2/presistencia/bodegaDTO.dart';

class BodegaDAO {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> retornarListaProducto(idBodega) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference insumosCollection = firestore.collection('insumos');

    QuerySnapshot querySnapshotinsumos =
        await insumosCollection.where('bodega', isEqualTo: idBodega).get();

    List<QueryDocumentSnapshot> productsData = [
      ...querySnapshotinsumos.docs,
    ];

    return BodegaDTO().getListaProductos(productsData);
  }
}
