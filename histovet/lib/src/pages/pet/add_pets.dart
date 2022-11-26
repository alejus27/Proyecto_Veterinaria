import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/pet_controller.dart';
import '../../models/pet_model.dart';

// Clases encargadas de la vista que le permite al usuario
// ingresar datos para agregar una mascota

class AddPet extends StatefulWidget {
  static String id = "form_pet";
  const AddPet({Key? key}) : super(key: key);

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formState = GlobalKey<FormBuilderState>();
  bool answer = false;
  PetController petCont = PetController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registrar mascota"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoPet();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                /*Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                    name: "code",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Código",
                        hintText: "Ingrese el código de la mascotas",
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
                          errorText: "La longitud del documento es de 4")
                    ]),
                  ),
                ),*/
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderTextField(
                        name: "name",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            labelText: "Nombre",
                            hintText: "Ingrese el nombre de la mascota",
                            prefixIcon: Icon(Icons.pets),
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
                      name: "age",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Edad",
                          hintText: "Ingresa la edad de la mascotas",
                          prefixIcon: Icon(Icons.numbers),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido"),
                        FormBuilderValidators.min(context, 0,
                            errorText: "La edad debe ser mayor o igual que 0")
                      ])),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderDropdown(
                        name: "gender",
                        decoration: const InputDecoration(
                            labelText: "Seleccionar genero",
                            prefixIcon: Icon(Icons.article_outlined),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        //hint: const Text("Seleccionar gendero"),
                        validator: FormBuilderValidators.required(context,
                            errorText: "Seleccione un gendero para la mascota"),
                        items: [
                          {'value': 'Macho', 'key': 'Macho'},
                          {'value': 'Hembra', 'key': 'Hembra'}
                        ]
                            .map((gender) => DropdownMenuItem(
                                value: gender["value"],
                                child: Text("${gender["value"]}")))
                            .toList())),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderDropdown(
                      name: "subespecie",
                      decoration: const InputDecoration(
                          labelText: "Seleccionar Especie",
                          prefixIcon: Icon(Icons.article_outlined),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      //hint:const Text("Seleccionar subespecie para la mascota"),
                      validator: FormBuilderValidators.required(context,
                          errorText: "Seleccione una especie"),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderDropdown(
                        name: "neutering",
                        decoration: const InputDecoration(
                            labelText: "Seleccionar esterilizado",
                            prefixIcon: Icon(Icons.article_outlined),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        //hint: const Text("Seleccionar gendero"),
                        validator: FormBuilderValidators.required(context,
                            errorText: "Seleccionar si es esterilizado"),
                        items: [
                          {'value': 'Si', 'key': 'Si'},
                          {'value': 'No', 'key': 'No'}
                        ]
                            .map((neutering) => DropdownMenuItem(
                                value: neutering["value"],
                                child: Text("${neutering["value"]}")))
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
                    name: "birthday",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Fecha de Nacimiento",
                        hintText: "AAAA-MM-DD",
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    maxLength: 20,
                    validator: FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                  ),
                )
              ],
            ),
          )),
    );
  }

  // Valida que todos los campos cumplan los formatos y obtiene la
  //información que ingresó el usuario
  void getInfoPet() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      //final code = values['code'];
      final name = values['name'];
      final age = int.parse(values['age']);
      final breed = values['breed'];
      final specie = values['subespecie'];
      final color = values['color'];
      final gender = values['gender'];
      final birthday = values['birthday'];
      final neutering = values['neutering'];
  
      late Pet pet = Pet("", "",birthday, name, neutering, age,
          breed, specie, color, gender);
      messageAdd(pet);
    }
  }

  //Muestra un mensaje que le indica al usuario si se pudo crear la mascota
  void messageAdd(Pet pet) async {
    answer = await petCont.addPet(pet);
    if (answer) {
      Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se guardó la información de la mascota"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se guardó la información"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
