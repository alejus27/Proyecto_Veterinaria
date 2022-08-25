import '../../controller/auth_controller.dart';
import '../../models/clinicalhistory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/clinicalhistory_controller.dart';

// Clases encargadas de la vista que le permite al usuario
// ingresar datos para agregar una historia clínica
class AddClinicalHistory extends StatefulWidget {
  static String id = "form_clinicalHistory";
  const AddClinicalHistory({Key? key}) : super(key: key);

  @override
  State<AddClinicalHistory> createState() => _AddClinicalHistoryState();
}

class _AddClinicalHistoryState extends State<AddClinicalHistory> {
  final _formState = GlobalKey<FormBuilderState>();
  bool respuesta = false;
  ClinicalHistoryController clinicalHistorycont = ClinicalHistoryController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  AuthController auth = AuthController();
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(" Agregar Historial Clinico"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            getInfoHV();
          },
        ),
        body: FormBuilder(
            key: _formState,
            child: ListView(children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "numberCH",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Número de historia clinica",
                      hintText: "Ingrese el Número de historia clinica",
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
                      enabled: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Fecha",
                          hintText: "Ingrese la fecha actual",
                          prefixIcon: Icon(Icons.date_range),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.datetime,
                      maxLength: 10,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido"),
                      ]))),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      controller: timeController,
                      enabled: false,
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
                  name: "addressOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Dirección",
                      hintText: "Ingrese la dirección de la mascota",
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
                  name: "name",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Nombre de la mascota",
                      hintText: "Ingrese el nombre de la mascota",
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
                  controller: emailController,
                  name: "emailAddressOwner",
                  enabled: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      hintText: "Ingrese el correo electrónico",
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
                child: FormBuilderDropdown(
                    name: "subespecie",
                    decoration: const InputDecoration(
                        labelText: "Subespecie",
                        prefixIcon: Icon(Icons.article_outlined),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    hint: const Text("Seleccionar subespecie para la mascota"),
                    validator: FormBuilderValidators.required(context,
                        errorText: "Seleccione una subespecie"),
                    items: [
                      {'value': 'Perro', 'key': 'Perro'},
                      {'value': 'Gato', 'key': 'Gato'}
                    ]
                        .map((subespecie) => DropdownMenuItem(
                            value: subespecie["value"],
                            child: Text("${subespecie["value"]}")))
                        .toList()),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
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
                  child: FormBuilderDropdown(
                      name: "sex",
                      decoration: const InputDecoration(
                          labelText: "Sexo",
                          prefixIcon: Icon(Icons.article_outlined),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      hint: const Text("Seleccionar sexo"),
                      validator: FormBuilderValidators.required(context,
                          errorText: "Seleccione un sexo para la mascota"),
                      items: [
                        {'value': 'Macho', 'key': 'Macho'},
                        {'value': 'Hembra', 'key': 'Hembra'}
                      ]
                          .map((sex) => DropdownMenuItem(
                              value: sex["value"],
                              child: Text("${sex["value"]}")))
                          .toList())),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
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
                  name: "origin",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Origen",
                      hintText: "Ciudad de origen mascota",
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
                  child: FormBuilderDropdown(
                      name: "sterilized",
                      decoration: const InputDecoration(
                          labelText: "Esterilización",
                          prefixIcon: Icon(Icons.article_outlined),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      hint: const Text("Seleccione una opción"),
                      validator: FormBuilderValidators.required(context,
                          errorText:
                              "Seleccione si está esterilizada la mascota"),
                      items: [
                        {'value': 'Si', 'key': 'Si'},
                        {'value': 'No', 'key': 'No'}
                      ]
                          .map((sterilized) => DropdownMenuItem(
                              value: sterilized["value"],
                              child: Text("${sterilized["value"]}")))
                          .toList())),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
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
            ])));
  }

  @override
  void initState() {
    DateTime today = DateTime.now();
    timeController.text = "${today.hour}:${today.minute}";
    dateController.text = today.toIso8601String().split('T').first;
    getUsername();
    super.initState();
  }

  // Valida que todos los campos cumplan los formatos y obtiene la
  //información que ingresó el usuario
  getInfoHV() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;

      //Identificación historia clinica
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
      final specie = values['subespecie'];
      final breed = values['breed'];
      final sex = values['sex'];
      final color = values['color'];
      final weight = double.parse(values['weight']);
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
      final temperature = double.parse(values['temperature']);
      final heartFrequency = double.parse(values['heartFrequency']);
      final respiratoryFrequency = double.parse(values['respiratoryFrequency']);
      //tiempo de llena capilar: TLLC
      final tllc = double.parse(values['tllc']);
      final pulse = double.parse(values['pulse']);
      //tiempo de recuperación del pliegue cutáneo TRPC
      final trcp = double.parse(values['trcp']);
      final percentageDehydration =
          double.parse(values['percentageDehydration']);
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

      messageAd(clinicalHistory);
    }
  }

  //Muestra un mensaje que le indica al usuario si se pudo crear la historia clinica
  void messageAd(ClinicalHistory clinicalHistory) async {
    respuesta = await clinicalHistorycont.addClinicalHistory(clinicalHistory);
    if (respuesta) {
      Navigator.pushNamed(context, '/clinicalHistories')
          .then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se guardó la información de la historia clínica"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se guardó la información de la historia clínica"),
        backgroundColor: Colors.green,
      ));
    }
  }

  void getUsername() async {
    username = await auth.username();
    emailController.text = username;
    setState(() {});
  }
}
