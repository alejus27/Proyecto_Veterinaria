import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/controller/sale_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../models/sale_model.dart';

// Clases encargadas de la vista que permite comprar un medicamento
class AddSale extends StatefulWidget {
  static String id = "form_sale";

  const AddSale({Key? key}) : super(key: key);
  //const AddSale({Key? key}) : super(key: key);

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  bool calculate = false;
  bool card = false;
  var cardFormatter = MaskTextInputFormatter(
      mask: '####-####-####-####', filter: {"#": RegExp(r'[0-9]')});
  final _formState = GlobalKey<FormBuilderState>();
  final SaleController saleController = SaleController();
  bool respuesta = false;
  double total = 0;
  late Medicine tempMedi;
  TextEditingController cantid = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Medicine? medicine =
        ModalRoute.of(context)?.settings.arguments as Medicine?;
    //print(medicine);
    tempMedi = medicine!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Zona de pago"),
      ),
      floatingActionButton: Visibility(
        visible: calculate,
        child: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            getInfoSale();
          },
        ),
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 20,
                    right: 40,
                    bottom: 20,
                  ),
                  //height: 500,
                  child: Column(children: <Widget>[
                    Row(
                      children: const [
                        Text(
                          "Nombre: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(medicine.name,
                            style: const TextStyle(
                              fontSize: 40,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text("Precio:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("  \$" + medicine.precio.toString()),
                      ],
                    ),
                  ]),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderDropdown(
                      name: "formaPago",
                      decoration: const InputDecoration(
                          labelText: "Pago",
                          prefixIcon: Icon(Icons.article_outlined),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      //hint: const Text("Seleccionar forma de pago"),
                      validator: FormBuilderValidators.required(context,
                          errorText: "Seleccione una forma de pago"),
                      items: [
                        {'value': 'Tarjeta', 'key': 'Tarjeta'},
                        {'value': 'Efectivo', 'key': 'Efectivo'}
                      ]
                          .map((formaPago) => DropdownMenuItem(
                              value: formaPago["value"],
                              child: Text("${formaPago["value"]}")))
                          .toList(),
                      onChanged: (value) {
                        if (value == "Tarjeta") {
                          setState(() {
                            card = true;
                          });
                        } else {
                          setState(() {
                            card = false;
                          });
                        }
                      },
                    )),
                Visibility(
                  visible: card,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderTextField(
                      name: "tarjeta",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Número de tarjeta",
                          hintText: "0000-0000-0000-0000",
                          prefixIcon: Icon(Icons.code),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.number,
                      inputFormatters: [cardFormatter],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido"),
                      ]),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      controller: cantid,
                      name: "cantidad",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Cantidad",
                          hintText: "Ingresa la cantidad",
                          prefixIcon: Icon(Icons.numbers),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido"),
                        FormBuilderValidators.min(context, 0,
                            errorText: "La cantidad debe ser mayor que 0")
                      ])),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 10,
                    right: 40,
                    bottom: 20,
                  ),
                  //height: 500,
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                            width: 160,
                            height: 40,
                            child: ElevatedButton(
                              child: const Text('Calcular costo'),
                              onPressed: () {
                                if (cantid.text.isNotEmpty) {
                                  total = double.parse(cantid.text);
                                  calculate = true;
                                  setState(() {
                                    total = total * medicine.precio;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Ingrese todos los campos"),
                                    backgroundColor:
                                        Color.fromARGB(255, 119, 4, 25),
                                  ));
                                }
                              },
                            )),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Total: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("  \$" + total.toString(),
                            style: const TextStyle(fontSize: 40)),
                      ],
                    )
                  ]),
                ),
              ],
            ),
          )),
    );
  }

  // Obtiene la información de la medicina que el usuario desea comprar
  void getInfoSale() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final formaPago = values["formaPago"];
      final cantidad = num.parse(values["cantidad"]);
      final precio = tempMedi.precio;
      final name = tempMedi.name;
      final total2 = total;
      //final code = tempMedi.code;

      late Sale sale = Sale("", "", name, formaPago, precio, cantidad, total2);
      addSaleMessage(sale);
    }
  }

  // Muestra un mensaje que le indica al usuario que está pansando con la compra que acabó
  // de realizar
  void addSaleMessage(Sale sale) async {
    respuesta = await saleController.addSale(sale);
    if (respuesta) {
      Navigator.pushNamed(context, '/home').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Compra exitosa..."),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error en la compra, Intente de nuevo..."),
        backgroundColor: Color.fromARGB(255, 119, 4, 25),
      ));
    }
  }
}
