import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/clinicalhistory_controller.dart';
import '../../models/clinicalhistory_model.dart';

// Clases encargadas de la vista que le permite al usuario
// actualizar los datos de la historia clínica
class UpdateHistory extends StatefulWidget {
  static String id = "edit_history";
  final String idHistory;

  const UpdateHistory(this.idHistory, {Key? key}) : super(key: key);

  @override
  State<UpdateHistory> createState() => _UpdateHistoryState();
}

class _UpdateHistoryState extends State<UpdateHistory> {
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
        title: const Text("Editar Información Mascota"),
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
    getInfoClinicalHistory();
    super.initState();
  }

  //valida que la información que entró el usuario cumpla los formatos que se le definió
  // a cada campo de texto y obtiene está información
  getInfoHistory() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      //Identificación historia clinica
      //print("act " + weightController.text);
      final numberClinicalHistory = int.parse(numberCHController.text);
      final date = dateController.text;
      final time = timeCHController.text;

      //Datos del propietario
      final docOwner = docOwnerCHController.text;
      final nameOwner = nameOwnerController.text;
      final contactOwner = contactOwnerController.text;
      final addressOwner = addressOwnerController.text;
      final emailAddressOwner = emailAddressOwnerController.text;

      //Reseña
      final name = nameController.text;
      final specie = specieController.text;
      final breed = breedController.text;
      final sex = sexController.text;
      final color = colorController.text;
      final weight = double.parse(weightController.text);
      final origin = originController.text;

      //Anamnesis
      final diet = dietCHController.text;
      final previousIllnesses = previousIllnessesController.text;
      final previousSurgeries = previousSurgeriesController.text;
      final sterilized = sterilizedController.text;
      final nAnimalBirths = nAnimalBirthsController.text;
      final vaccinationSchedule = vaccinationScheduleController.text;
      final lastDeworming = lastDewormingController.text;
      final recentTreatments = recentTreatmentsController.text;
      final animalBehavior = animalBehaviorController.text;
      final reasonForConsultation = reasonForConsultationController.text;

      //Examen fisico generaliz
      final physicalCondition = physicalConditionController.text;
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
      final mucous = mucousController.text;
      late ClinicalHistory clinicalHistory = ClinicalHistory(
          widget.idHistory,
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

      messageUpdate(clinicalHistory);
    }
  }

  // Le indica al usuario si se pudo o no actualizar la información de la historia clínica
  void messageUpdate(ClinicalHistory clinicalHistory) async {
    respuesta = await histCont.updateClinicalHistory(clinicalHistory);
    if (respuesta) {
      Navigator.pushNamed(context, '/clinicalHistories')
          .then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se actualizó la información"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se actualizó la información"),
        backgroundColor: Colors.green,
      ));
    }
  }

  /// Obtiene la información de la historia clínica a la cual se quiere
  /// cambiar su información
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
