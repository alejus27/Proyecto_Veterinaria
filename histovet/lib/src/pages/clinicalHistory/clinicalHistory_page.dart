import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/auth_controller.dart';

import 'package:histovet/src/pages/clinicalHistory/add_clinicalhistory.dart';
import 'package:histovet/src/pages/clinicalHistory/update_clinicalhistory.dart';

import '../../controller/clinicalhistory_controller.dart';

import '../../models/clinicalhistory_model.dart';
import '../widgets/menu_lateral.dart';

// Clases encargadas de la vista donde se enlistan todas las historias clinicas
// que existan en la base de datos
class HistoryPage extends StatefulWidget {
  static String id = "clinicalHistory";
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  TextStyle txtStyle = const TextStyle(
      fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  ClinicalHistoryController histCont = ClinicalHistoryController();
  bool respuesta = false;
  bool estado = false;
  AuthController auth = AuthController();
  @override
  void initState() {
    getEstado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Historias Clínicas"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          drawer: const MenuLateral(),
          floatingActionButton: Visibility(
            visible: estado,
            child: FloatingActionButton(
                child: const Icon(FontAwesomeIcons.plus),
                elevation: 15.0,
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, AddClinicalHistory.id);
                }),
          ),
          body: FutureBuilder(
              future: histCont.allClinicalHistories(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List histories = snapshot.data ?? [];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        for (ClinicalHistory history in histories)
                          Card(
                            margin: const EdgeInsets.all(6),
                            elevation: 6,
                            child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/fondo3.png'),
                                    fit: BoxFit.cover,
                                    opacity: 0.4,
                                  ),
                                ),
                                child: ListTile(
                                    onLongPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateHistory(
                                                      history.id.toString())));
                                    },
                                    leading: const Icon(
                                      FontAwesomeIcons.paperclip,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      history.name,
                                      style: txtStyle,
                                    ),
                                    subtitle: Text(
                                      history.numberCH.toString(),
                                      style: txtStyle.copyWith(fontSize: 17),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.black),
                                      onPressed: () {
                                        messageDelete(history.id.toString());
                                        Navigator.pushNamed(
                                                context, '/clinicalHistories')
                                            .then((_) => setState(() {}));
                                      },
                                    ))),
                          )
                      ],
                    ),
                  );
                } else {
                  return const Text('Empty data');
                }
              })),
    );
  }

  // Le indica al usuario si se pudo o no eliminar el registro
  void messageDelete(String idHistory) async {
    respuesta = await histCont.deleteHistory(idHistory);
    if (respuesta) {
      Navigator.pushNamed(context, '/clinicalHistories')
          .then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se eliminó la historia clínica"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se pudo eliminar"),
        backgroundColor: Colors.green,
      ));
    }
  }

  //Permite saber que tipo de usuario es el que está en sesión
  void getEstado() async {
    estado = await auth.estado();
    setState(() {});
  }
}
