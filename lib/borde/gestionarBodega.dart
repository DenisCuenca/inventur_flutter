import 'package:flutter/material.dart';
import 'package:inventur_v2/controllers/bodegaControllers.dart';
import 'package:inventur_v2/models/bodega.dart';
import 'package:inventur_v2/models/bodeguero.dart';
import 'package:inventur_v2/models/distrito.dart';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart';

class ListaProductos extends StatefulWidget {
  ListaProductos({super.key});

  @override
  State<ListaProductos> createState() => ListaProductosState();
}

class ListaProductosState extends State<ListaProductos> {
  int numData = 0;

  Bodega bodegueroBodega = Bodega(
      responsableBodega: Bodeguero(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestionar Bodega"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: FutureBuilder(
          future: BodegaController(bodega: bodegueroBodega)
              .consultarListaProductos(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              numData = snapshot.data!.length;
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
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
                          icon: const Icon(Icons.edit_outlined)),
                      isThreeLine: true,
                    ),
                  );
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
      floatingActionButton: FloatingActionButton(
        onPressed: exportToExcel,
        child: const Icon(Icons.file_copy_outlined),
      ),
    );
  }

  Future<void> exportToExcel() async {
    final excel = Excel.createExcel();
    final Sheet sheet = excel[excel.getDefaultSheet()!];
    List<dynamic> listaProductos =
        await BodegaController(bodega: bodegueroBodega)
            .consultarListaProductos();

    List<CellValue?> headers = [
      const TextCellValue("Id"),
      const TextCellValue("Nombre"),
      const TextCellValue("Cantidad"),
      const TextCellValue("Bodega"),
      const TextCellValue("Estado"),
      const TextCellValue("Fecha Caducidad"),
      const TextCellValue("Fecha Elaboración"),
      const TextCellValue("Id Categoria"),
      const TextCellValue("Id proveedor"),
      const TextCellValue("precio"),
      const TextCellValue("Reguistro Sanitario"),
      const TextCellValue("Tipo Insumo"),
    ]; // Ajusta los encabezados según tu estructura de datos
    sheet.appendRow(headers);

    for (var producto in listaProductos) {
      List<CellValue> rowData = [
        TextCellValue(producto["uid"]),
        TextCellValue(producto["name"]),
        TextCellValue(producto["cantidad"].toString()),
        TextCellValue(producto["descripcion"]),
        TextCellValue(producto["estado"]),
        TextCellValue(producto["fechaCaducidad"]),
        TextCellValue(producto["fechaElaboracion"]),
        TextCellValue(producto["idCategoria"]),
        TextCellValue(producto["id_proveedor"]),
        TextCellValue(producto["precio"].toString()),
        TextCellValue(producto["registroSanitario"]),
        TextCellValue(producto["tipoInsumo"]),
      ];
      sheet.appendRow(rowData);
    }

    excel.save(fileName: "reporte.xlsx");
    _mostrarAlerta(context);
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reporte Generado'),
          // content: Text('El producto ha sido editado con exito'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra la alerta
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
