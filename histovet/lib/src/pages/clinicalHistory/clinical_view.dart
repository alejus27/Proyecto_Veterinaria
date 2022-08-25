import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../controller/clinicalhistory_controller.dart';
import '../../models/clinicalhistory_model.dart';

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

  TextEditingController numberCHController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeCHController = TextEditingController();
  TextEditingController docOwnerCHController = TextEditingController();
  TextEditingController nameOwnerController = TextEditingController();
  TextEditingController contactOwnerController = TextEditingController();
  TextEditingController addressOwnerController = TextEditingController();
  TextEditingController emailAddressOwnerController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController specieController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController dietCHController = TextEditingController();
  TextEditingController previousIllnessesController = TextEditingController();
  TextEditingController previousSurgeriesController = TextEditingController();
  TextEditingController sterilizedController = TextEditingController();
  TextEditingController nAnimalBirthsController = TextEditingController();
  TextEditingController vaccinationScheduleController = TextEditingController();
  TextEditingController lastDewormingController = TextEditingController();
  TextEditingController recentTreatmentsController = TextEditingController();
  TextEditingController animalBehaviorController = TextEditingController();
  TextEditingController reasonForConsultationController =
      TextEditingController();
  TextEditingController physicalConditionController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController heartFrequencyController = TextEditingController();
  TextEditingController respiratoryFrequencyController =
      TextEditingController();
  TextEditingController tllcController = TextEditingController();
  TextEditingController pulseController = TextEditingController();
  TextEditingController trcpController = TextEditingController();
  TextEditingController percentageDehydrationController =
      TextEditingController();
  TextEditingController mucousController = TextEditingController();

  bool respuesta = false;

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
          controller: numberCHController,
          enabled: false,
          name: "numberCH",
          decoration: const InputDecoration(
              labelText: "Número de historia clinica",
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: FormBuilderTextField(
            controller: dateController,
            name: "date",
            enabled: false,
            decoration: const InputDecoration(
                labelText: "Fecha",
                prefixIcon: Icon(Icons.date_range),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal))),
          )),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: FormBuilderTextField(
            controller: timeCHController,
            enabled: false,
            name: "time",
            decoration: const InputDecoration(
                labelText: "Hora",
                prefixIcon: Icon(Icons.timer),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal))),
          )),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: docOwnerCHController,
          enabled: false,
          name: "docOwner",
          decoration: const InputDecoration(
              labelText: "Documento Dueño",
              prefixIcon: Icon(Icons.badge_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: nameOwnerController,
          enabled: false,
          name: "nameOwner",
          decoration: const InputDecoration(
              labelText: "Nombre Dueño",
              prefixIcon: Icon(Icons.person_outline_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: contactOwnerController,
          enabled: false,
          name: "contactOwner",
          decoration: const InputDecoration(
              labelText: "contacto Dueño",
              prefixIcon: Icon(Icons.contact_phone_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: addressOwnerController,
          enabled: false,
          name: "addressOwner",
          decoration: const InputDecoration(
              labelText: "Dirección",
              prefixIcon: Icon(Icons.person_outline_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: nameController,
          enabled: false,
          name: "name",
          decoration: const InputDecoration(
              labelText: "Nombre de la mascota",
              prefixIcon: Icon(Icons.person_outline_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: emailAddressOwnerController,
          enabled: false,
          name: "emailAddressOwner",
          decoration: const InputDecoration(
              labelText: "Correo electrónico",
              prefixIcon: Icon(Icons.person_outline_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: specieController,
          enabled: false,
          name: "specie",
          decoration: const InputDecoration(
              labelText: "Subespecie",
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: breedController,
          enabled: false,
          name: "breed",
          decoration: const InputDecoration(
              labelText: "Raza",
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: sexController,
          enabled: false,
          name: "sex",
          decoration: const InputDecoration(
              labelText: "Sexo",
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: colorController,
          enabled: false,
          name: "color",
          decoration: const InputDecoration(
              labelText: "Color",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: weightController,
          name: "weight",
          enabled: false,
          decoration: const InputDecoration(
              labelText: "Peso(Kg)",
              prefixIcon: Icon(Icons.monitor_weight_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: originController,
          enabled: false,
          name: "origin",
          decoration: const InputDecoration(
              labelText: "Origen",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: dietCHController,
          enabled: false,
          name: "diet",
          decoration: const InputDecoration(
              labelText: "Dieta",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: previousIllnessesController,
          name: "previousIllnesses",
          enabled: false,
          decoration: const InputDecoration(
              labelText: "Enfermedades previas",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: previousSurgeriesController,
          enabled: false,
          name: "previousSurgeries",
          decoration: const InputDecoration(
              labelText: "cirugías previas",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: sterilizedController,
          enabled: false,
          name: "sterilized",
          decoration: const InputDecoration(
              labelText: "Esterilizado",
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: nAnimalBirthsController,
          enabled: false,
          name: "nAnimalBirths",
          decoration: const InputDecoration(
              labelText: "Número de partos",
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: vaccinationScheduleController,
          enabled: false,
          name: "vaccinationSchedule",
          decoration: const InputDecoration(
              labelText: "Vacunas",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: lastDewormingController,
          enabled: false,
          name: "lastDeworming",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
              labelText: "Última desparasitación",
              hintText: "Fecha última desparasitación",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: recentTreatmentsController,
          enabled: false,
          name: "recentTreatments",
          decoration: const InputDecoration(
              labelText: "Tratamientos recientes",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: animalBehaviorController,
          enabled: false,
          name: "animalBehavior",
          decoration: const InputDecoration(
              labelText: "Comportamiento de la mascota",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: reasonForConsultationController,
          enabled: false,
          name: "reasonForConsultation",
          decoration: const InputDecoration(
              labelText: "Razón de la consulta",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: physicalConditionController,
          enabled: false,
          name: "physicalCondition",
          decoration: const InputDecoration(
              labelText: "Condición física",
              prefixIcon: Icon(Icons.color_lens_outlined),
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
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: heartFrequencyController,
          enabled: false,
          name: "heartFrequency",
          decoration: const InputDecoration(
              labelText: "Frecuencia cardíaca",
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: respiratoryFrequencyController,
          enabled: false,
          name: "respiratoryFrequency",
          decoration: const InputDecoration(
              labelText: "Frecuencia respiratoria",
              prefixIcon: Icon(Icons.numbers),
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
              labelText: "Tiempo de llenado capilar(Seg)",
              prefixIcon: Icon(Icons.numbers),
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
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: trcpController,
          enabled: false,
          name: "trcp",
          decoration: const InputDecoration(
              labelText: "Tiempo de recuperación del pliegue cutáneo",
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: percentageDehydrationController,
          enabled: false,
          name: "percentageDehydration",
          decoration: const InputDecoration(
              labelText: "Porcentaje deshidratación",
              prefixIcon: Icon(Icons.numbers),
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
              labelText: "Estado de la mucosa",
              prefixIcon: Icon(Icons.color_lens_outlined),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      )
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
      numberCHController.text = clinicalHistory.numberCH.toString();
      dateController.text = clinicalHistory.date;
      timeCHController.text = clinicalHistory.time.toString();
      docOwnerCHController.text = clinicalHistory.docOwner;
      nameOwnerController.text = clinicalHistory.nameOwner;
      contactOwnerController.text = clinicalHistory.contactOwner;
      addressOwnerController.text = clinicalHistory.addressOwner;
      emailAddressOwnerController.text = clinicalHistory.emailAddressOwner;
      nameController.text = clinicalHistory.name;
      specieController.text = clinicalHistory.specie;
      breedController.text = clinicalHistory.breed;
      sexController.text = clinicalHistory.sex;
      colorController.text = clinicalHistory.color;
      weightController.text = clinicalHistory.weight.toString();
      originController.text = clinicalHistory.origin;
      dietCHController.text = clinicalHistory.diet;
      previousIllnessesController.text = clinicalHistory.previousIllnesses;
      previousSurgeriesController.text = clinicalHistory.previousSurgeries;
      sterilizedController.text = clinicalHistory.sterilized;
      nAnimalBirthsController.text = clinicalHistory.nAnimalBirths;
      vaccinationScheduleController.text = clinicalHistory.vaccinationSchedule;
      lastDewormingController.text = clinicalHistory.lastDeworming;
      recentTreatmentsController.text = clinicalHistory.recentTreatments;
      animalBehaviorController.text = clinicalHistory.animalBehavior;
      reasonForConsultationController.text =
          clinicalHistory.reasonForConsultation;
      physicalConditionController.text = clinicalHistory.physicalCondition;
      temperatureController.text = clinicalHistory.temperature.toString();
      heartFrequencyController.text = clinicalHistory.heartFrequency.toString();
      respiratoryFrequencyController.text =
          clinicalHistory.respiratoryFrequency.toString();
      tllcController.text = clinicalHistory.tllc.toString();
      pulseController.text = clinicalHistory.pulse.toString();
      trcpController.text = clinicalHistory.trcp.toString();
      percentageDehydrationController.text =
          clinicalHistory.percentageDehydration.toString();
      mucousController.text = clinicalHistory.mucous;
    });
  }
}
