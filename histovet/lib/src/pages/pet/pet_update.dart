import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/pet_controller.dart';
import '../../models/pet_model.dart';

// Clases encargadas de la vista que le permite al usuario
// actualizar los datos de la mascota
class UpdatePet extends StatefulWidget {
  static String id = "edit_pet";
  final String idPet;
  final String idOwner;

  const UpdatePet(this.idPet, this.idOwner, {Key? key}) : super(key: key);

  @override
  State<UpdatePet> createState() => _UpdatePet();
}

class _UpdatePet extends State<UpdatePet> {
  final _formState = GlobalKey<FormBuilderState>();
  PetController petCont = PetController();

  String vet_name = "";

  TextEditingController birthdayController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController neuteringController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController subspeciesController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController recordController = TextEditingController();

  bool respuesta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Actualizar Información Mascota"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoPetPet();
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
                      controller: codeController,
                      name: "code",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Código",
                          prefixIcon: Icon(Icons.pets),
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
                      ])),
                ),*/
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                    controller: nameController,
                    name: "name",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Nombre",
                        prefixIcon: Icon(Icons.pets),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    maxLength: 15,
                    validator: FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      controller: ageController,
                      name: "age",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Edad",
                          prefixIcon: Icon(Icons.pets),
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
                    controller: breedController,
                    name: "breed",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Raza",
                        prefixIcon: Icon(Icons.pets),
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
                    controller: genderController,
                    name: "gender",
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
                    controller: subspeciesController,
                    name: "subspecies",
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
                    controller: neuteringController,
                    name: "neutering",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Esterilizado",
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
                        prefixIcon: Icon(Icons.pets),
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
                    controller: birthdayController,
                    name: "birthday",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Fecha de Cumpleaños",
                        prefixIcon: Icon(Icons.pets),
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
                  child: FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('vet_list').get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return DropdownButton(
                        onChanged: (newValue) {
                          setState(() {
                            vet_name = newValue.toString();
                          });
                        },
                        hint: Text("Seleccionar veterinaria: " + vet_name),
                        items: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
                            value: document['name'],
                            child: Text(document['name']),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),

               
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    getInfoPet();
    super.initState();
  }

  // Se encarga de obtener los datos que el usuario ingresó
  getInfoPetPet() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      //final code = codeController.text;
      final name = nameController.text;
      final neutering = neuteringController.text;
      final age = int.parse(ageController.text);
      final breed = breedController.text;
      final subspecies = subspeciesController.text;
      final color = colorController.text;
      final gender = genderController.text;
      final birthday = birthdayController.text;
      final record = recordController.text;

      final vet_name_ = vet_name;
      late Pet pet = Pet(widget.idPet, widget.idOwner, birthday, name,
          neutering, age, breed, subspecies, color, gender, vet_name_, record);
      messageUpdate(pet);
    }
  }

  // Le indica al usuario si se pudo o no actualizar la información de la mascota
  void messageUpdate(Pet pet) async {
    respuesta = await petCont.updatePet(pet);
    if (respuesta) {
      Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se actualizó la información de la mascota"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se actualizó la información"),
        backgroundColor: Colors.green,
      ));
    }
  }

  /// Obtiene la información de la mascota a la cual se quiere
  /// cambiar su información

  void getInfoPet() async {
    Pet pet = await petCont.getPet(widget.idPet);
    setState(() {
      birthdayController.text = pet.birthday;
      nameController.text = pet.name;
      neuteringController.text = pet.neutering;
      ageController.text = pet.age.toString();
      breedController.text = pet.breed;
      subspeciesController.text = pet.specie;
      colorController.text = pet.color;
      genderController.text = pet.gender;
      recordController.text = pet.record;
    });
  }
}
