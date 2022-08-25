import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/controller/clinicalhistory_controller.dart';

import '../../controller/pet_controller.dart';
import '../../controller/auth_controller.dart';
import '../../models/clinicalhistory_model.dart';
import '../../models/pet_model.dart';

// Clases encargadas de la vista que le permite al usuario agregar información
// a la historia clínica de la mascota que se seleccionó
class HistoryPetSelectPage extends StatefulWidget {
  static String id = "add_historypet";
  final String idPet;
  const HistoryPetSelectPage(this.idPet, {Key? key}) : super(key: key);

  @override
  State<HistoryPetSelectPage> createState() => _HistoryPetSelectPageState();
}

class _HistoryPetSelectPageState extends State<HistoryPetSelectPage> {
  final _formState = GlobalKey<FormBuilderState>();
  PetController petIn = PetController();
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
  AuthController auth = AuthController();
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Agregar Historia Clínica"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoHistory();
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
                  controller: numberCHController,
                  name: "numberCH",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Número de historia clinica",
                      prefixIcon: Icon(Icons.numbers),
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
                        errorText:
                            "La longitud del número de historia cinica es de 4")
                  ]),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      enabled: false,
                      controller: dateController,
                      name: "date",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Fecha",
                          prefixIcon: Icon(Icons.date_range),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.datetime,
                      maxLength: 10,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ]))),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      enabled: false,
                      controller: timeCHController,
                      name: "time",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Hora",
                          hintText: "Ingrese la hora actual",
                          prefixIcon: Icon(Icons.timer),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 10,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ]))),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    enabled: false,
                    controller: docOwnerCHController,
                    name: "docOwner",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Documento Dueño",
                        hintText: "Ingrese el documento del dueño",
                        prefixIcon: Icon(Icons.badge_outlined),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.minLength(context, 10,
                          errorText: "La longitud del documento es de 10"),
                      FormBuilderValidators.integer(context,
                          errorText: "No puede tener decimales"),
                      FormBuilderValidators.min(context, 1,
                          errorText: "Debe ser un número mayor que 0"),
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  enabled: false,
                  controller: nameOwnerController,
                  name: "nameOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Nombre Dueño",
                      hintText: "Ingrese el nombre del dueño",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
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
                  controller: contactOwnerController,
                  name: "contactOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      enabled: false,
                      labelText: "contacto Dueño",
                      hintText: "Ingrese el contacto del dueño",
                      prefixIcon: Icon(Icons.contact_phone_outlined),
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
                    FormBuilderValidators.minLength(context, 10,
                        errorText: "La longitud del número es de 10")
                  ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: addressOwnerController,
                  name: "addressOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Dirección",
                      hintText: "Ingrese la dirección de residencia",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
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
                  enabled: false,
                  controller: nameController,
                  name: "name",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Nombre de la mascota",
                      hintText: "Ingrese el nombre del dueño",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
                  maxLength: 12,
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
                  controller: emailAddressOwnerController,
                  enabled: false,
                  name: "emailAddressOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      hintText: "Ingrese el nombre del dueño",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.email(context,
                        errorText: "Debe tener formato de correo")
                  ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  enabled: false,
                  controller: specieController,
                  name: "specie",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Subespecie",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    enabled: false,
                    controller: breedController,
                    name: "breed",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Raza",
                        hintText: "Ingrese la raza de la mascotas",
                        prefixIcon: Icon(Icons.pets),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
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
                  enabled: false,
                  controller: sexController,
                  name: "sex",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Sexo",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  enabled: false,
                  controller: colorController,
                  name: "color",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Color",
                      hintText: "Ingrese el color de la mascotas",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 20,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: weightController,
                  name: "weight",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Peso(Kg)",
                      hintText: "Ingrese el peso de la mascota",
                      prefixIcon: Icon(Icons.monitor_weight_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.min(context, 1,
                        errorText: "Debe ser un número mayor que 0"),
                    FormBuilderValidators.minLength(context, 3,
                        errorText: "La longitud del número es de 5")
                  ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: originController,
                  name: "origin",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Origen",
                      hintText: "Origen mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 20,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: dietCHController,
                  name: "diet",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Dieta",
                      hintText: "Dieta de la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 40,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: previousIllnessesController,
                  name: "previousIllnesses",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Enfermedades previas",
                      hintText: "Enfermedades previas",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: previousSurgeriesController,
                  name: "previousSurgeries",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "cirugías previas",
                      hintText: "Escriba enfermedades previas",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: sterilizedController,
                  name: "sterilized",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Esterilizado",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 2,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: nAnimalBirthsController,
                    name: "nAnimalBirths",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Número de partos",
                        hintText: "Cuantos partos ha tenido la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: vaccinationScheduleController,
                  name: "vaccinationSchedule",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Vacunas",
                      hintText: "Escriba las vacunas que tiene la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: lastDewormingController,
                  name: "lastDeworming",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Última desparasitación",
                      hintText: "Fecha última desparasitación",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.datetime,
                  maxLength: 20,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: recentTreatmentsController,
                  name: "recentTreatments",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Tratamientos recientes",
                      hintText: "Escriba los tratamientos más recientes",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: animalBehaviorController,
                  name: "animalBehavior",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Comportamiento de la mascota",
                      hintText: "Escriba el comportamiento",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: reasonForConsultationController,
                  name: "reasonForConsultation",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Razón de la consulta",
                      hintText: "",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: physicalConditionController,
                  name: "physicalCondition",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Condición física",
                      hintText: "Condición física de la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: temperatureController,
                    name: "temperature",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Temperatura",
                        hintText: "Ingresa temperatura de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.min(context, 0,
                          errorText: "La temperatura ser mayor o igual que 0")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: heartFrequencyController,
                    name: "heartFrequency",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Frecuencia cardíaca",
                        hintText: "Ingresa frecuencia cardíaca de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: respiratoryFrequencyController,
                    name: "respiratoryFrequency",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Frecuencia respiratoria",
                        hintText:
                            "Ingresa frecuencia respiratoria de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: tllcController,
                    name: "tllc",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Tiempo de llenado capilar(Seg)",
                        hintText: "Ingresa el tiempo de llenado capilar",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: pulseController,
                    name: "pulse",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Pulso",
                        hintText: "Ingresa el pulso de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: trcpController,
                    name: "trcp",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Tiempo de recuperación del pliegue cutáneo",
                        hintText: "Ingresa el tiempo en segundos",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: percentageDehydrationController,
                    name: "percentageDehydration",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Porcentaje deshidratación",
                        hintText: "Ingresa el porcentaje",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: mucousController,
                  name: "mucous",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Estado de la mucosa",
                      hintText: "Mucosa de la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 50,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              )
            ],
          )),
    );
  }

  @override
  void initState() {
    getInfoPet();
    getUsername();
    super.initState();
  }

  // Permite obtener la información que el usuario ingresó en el formulario
  getInfoHistory() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;

      //Identificación historia clinica
      //print("act " + weightController.text);
      final numberClinicalHistory = int.parse(values['numberCH']);
      final date = values['date'];
      final time = values['time'];

      //Datos del propietario
      final docOwner = values['docOwner'];
      final nameOwner = values['nameOwner'];
      final contactOwner = values['contactOwner'];
      final addressOwner = values['addressOwner'];
      final emailAddressOwner = values['emailAddressOwner'];

      //Reseña
      final name = values['name'];
      final specie = values['specie'];
      final breed = values['breed'];
      final sex = values['sex'];
      final color = values['color'];
      final weight = double.parse(weightController.text);
      final origin = values['origin'];

      //Anamnesis
      final diet = values['diet'];
      final previousIllnesses = values['previousIllnesses'];
      final previousSurgeries = values['previousSurgeries'];
      final sterilized = values['sterilized'];
      final nAnimalBirths = values['nAnimalBirths'];
      final vaccinationSchedule = values['vaccinationSchedule'];
      final lastDeworming = values['lastDeworming'];
      final recentTreatments = values['recentTreatments'];
      final animalBehavior = values['animalBehavior'];
      final reasonForConsultation = values['reasonForConsultation'];

      //Examen fisico generaliz
      final physicalCondition = values['physicalCondition'];
      final temperature = double.parse(temperatureController.text);
      final heartFrequency = double.parse(heartFrequencyController.text);
      final respiratoryFrequency =
          double.parse(respiratoryFrequencyController.text);
      //tiempo de llena capilar: TLLC
      final tllc = double.parse(tllcController.text);
      final pulse = double.parse(pulseController.text);
      //tiempo de recuperación del pliegue cutáneo TRPC
      final trcp = double.parse(trcpController.text);
      final percentageDehydration =
          double.parse(percentageDehydrationController.text);
      final mucous = values['mucous'];
      late ClinicalHistory clinicalHistory = ClinicalHistory(
          "",
          numberClinicalHistory,
          date,
          time,
          docOwner,
          nameOwner,
          contactOwner,
          addressOwner,
          emailAddressOwner,
          name,
          specie,
          breed,
          sex,
          color,
          weight,
          origin,
          diet,
          previousIllnesses,
          previousSurgeries,
          sterilized,
          nAnimalBirths,
          vaccinationSchedule,
          lastDeworming,
          recentTreatments,
          animalBehavior,
          reasonForConsultation,
          physicalCondition,
          temperature,
          heartFrequency,
          respiratoryFrequency,
          tllc,
          pulse,
          trcp,
          percentageDehydration,
          mucous);

      messageAdd(clinicalHistory);
    }
  }

  // Permite agregar una historia clínica e indicar al usuario
  // si fue satisfactorio el proceso
  void messageAdd(ClinicalHistory clinicalHistory) async {
    respuesta = await histCont.addClinicalHistory(clinicalHistory);
    if (respuesta) {
      Navigator.pushNamed(context, '/clinicalHistories')
          .then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se guardó la historia clinica"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se actualizó la información"),
        backgroundColor: Colors.green,
      ));
    }
  }

  // Permite la información de la mascota a la cuál se le
  // desea agregar una historia clínica
  void getInfoPet() async {
    Pet pet = await petIn.getPet(widget.idPet);
    setState(() {
      DateTime today = DateTime.now();
      timeCHController.text = "${today.hour}:${today.minute}";
      emailAddressOwnerController.text = username;
      dateController.text = today.toIso8601String().split('T').first;
      docOwnerCHController.text = pet.documentOwner;
      nameOwnerController.text = pet.nameOwner;
      contactOwnerController.text = pet.contactOwner;
      nameController.text = pet.name;
      specieController.text = pet.specie;
      breedController.text = pet.breed;
      sexController.text = pet.sex;
      colorController.text = pet.color;
    });
  }

  // obtiene el correo dek usuario que se encuentra en sesión
  void getUsername() async {
    username = await auth.username();
    setState(() {});
  }
}
