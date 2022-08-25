import 'package:flutter/material.dart';
import 'package:histovet/src/pages/clinicalHistory/clinical_view.dart';
import '../../models/clinicalhistory_model.dart';

import '../../controller/clinicalhistory_controller.dart';
import '../../controller/auth_controller.dart';

// Clases encargadas de la vista que le permite al usuario
// buscar historias clínicas de una mascota
class ConsultarHistories extends StatefulWidget {
  static String id = "consultar_historias";
  const ConsultarHistories({Key? key}) : super(key: key);

  @override
  State<ConsultarHistories> createState() => _ConsultarHistoriesState();
}

class _ConsultarHistoriesState extends State<ConsultarHistories> {
  TextEditingController searchController = TextEditingController();
  ClinicalHistoryController history = ClinicalHistoryController();
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
        title: const Text("Consultar historias clínicas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: searchController,
              maxLength: 10,
              keyboardType: TextInputType.name,
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
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                height: 590,
                child: FutureBuilder(
                    future: history.searchHistories(searchController.text),
                    builder:
                        (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        List pets = snapshot.data ?? [];
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView(
                            children: [
                              if (pets.isNotEmpty)
                                for (ClinicalHistory pet in pets)
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewHistory(pet.id
                                                              .toString())));
                                            },
                                            icon: const Icon(
                                                Icons.article_outlined),
                                            label:
                                                const Text("Ver información")),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text("  Código: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                "  " + pet.numberCH.toString()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text("  Nombre: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
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
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                            Text("  Fecha: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " + pet.date),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text("  Sexo: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                          ),
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
