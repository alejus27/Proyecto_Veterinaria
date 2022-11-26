import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../controller/medicine_controller.dart';
import '../../models/medicine_model.dart';

// Clases encargadas de la vista que le permite al usuario
// actualizar los datos de la medicina
class UpdateMedicine extends StatefulWidget {
  static String id = "edit_medicine";
  final String idMedicine;
  const UpdateMedicine(this.idMedicine, {Key? key}) : super(key: key);

  @override
  State<UpdateMedicine> createState() => _Updatemedicationtate();
}

class _Updatemedicationtate extends State<UpdateMedicine> {
  final _formState = GlobalKey<FormBuilderState>();
  MedicineController medicineCont = MedicineController();

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController grupoController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController fechaVenController = TextEditingController();

  bool respuesta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Editar Información Medicina"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoMedicine();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: codeController,
                  name: "code",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Código",
                      prefixIcon: Icon(Icons.medication),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
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
                  controller: nameController,
                  name: "name",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Nombre",
                      prefixIcon: Icon(Icons.medication),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 20,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido")
                  ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: descriptionController,
                  name: "description",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Descripción",
                      prefixIcon: Icon(Icons.medication),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 300,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido")
                  ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: grupoController,
                  name: "group",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Grupo",
                      prefixIcon: Icon(Icons.medication),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 30,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido")
                  ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: precioController,
                  name: "precio",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Precio",
                      prefixIcon: Icon(Icons.medication),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
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
                child: FormBuilderTextField(
                  controller: fechaVenController,
                  name: "fechaVen",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Fecha vencimiento",
                      prefixIcon: Icon(Icons.medication),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.datetime,
                  maxLength: 25,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido")
                  ]),
                ),
              )
            ],
          )),
    );
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  //valida que la información que entró el usuario cumpla los formatos que se le definió
  // a cada campo de texto y obtiene está información
  getInfoMedicine() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final code = values['code'];
      final name = values['name'];
      final description = values['description'];
      final group = values['group'];
      final precio = double.parse(values['precio']);
      final fechaVen = values['fechaVen'];

      late Medicine medicine = Medicine(
          widget.idMedicine, name, description, group, precio, fechaVen);
      _messageUpdate(medicine);
    }
  }

  // Le indica al usuario si se pudo o no actualizar la información de la medicina
  void _messageUpdate(Medicine medicine) async {
    respuesta = await medicineCont.updateMedicine(medicine);
    if (respuesta) {
      Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se actualizó la información de la medicina"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se actualizó la información de la medicina"),
        backgroundColor: Colors.green,
      ));
    }
  }

  /// Obtiene la información de la medicina a la cual se quiere
  /// cambiar su información
  void getInfo() async {
    // await _service.getMedicine(widget.idMedicine);
    Medicine medicine = await medicineCont.getMedicine(widget.idMedicine);
    setState(() {
      //codeController.text = medicine.code.toString();
      nameController.text = medicine.name;
      descriptionController.text = medicine.descripcion;
      grupoController.text = medicine.group;
      precioController.text = medicine.precio.toString();
      fechaVenController.text = medicine.fechaVen;
    });
  }
}
