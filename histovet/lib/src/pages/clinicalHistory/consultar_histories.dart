import 'package:flutter/material.dart';
import 'package:histovet/src/controller/clinicalHistory_controller.dart';
import 'package:histovet/src/pages/clinicalHistory/clinical_view.dart';
import '../../models/clinicalHistory_model.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../controller/auth_controller.dart';

// Clases encargadas de la vista que le permite al usuario
// buscar historias clínicas de una mascota
class ConsultarHistories extends StatefulWidget {
  static String id = "consultar_historias";

  final String idHistory;

  const ConsultarHistories(this.idHistory, {Key? key}) : super(key: key);

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
        title: const Text("Historias clínicas"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            /*TextField(
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
            */
            Container(
                //decoration:BoxDecoration(border: Border.all(color: Colors.black)),
                height: 550,
                child: FutureBuilder(
                    future: history.searchClinicalHistories(widget.idHistory),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color: HexColor("#335c67"),
                                            width: 5)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Image.asset(
                                          "assets/img/1.png",
                                          height: 100,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text("  Nombre: ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center),
                                        Text("  " + pet.pet_name),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text("  Observaciones: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                        Text("  " + pet.observations),
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
                                            label: const Text("Información")),
                                      ],
                                    ),
                                  ),
                              if (pets.isEmpty)
                                Column(
                                  children: const [Text("...")],
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
