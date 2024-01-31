import 'package:cloud_firestore/cloud_firestore.dart';

class BodegaDTO {
  List getListaProductos(List<QueryDocumentSnapshot> productsQuery) {
    List products = [];

    productsQuery.forEach((element) {
      final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      print(element.data());
      final prod = {
        "name": data["name"],
        "bodega": data["bodega"],
        "cantidad": data["cantidad"],
        "codigo": data["codigo"],
        "descripcion": data["descripcion"],
        "estado": data["estado"],
        "fechaCaducidad": data["fechaCaducidad"],
        "fechaElaboracion": data["fechaElaboracion"],
        "idCategoria": data["id_categoria"],
        "id_proveedor": data["id_proveedor"],
        "precio": data["precio"],
        "registroSanitario": data["registroSanitario"],
        "tipoInsumo": data["tipoInsumo"],
        "uid": element.id,
      };

      products.add(prod);
    });
    // print(products);
    return products;
  }
}
