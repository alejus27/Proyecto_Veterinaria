import 'package:flutter/material.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/clinicalHistory/consultar_histories.dart';
import 'package:histovet/src/pages/hospitalization/consult_hospitalization.dart';
import 'package:histovet/src/pages/pet/pet_view.dart';
import '../../controller/auth_controller.dart';
import 'package:hexcolor/hexcolor.dart';

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
        title: const Text("Mis Mascotas"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            /*TextField(
              controller: searchController,
              maxLength: 20,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese el nombre de la mascota',
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
            */
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
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
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: HexColor("#335c67"),
                                          width: 5)),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        "assets/img/dogcat.png",
                                        height: 100,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        ' Nombre: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "  " + pet.name,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "  Especie: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "  " + pet.specie,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "  Sexo: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "  " + pet.gender,
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      ElevatedButton.icon(
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
                                          label: const Text("Información")),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ConsultarHistories(pet
                                                            .id
                                                            .toString())));
                                          },
                                          icon: const Icon(
                                              Icons.article_outlined),
                                          label:
                                              const Text("Historial Clínico")),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ConsultHospitalization(
                                                            pet.id
                                                                .toString())));
                                          },
                                          icon: const Icon(
                                              Icons.article_outlined),
                                          label: const Text("Hospitalización")),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                            if (pets.isEmpty)
                              Column(
                                children: const [Text("...")],
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
