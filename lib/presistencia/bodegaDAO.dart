import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventur_v2/presistencia/bodegaDTO.dart';

class BodegaDAO {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> retornarListaProducto(idBodega) async {
    //   CollectionReference productsCollection = firestore.collection('insumos');
    //   List products = [];
    //   QuerySnapshot querySnapshot =
    //       await productsCollection.where('bodega', isEqualTo: idBodega).get();

    //   BodegaDTO().getListaProductos(querySnapshot.docs);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference productsCollection = firestore.collection('insumos');
    List products = [];
    QuerySnapshot querySnapshot =
        await productsCollection.where('bodega', isEqualTo: idBodega).get();

    return BodegaDTO().getListaProductos(querySnapshot.docs);
    // querySnapshot.docs.forEach((element) {
    //   final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    //   print(element.data());
    //   final prod = {
    //     "name": data["name"],
    //     "bodega": data["bodega"],
    //     "cantidad": data["cantidad"],
    //     "codigo": data["codigo"],
    //     "descripcion": data["descripcion"],
    //     "estado": data["estado"],
    //     "fechaCaducidad": data["fechaCaducidad"],
    //     "fechaElaboracion": data["fechaElaboracion"],
    //     "idCategoria": data["id_categoria"],
    //     "id_proveedor": data["id_proveedor"],
    //     "precio": data["precio"],
    //     "registroSanitario": data["registroSanitario"],
    //     "tipoInsumo": data["tipoInsumo"],
    //     "uid": element.id,
    //   };

    //   products.add(prod);
    // });
    // // print(products);
    // return products;
  }
}
