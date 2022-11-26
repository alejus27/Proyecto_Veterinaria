import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:histovet/src/controller/clinicalHistory_controller.dart';
import 'package:histovet/src/models/clinicalHistory_model.dart';

// Clases encargadas de la vista donde se muestra la información de la historia clínica
class ViewHistory extends StatefulWidget {
  static String id = "view_history";

  final String idHistory;

  const ViewHistory(this.idHistory, {Key? key}) : super(key: key);

  @override
  State<ViewHistory> createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  final _formState = GlobalKey<FormBuilderState>();
  ClinicalHistoryController histCont = ClinicalHistoryController();

  TextEditingController birth_numberController = TextEditingController();
  TextEditingController clinicController = TextEditingController();
  TextEditingController consultation_reasonController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dewormingController = TextEditingController();
  TextEditingController diet_typeController = TextEditingController();
  TextEditingController digestive_systemController = TextEditingController();
  TextEditingController nervous_systemController = TextEditingController();
  TextEditingController observationsController = TextEditingController();
  TextEditingController owner_nameController = TextEditingController();
  TextEditingController paraclinical_testsController = TextEditingController();
  TextEditingController parasites_controlController = TextEditingController();
  TextEditingController pet_nameController = TextEditingController();
  TextEditingController presumptive_diagnosisController =
      TextEditingController();
  TextEditingController previous_illnessesController = TextEditingController();
  TextEditingController previous_surgeriesController = TextEditingController();
  TextEditingController previousIllnessesController = TextEditingController();
  TextEditingController previousSurgeriesController = TextEditingController();
  TextEditingController previous_treatmentsController = TextEditingController();
  TextEditingController reproductive_statusController = TextEditingController();
  TextEditingController respiratory_systemController = TextEditingController();
  TextEditingController therapeutic_planController = TextEditingController();
  TextEditingController vaccinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Información Historia Clínica"),
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
          name: "ownerName",
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
          name: "date",
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
          controller: reproductive_statusController,
          enabled: false,
          name: "reproductive_status",
          decoration: const InputDecoration(
              labelText: "Estado reproductivo",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: consultation_reasonController,
          enabled: false,
          name: "consultation_reason",
          decoration: const InputDecoration(
              labelText: "Motivo de consulta",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: dewormingController,
          enabled: false,
          name: "deworming",
          decoration: const InputDecoration(
              labelText: "Estado reproductivo",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: birth_numberController,
          enabled: false,
          name: "birth_number",
          decoration: const InputDecoration(
              labelText: "Número de partos",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: vaccinationController,
          enabled: false,
          name: "vaccination",
          decoration: const InputDecoration(
              labelText: "Vacunación vigente",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: parasites_controlController,
          enabled: false,
          name: "parasites_control",
          decoration: const InputDecoration(
              labelText: "Desparacitación vigente",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: diet_typeController,
          enabled: false,
          name: "diet_type",
          decoration: const InputDecoration(
              labelText: "Tipo de dieta",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: previous_illnessesController,
          enabled: false,
          name: "previous_illnesses",
          decoration: const InputDecoration(
              labelText: "Enfermedades anteriores",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: previous_surgeriesController,
          enabled: false,
          name: "previous_surgeries",
          decoration: const InputDecoration(
              labelText: "Cirugias anteriores",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: previous_treatmentsController,
          enabled: false,
          name: "previous_treatments",
          decoration: const InputDecoration(
              labelText: "Tratamientos previos y evolución",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: respiratory_systemController,
          enabled: false,
          name: "respiratory_system",
          decoration: const InputDecoration(
              labelText: "Estado sistema respiratorio",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: digestive_systemController,
          enabled: false,
          name: "digestive_system",
          decoration: const InputDecoration(
              labelText: "Estado sistema digestivo",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: nervous_systemController,
          enabled: false,
          name: "nervous_system",
          decoration: const InputDecoration(
              labelText: "Estado sistema nervioso",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: presumptive_diagnosisController,
          enabled: false,
          name: "presumptive_diagnosis",
          decoration: const InputDecoration(
              labelText: "Diagnóstico presuntivo",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: paraclinical_testsController,
          enabled: false,
          name: "paraclinical_tests",
          decoration: const InputDecoration(
              labelText: "Pruebas paraclínicas",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: therapeutic_planController,
          enabled: false,
          name: "therapeutic_plan",
          decoration: const InputDecoration(
              labelText: "Plan terapeutico",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: observationsController,
          enabled: false,
          name: "observations",
          decoration: const InputDecoration(
              labelText: "Observaciones",
              prefixIcon: Icon(Icons.document_scanner_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
    ];
  }

  @override
  void initState() {
    getInfoClinicalHistory();
    super.initState();
  }

  // Obtiene la información de la historia clínica y la asigna a los campos de textos
  void getInfoClinicalHistory() async {
    ClinicalHistory clinicalHistory =
        await histCont.getClinicalHistory(widget.idHistory);
    setState(() {
      birth_numberController.text = clinicalHistory.birth_number;
      clinicController.text = clinicalHistory.clinic;
      consultation_reasonController.text = clinicalHistory.consultation_reason;
      dateController.text = clinicalHistory.date.toString();
      dewormingController.text = clinicalHistory.deworming;
      diet_typeController.text = clinicalHistory.diet_type;
      digestive_systemController.text = clinicalHistory.digestive_system;
      nervous_systemController.text = clinicalHistory.nervous_system;
      observationsController.text = clinicalHistory.observations;
      owner_nameController.text = clinicalHistory.owner_name;
      paraclinical_testsController.text = clinicalHistory.paraclinical_tests;
      parasites_controlController.text = clinicalHistory.parasites_control;
      pet_nameController.text = clinicalHistory.pet_name;
      presumptive_diagnosisController.text =
          clinicalHistory.presumptive_diagnosis;
      previous_illnessesController.text = clinicalHistory.previous_illnesses;
      previous_surgeriesController.text = clinicalHistory.previous_surgeries;
      previous_treatmentsController.text = clinicalHistory.previous_treatments;
      reproductive_statusController.text = clinicalHistory.reproductive_status;
      respiratory_systemController.text = clinicalHistory.respiratory_system;
      therapeutic_planController.text = clinicalHistory.therapeutic_plan;
      vaccinationController.text = clinicalHistory.vaccination;
    });
  }
}
