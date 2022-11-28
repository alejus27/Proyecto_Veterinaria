import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../controller/medicine_controller.dart';
import '../../models/medicine_model.dart';

// Clases encargadas de la vista donde se muestra la información de la medicina
class ViewMedicine extends StatefulWidget {
  static String id = "edit_medicine";
  final String idMedicine;
  const ViewMedicine(this.idMedicine, {Key? key}) : super(key: key);

  @override
  State<ViewMedicine> createState() => _Updatemedicationtate();
}

class _Updatemedicationtate extends State<ViewMedicine> {
  final _formState = GlobalKey<FormBuilderState>();
  MedicineController medicineCont = MedicineController();

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
        title: const Text("Información Medicina"),
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: _inputs()),
          )),
    );
  }

  // Campos de textos donde se muestra la información de la medicina
  List<Widget> _inputs() {
    return [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: nameController,
          enabled: false,
          name: "name",
          decoration: const InputDecoration(
              labelText: "Nombre",
              prefixIcon: Icon(Icons.medication),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: descriptionController,
          enabled: false,
          name: "description",
          decoration: const InputDecoration(
              labelText: "Descripción",
              prefixIcon: Icon(Icons.medication),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: grupoController,
          enabled: false,
          name: "group",
          decoration: const InputDecoration(
              labelText: "Grupo",
              prefixIcon: Icon(Icons.medication),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: precioController,
          enabled: false,
          name: "precio",
          decoration: const InputDecoration(
              labelText: "Precio",
              prefixIcon: Icon(Icons.medication),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: fechaVenController,
          enabled: false,
          name: "fechaVen",
          decoration: const InputDecoration(
              labelText: "Fecha vencimiento",
              prefixIcon: Icon(Icons.medication),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      )
    ];
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  // Obtiene la información de la medicina y la asigna a los campos de textos
  void getInfo() async {
    Medicine medicine = await medicineCont.getMedicine(widget.idMedicine);
    setState(() {
      //codeController.text = medicine.code.toString();
      nameController.text = medicine.name;
      descriptionController.text = medicine.description;
      grupoController.text = medicine.group;
      precioController.text = medicine.precio.toString();
      fechaVenController.text = medicine.fechaVen;
    });
  }

  
}
