import 'package:flutter/material.dart';
import 'package:inventur_v2/borde/gestionarBodega.dart';
import 'package:inventur_v2/controllers/productoController.dart';
import 'package:inventur_v2/models/insumoMedico.dart';
import '../models/bodega.dart';

class DetalleProducto extends StatefulWidget {
  const DetalleProducto({super.key});

  @override
  State<DetalleProducto> createState() => DetalleProductoState();
}

class DetalleProductoState extends State<DetalleProducto> {
  Widget buildCustomTextField(
      TextEditingController controller, String hintText) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController bodegaController = TextEditingController();
  TextEditingController codigoController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController fechaCaducidadController = TextEditingController();
  TextEditingController fechaElaboracionController = TextEditingController();
  TextEditingController idCategoriaController = TextEditingController();
  TextEditingController idProveedorController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController registroSanitarioController = TextEditingController();
  TextEditingController tipoInsumoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // Bodega bod = arguments["bodega"];

    nameController.text = arguments["name"];
    cantidadController.text = arguments["cantidad"].toString();

    // bodegaController.text = arguments["bodega"];

    codigoController.text = arguments["codigo"];
    descripcionController.text = arguments["descripcion"];

    estadoController.text = arguments["estado"];
    fechaCaducidadController.text = arguments["fechaCaducidad"];
    fechaElaboracionController.text = arguments["fechaElaboracion"];
    idCategoriaController.text = arguments["idCategoria"];
    // idProveedorController.text = arguments["id_proveedor"];
    precioController.text = arguments["precio"].toString();
    registroSanitarioController.text = arguments["registroSanitario"];
    tipoInsumoController.text = arguments["tipoInsumo"];

    return Scaffold(
      appBar: AppBar(title: const Text("editar producto")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
        child: Column(children: [
          buildCustomTextField(nameController, "Ingrese el nombre"),
          buildCustomTextField(bodegaController, "Ingrese la bodega"),
          buildCustomTextField(codigoController, "Ingrese el codigo"),
          buildCustomTextField(cantidadController, "Ingrese la cantidad"),
          buildCustomTextField(descripcionController, "Ingrese la descripción"),
          buildCustomTextField(estadoController, "Ingrese el estado"),
          buildCustomTextField(
              fechaCaducidadController, "Ingrese la fecha de caducidad"),
          buildCustomTextField(
              fechaElaboracionController, "Ingrese la fecha de elaboracion"),
          buildCustomTextField(idCategoriaController,
              "Ingrese la categoria a la que pertenece este producto"),
          buildCustomTextField(
              precioController, "Ingrese el precio de este producto"),
          buildCustomTextField(registroSanitarioController,
              "Ingrese el registro sanitario de este producto"),
          buildCustomTextField(tipoInsumoController,
              "Ingrese el tipo de insumo al que pertenece este producto"),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // print(arguments["uid"]);
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // print(arguments["uid"]);

                      // final obj = {
                      //   "name": nameController.text,
                      //   "cantidad": int.parse(cantidadController.text),
                      //   "codigo": codigoController.text,
                      //   "descripcion": descripcionController.text,
                      //   "estado": estadoController.text,
                      //   "fechaCaducidad": fechaCaducidadController.text,
                      //   "fechaElaboracion": fechaElaboracionController.text,
                      //   "id_categoria": idCategoriaController.text,
                      //   "precio": double.parse(precioController.text),
                      //   "registroSanitario": registroSanitarioController.text,
                      //   "tipoInsumo": tipoInsumoController.text,
                      // };

                      if (idCategoriaController.text == "Insumo Medico") {
                        InsumoMedico ins = InsumoMedico(
                            registroSanitario: registroSanitarioController.text,
                            tipoInsumoM: tipoInsumoController.text,
                            idProducto: idProveedorController.text,
                            idCategoria: idCategoriaController.text,
                            codigo: idCategoriaController.text,
                            nombre: nameController.text,
                            fechaElaboracion: fechaElaboracionController.text,
                            fechaCaducidad: fechaCaducidadController.text,
                            descripcion: descripcionController.text,
                            precio: double.parse(precioController.text),
                            cantidad: int.parse(cantidadController.text),
                            bodega: bodegaController.text,
                            proveedor: idProveedorController.text,
                            estado: estadoController.text);

                        ProductoController pc = ProductoController(
                            insumoMedico: ins, uid: arguments["uid"]);

                        await pc.guardarDetalleProducto().then((_) {
                          // await ins.actualizarDetalle(arguments["uid"])
                          // await ins.actualizarDetalle(arguments["uid"]).then((_) {
                          // Navigator.pop(context);
                          _mostrarAlerta(context);
                        });
                      }
                      if (idCategoriaController.text == "medicamento") {
                        InsumoMedico ins = InsumoMedico(
                            registroSanitario: registroSanitarioController.text,
                            tipoInsumoM: tipoInsumoController.text,
                            idProducto: idProveedorController.text,
                            idCategoria: idCategoriaController.text,
                            codigo: idCategoriaController.text,
                            nombre: nameController.text,
                            fechaElaboracion: fechaElaboracionController.text,
                            fechaCaducidad: fechaCaducidadController.text,
                            descripcion: descripcionController.text,
                            precio: double.parse(precioController.text),
                            cantidad: int.parse(cantidadController.text),
                            bodega: bodegaController.text,
                            proveedor: idProveedorController.text,
                            estado: estadoController.text);

                        ProductoController pc = ProductoController(
                            insumoMedico: ins, uid: arguments["uid"]);

                        await pc.guardarDetalleProducto().then((_) {
                          // await ins.actualizarDetalle(arguments["uid"])
                          // await ins.actualizarDetalle(arguments["uid"]).then((_) {
                          // Navigator.pop(context);
                          _mostrarAlerta(context);
                        });
                      }

                      // await updateProduct(arguments["uid"], obj).then((_) {
                      //   Navigator.pop(context);
                      // });
                    },
                    child: const Text("Guardar")),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cambios Guardados'),
          content: Text('El producto ha sido editado con exito'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaProductos(),
                    )); // Cierra la alerta
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
