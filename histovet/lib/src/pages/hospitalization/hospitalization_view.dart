import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:histovet/src/controller/hospitalization_controller.dart';
import 'package:histovet/src/models/hospitalization_model.dart';


// Clases encargadas de la vista donde se muestra la información de la historia clínica
class ViewHospitalization extends StatefulWidget {
  static String id = "view_hospitalization";

  final String idHospitalization;

  const ViewHospitalization(this.idHospitalization, {Key? key})
      : super(key: key);

  @override
  State<ViewHospitalization> createState() => _ViewHospitalizationState();
}

class _ViewHospitalizationState extends State<ViewHospitalization> {
  final _formState = GlobalKey<FormBuilderState>();

  HospitalizationController cont = HospitalizationController();

  TextEditingController apetiteController = TextEditingController();
  TextEditingController cardiacController = TextEditingController();
  TextEditingController clinicController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dehydrationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController fecalController = TextEditingController();
  TextEditingController mucousController = TextEditingController();
  TextEditingController pet_nameController = TextEditingController();
  TextEditingController owner_nameController = TextEditingController();
  TextEditingController prognosisController = TextEditingController();
  TextEditingController pulseController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController respiratoryController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController tllcController = TextEditingController();
  TextEditingController urineController = TextEditingController();

  TextEditingController medicineController = TextEditingController();
  TextEditingController medicine_quantityController = TextEditingController();
  TextEditingController medicine2Controller = TextEditingController();
  TextEditingController medicine_quantity2Controller = TextEditingController();
  TextEditingController medicine3Controller = TextEditingController();
  TextEditingController medicine_quantity3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Información Hospitalización"),
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(children: _inputs()),
          )),
    );
  }

  //Encargada de mostrar los cuadros de texto donde se mostrará a información
  // de la historia clínica
  List<Widget> _inputs() {
    return [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: owner_nameController,
          enabled: false,
          name: "owner_name",
          decoration: const InputDecoration(
              labelText: "Nombre del dueño de la mascota",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: pet_nameController,
          enabled: false,
          name: "pet_name",
          decoration: const InputDecoration(
              labelText: "Nombre de la mascota",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: dateController,
          enabled: false,
          name: ("date").toString(),
          decoration: const InputDecoration(
              labelText: "Fecha de realización",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: clinicController,
          enabled: false,
          name: "clinic",
          decoration: const InputDecoration(
              labelText: "Centro clinico veterinario",
              prefixIcon: Icon(Icons.document_scanner_outlined),
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
              labelText: "Diagnostico",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: prognosisController,
          enabled: false,
          name: "prognosis",
          decoration: const InputDecoration(
              labelText: "Pronostico",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: cardiacController,
          enabled: false,
          name: "cardiac",
          decoration: const InputDecoration(
              labelText: "Frecuencia cardiaca",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: respiratoryController,
          enabled: false,
          name: "respiratory",
          decoration: const InputDecoration(
              labelText: "Frecuencia respiratoria",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: pulseController,
          enabled: false,
          name: "pulse",
          decoration: const InputDecoration(
              labelText: "Pulso",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: temperatureController,
          enabled: false,
          name: "temperature",
          decoration: const InputDecoration(
              labelText: "Temperatura",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: mucousController,
          enabled: false,
          name: "mucous",
          decoration: const InputDecoration(
              labelText: "Mocusa",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: tllcController,
          enabled: false,
          name: "tllc",
          decoration: const InputDecoration(
              labelText: "TLLC",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: dehydrationController,
          enabled: false,
          name: "dehydration",
          decoration: const InputDecoration(
              labelText: "Deshidratación",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: apetiteController,
          enabled: false,
          name: "apetite",
          decoration: const InputDecoration(
              labelText: "Apetito",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: urineController,
          enabled: false,
          name: "urine",
          decoration: const InputDecoration(
              labelText: "Estado de orina",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: fecalController,
          enabled: false,
          name: "fecal",
          decoration: const InputDecoration(
              labelText: "Estado materia fecal",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: medicineController,
          enabled: false,
          name: "medicine",
          decoration: const InputDecoration(
              labelText: "1. Medicina aplicada",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: medicine_quantityController,
          enabled: false,
          name: "medicine_quantity",
          decoration: const InputDecoration(
              labelText: "Cantidad aplicada",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: medicine2Controller,
          enabled: false,
          name: "medicine2",
          decoration: const InputDecoration(
              labelText: "2. Medicina aplicada",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: medicine_quantity2Controller,
          enabled: false,
          name: "medicine_quantity2",
          decoration: const InputDecoration(
              labelText: "Cantidad aplicada",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: medicine3Controller,
          enabled: false,
          name: "medicine3",
          decoration: const InputDecoration(
              labelText: "3. Medicina aplicada",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: medicine_quantity3Controller,
          enabled: false,
          name: "medicine_quantity3",
          decoration: const InputDecoration(
              labelText: "Cantidad aplicada",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: remarkController,
          enabled: false,
          name: "remark",
          decoration: const InputDecoration(
              labelText: "Observaciones generales",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
    ];
  }

  @override
  void initState() {
    getInfoHospitalization();
    super.initState();
  }

  // Obtiene la información de la historia clínica y la asigna a los campos de textos
  void getInfoHospitalization() async {
    Hospitalization hospitalization =
        await cont.getHospitalization(widget.idHospitalization);

    setState(() {
      apetiteController.text = hospitalization.apetite;
      clinicController.text = hospitalization.clinic;
      pet_nameController.text = hospitalization.pet_name;
      dateController.text = hospitalization.date.toString();
      owner_nameController.text = hospitalization.owner_name;
      cardiacController.text = hospitalization.cardiac;
      dehydrationController.text = hospitalization.dehydration;
      descriptionController.text = hospitalization.description;
      fecalController.text = hospitalization.fecal;
      mucousController.text = hospitalization.mucous;
      prognosisController.text = hospitalization.prognosis;
      pulseController.text = hospitalization.pulse;
      remarkController.text = hospitalization.remark;
      respiratoryController.text = hospitalization.respiratory;
      temperatureController.text = hospitalization.temperature;
      tllcController.text = hospitalization.tllc;
      urineController.text = hospitalization.urine;
      medicineController.text = hospitalization.medicine;
      medicine_quantityController.text = hospitalization.medicine_quantity;
      medicine2Controller.text = hospitalization.medicine2;
      medicine_quantity2Controller.text = hospitalization.medicine_quantity2;
      medicine3Controller.text = hospitalization.medicine3;
      medicine_quantity3Controller.text = hospitalization.medicine_quantity3;
    });
  }
}
