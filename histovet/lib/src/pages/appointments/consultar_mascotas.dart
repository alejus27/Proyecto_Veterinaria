import 'package:flutter/material.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/clinicalHistory/add_historypet.dart';
import 'package:histovet/src/pages/pet/pet_view.dart';
import '../../controller/auth_controller.dart';

// Clases encargadas de la vista que le permite al usuario
// buscar una mascota
class ConsultarMascota extends StatefulWidget {
  static String id = "consultar_mascota";
  const ConsultarMascota({Key? key}) : super(key: key);

  @override
  State<ConsultarMascota> createState() => _ConsultarMascotaState();
}

class _ConsultarMascotaState extends State<ConsultarMascota> {
  TextEditingController searchController = TextEditingController();
  PetController petse = PetController();
  bool estado = false;
  AuthController auth = AuthController();

  @override
  void initState() {
    getEstado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultar mascota"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: searchController,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese el código de la mascota',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 20,
              height: 30,
              child: ElevatedButton(
                child: const Text('Buscar'),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 20,
                  right: 40,
                  bottom: 20,
                ),
                height: 590,
                child: FutureBuilder(
                    future: petse.searchPet(searchController.text),
                    builder:
                        (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        List pets = snapshot.data ?? [];
                        return ListView(
                          children: [
                            if (pets.isNotEmpty)
                              for (Pet pet in pets)
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        "assets/img/dogcat.png",
                                        height: 100,
                                      ),
                                      estado
                                          ? ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HistoryPetSelectPage(pet
                                                                .id
                                                                .toString())));
                                              },
                                              icon: const Icon(
                                                  Icons.add_box_outlined),
                                              label: const Text(
                                                  "Agregar historia"))
                                          : ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewPet(pet.id
                                                                .toString())));
                                              },
                                              icon: const Icon(
                                                  Icons.article_outlined),
                                              label: const Text(
                                                  "Ver información")),
                                      estado
                                          ? ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewPet(pet.id
                                                                .toString())));
                                              },
                                              icon: const Icon(
                                                  Icons.article_outlined),
                                              label:
                                                  const Text("Ver información"))
                                          : const SizedBox(
                                              height: 1,
                                            ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: const [
                                          Text("  Código: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + pet.code),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: const [
                                          Text("  Nombre: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + pet.name),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: const [
                                          Text("  Nombre dueño:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + pet.nameOwner),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: const [
                                          Text("  Raza: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + pet.breed),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: const [
                                          Text("  Sexo: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + pet.sex),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                            if (pets.isEmpty)
                              Column(
                                children: const [Text("No hay información")],
                              )
                          ],
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    }))
          ],
        ),
      ),
    );
  }

  //Permite saber que tipo de usuario es el que está en sesión
  void getEstado() async {
    estado = await auth.estado();
    setState(() {});
  }
}
