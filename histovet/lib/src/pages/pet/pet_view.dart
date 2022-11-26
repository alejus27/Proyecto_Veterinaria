import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../controller/pet_controller.dart';
import '../../models/pet_model.dart';

// Clases encargadas de la vista donde se muestra la información de la mascota

class ViewPet extends StatefulWidget {
  static String id = "view_pet";
  final String idPet;

  const ViewPet(this.idPet, {Key? key}) : super(key: key);

  @override
  State<ViewPet> createState() => _ViewPet();
}

class _ViewPet extends State<ViewPet> {
  final _formState = GlobalKey<FormBuilderState>();
  PetController petCont = PetController();

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController neuteringController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController subspeciesController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Información Mascota"),
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: _inputs()),
          )),
    );
  }

  List<Widget> _inputs() {
    return [
      /*Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: codeController,
          enabled: false,
          name: "code",
          decoration: const InputDecoration(
              labelText: "Código",
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),*/
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: nameController,
          enabled: false,
          name: "name",
          decoration: const InputDecoration(
              labelText: "Nombre",
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: ageController,
          enabled: false,
          name: "age",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
              labelText: "Edad",
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
          controller: genderController,
          enabled: false,
          name: "gender",
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
          controller: subspeciesController,
          enabled: false,
          name: "subspecies",
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
          controller: neuteringController,
          enabled: false,
          name: "neutering",
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
          controller: colorController,
          enabled: false,
          name: "color",
          decoration: const InputDecoration(
              labelText: "Color",
              prefixIcon: Icon(Icons.pets),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      )
    ];
  }

  @override
  void initState() {
    getInfoPet();
    super.initState();
  }

  /// Obtiene la información de la mascota
  void getInfoPet() async {
    Pet pet = await petCont.getPet(widget.idPet);
    setState(() {
      //codeController.text = pet.code;
      nameController.text = pet.name;
      neuteringController.text = pet.neutering;
      ageController.text = pet.age.toString();
      breedController.text = pet.breed;
      subspeciesController.text = pet.specie;
      colorController.text = pet.color;
      genderController.text = pet.gender;
    });
  }
}
