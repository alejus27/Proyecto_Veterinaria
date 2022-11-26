import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../models/medicine_model.dart';
import '../../services/medicine_service.dart';
import 'package:intl/intl.dart';

// Clases encargadas de la vista que le permite al usuario
// ingresar datos para agregar una medicina
class AddMedicine extends StatefulWidget {
  static String id = "form_medicine";
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicine();
}

class _AddMedicine extends State<AddMedicine> {
  final MedicineService _service = MedicineService();
  final _formState = GlobalKey<FormBuilderState>();
  bool respuesta = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registrar medicamento"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoMedicine();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                    name: "code",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Código",
                        hintText: "Ingrese el código del medicamento",
                        prefixIcon: Icon(Icons.code),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.integer(context,
                          errorText: "No puede tener decimales"),
                      FormBuilderValidators.min(context, 1,
                          errorText: "Debe ser un número mayor que 0"),
                      FormBuilderValidators.minLength(context, 4,
                          errorText: "La longitud del documento es de 4")
                    ]),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      name: "name",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Nombre",
                          hintText: "Ingrese el nombre del medicamento",
                          prefixIcon: Icon(Icons.people),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 20,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ])),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      name: "description",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Descripción",
                          hintText: "Ingrese la descripción del medicamento",
                          prefixIcon: Icon(Icons.description),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 300,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ])),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      name: "group",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Grupo",
                          hintText: "Ingrese el grupo del medicamento",
                          prefixIcon: Icon(Icons.group),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 30,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ])),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                    name: "precio",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Precio",
                        hintText: "Ingrese el precio del medicamento",
                        prefixIcon: Icon(Icons.price_change),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.numeric(context,
                          errorText: "Debe ser un numero"),
                      FormBuilderValidators.min(context, 1,
                          errorText: "Debe ser un número mayor que 0"),
                    ]),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderDateRangePicker(
                      keyboardType: TextInputType.datetime,
                      name: "fechaVen",
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2026),
                      format: DateFormat('dd/MM/yyyy'),
                      initialEntryMode: DatePickerEntryMode.input,
                      enabled: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          labelText: 'Seleccione rango de fechas',
                          helperText:
                              'Rango de fecha en la que se puede usar la medicine',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)))),
                )
              ],
            ),
          )),
    );
  }

  // Valida que todos los campos cumplan los formatos y obtiene la
  //información que ingresó el usuario
  getInfoMedicine() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final code = values['code'];
      final name = values['name'];
      final description = values['description'];
      final group = values['group'];
      final precio = double.parse(values['precio']);
      var fechaAux = values['fechaVen'].toString();
      List<String> fechas = fechaAux.split("00:00:00.000");
      //print("fecha " + fechas[0]);
      final fechaVen = fechas[0] + fechas[1];
      late Medicine medicine = Medicine("", code, name, description, group, fechaAux);
      addMedicine(medicine);
    }
  }

  //Muestra un mensaje que le indica al usuario si se pudo crear la medicina
  void addMedicine(Medicine medicine) async {
    respuesta = await _service.addMedicine(medicine);
    if (respuesta) {
      Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se guardó la información de la medicina"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se guardó la información de la medicina"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
