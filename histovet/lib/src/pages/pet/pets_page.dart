import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/widgets/menu_lateral.dart';
import 'package:histovet/src/pages/pet/add_pets.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';

// Clases encargadas de la vista donde se enlistan todas las ventas que existan en la
// base de datos
class PetsPage extends StatefulWidget {
  static String id = "pets_page";
  const PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  TextStyle txtStyle = const TextStyle(
      fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);

  late Future<List<Pet>> _future;
  PetController petCont = PetController();
  bool answer = false;

  @override
  void initState() {
    super.initState();
    _future = petCont.allPets();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Mascotas"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _future = petCont.allPets();
                    });
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          //drawer: const MenuLateral(),

          floatingActionButton: FloatingActionButton.extended(
              icon: const Icon(FontAwesomeIcons.plus),
              label: const Text('Registrar nueva mascota'),
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, AddPet.id);
              }),
          body: FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List species = snapshot.data ?? [];

                  print(species);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        for (Pet specie in species)
                          Card(
                            margin: const EdgeInsets.all(6),
                            elevation: 6,
                            child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/img/fondo.jpg'),
                                      fit: BoxFit.cover,
                                      opacity: 0.3),
                                ),
                                child: ListTile(
                                    onLongPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => UpdatePet(
                                                  specie.id.toString(),
                                                  specie.owner.toString())));
                                    },
                                    leading: const Icon(
                                      FontAwesomeIcons.paw,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      specie.name,
                                       textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    subtitle: Text(
                                      specie.specie,
                                       textAlign: TextAlign.center,
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      //style: txtStyle.copyWith(fontSize: 17),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.black),
                                      onPressed: () {
                                        messageDelete(specie.id.toString());
                                        Navigator.pushNamed(context, '/pets')
                                            .then((_) => setState(() {}));
                                      },
                                    ))),
                          )
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              })),
    );
  }

  // Le indica al usuario si se pudo o no eliminar el registro
  void messageDelete(String idPet) async {
    answer = await petCont.deletePet(idPet);
    if (answer) {
      Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se eliminó el registro de la mascota"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se pudo eliminar el registro de la mascota"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
