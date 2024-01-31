import 'package:flutter/material.dart';
import 'package:inventur_v2/controllers/bodegaControllers.dart';
import 'package:inventur_v2/models/bodega.dart';
import 'package:inventur_v2/models/bodeguero.dart';
import 'package:inventur_v2/models/distrito.dart';
import 'package:intl/intl.dart';

class ListaProductos extends StatefulWidget {
  ListaProductos({super.key});

  @override
  State<ListaProductos> createState() => ListaProductosState();
}

class ListaProductosState extends State<ListaProductos> {
  @override
  Widget build(BuildContext context) {
    Bodega bodegueroBodega = Bodega(
        bodeguero: Bodeguero(
            apellido: "",
            cedula: "",
            correo: "",
            edad: 2,
            nombre: "",
            idBodeguero: "2"),
        capacidadAlmacenamiento: 3,
        distrito: Distrito(
          id: "id",
          nombre: "nombre",
          poblacion: "poblacion",
          ubicacion: " ubicacion",
        ),
        idBodega: "bod_02",
        nombre: "",
        ubicacion: "");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestionar Bodega"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: FutureBuilder(
          // future: retornarListaProducto(),
          future: BodegaController(bodega: bodegueroBodega)
              .consultarListaProductos(),

          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.medication_liquid_sharp,
                        size: 45,
                      ),
                      title: Text(snapshot.data![index]['name']),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "cantidad: ${snapshot.data![index]['cantidad'].toString()}"),
                          Text(
                              "PVP: ${snapshot.data![index]['precio'].toString()}"),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () async {
                            // final DateFormat formatte = DateFormat('yyyy-MM-dd');
                            await Navigator.pushNamed(context, "/edit",
                                arguments: {
                                  'name': snapshot.data?[index]['name'],
                                  'cantidad': snapshot.data?[index]['cantidad'],
                                  'bodega': snapshot.data?[index]['bodega'],
                                  'codigo': snapshot.data?[index]['codigo'],
                                  'descripcion': snapshot.data?[index]
                                      ['descripcion'],
                                  'estado': snapshot.data?[index]['estado'],
                                  'fechaCaducidad': snapshot.data?[index]
                                      ['fechaCaducidad'],

                                  'fechaElaboracion': snapshot.data?[index]
                                      ['fechaElaboracion'],
                                  'idCategoria': snapshot.data?[index]
                                      ['idCategoria'],
                                  'id_proveedor': snapshot.data?[index]
                                      ['id_proveedor'],
                                  'precio': snapshot.data?[index]['precio'],
                                  'registroSanitario': snapshot.data?[index]
                                      ['registroSanitario'],
                                  'tipoInsumo': snapshot.data?[index]
                                      ['tipoInsumo'],
                                  'uid': snapshot.data?[index]['uid'],
                                  // 'bodega': bodegueroBodega
                                });
                            setState(() {});
                          },
                          icon: Icon(Icons.edit_outlined)),
                      isThreeLine: true,
                    ),
                  );
                  // return ListTile(

                  //   iconColor: Colors.orange,
                  //   tileColor: Color.fromARGB(82, 235, 235, 235),
                  //   leading: Icon(Icons.edit_document),
                  //   title: Text(snapshot.data![index]['name']),
                  //   onTap: () async {
                  //     await Navigator.pushNamed(context, "/edit", arguments: {
                  //       'name': snapshot.data?[index]['name'],
                  //       'uid': snapshot.data?[index]['uid'],
                  //     });
                  //     setState(() {});
                  //   },
                  // );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
