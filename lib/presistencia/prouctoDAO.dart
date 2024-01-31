import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventur_v2/models/producto.dart';

class ProductoDAO {
  Future<void> actualizarDetalle(String uid, Map<String, Object> obj) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection("insumos").doc(uid).update(obj);
  }
}
