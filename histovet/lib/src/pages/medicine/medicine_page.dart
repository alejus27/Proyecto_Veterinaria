import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/pages/medicine/add_medicine.dart';
import 'package:histovet/src/pages/widgets/menu_lateral.dart';

import '../../controller/medicine_controller.dart';
import 'medicine_update.dart';

// Clases encargadas de la vista donde se enlistan todas las medicinas
// que existan en la base de datos
class MedicinePage extends StatefulWidget {
  static String id = "medicine_page";
  const MedicinePage({Key? key}) : super(key: key);

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  TextStyle txtStyle = const TextStyle(
      fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  MedicineController medicineCont = MedicineController();
  bool respuesta = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Medicinas"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          drawer: const MenuLateral(),
          floatingActionButton: FloatingActionButton(
              child: const Icon(FontAwesomeIcons.plus),
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, AddMedicine.id);
              }),
          body: FutureBuilder(
              future: medicineCont.allMedicines(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    List medicines = snapshot.data ?? [];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          for (Medicine medicine in medicines)
                            Card(
                              margin: const EdgeInsets.all(6),
                              elevation: 6,
                              child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/img/fondo2.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: ListTile(
                                      onLongPress: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateMedicine(medicine.id
                                                        .toString())));
                                      },
                                      leading: const Icon(
                                        FontAwesomeIcons.kitMedical,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        medicine.name,
                                        style: txtStyle,
                                      ),
                                      subtitle: Text(
                                        medicine.code,
                                        style: txtStyle.copyWith(fontSize: 17),
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.black),
                                        onPressed: () {
                                          messageDelete(medicine.id.toString());
                                          Navigator.pushNamed(
                                                  context, '/medicine')
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
                } else {
                  return const Text('State');
                }
              })),
    );
  }

  // Le indica al usuario si se pudo o no eliminar el registro
  void messageDelete(String idMedicine) async {
    respuesta = await medicineCont.deleteMedicine(idMedicine);
    if (respuesta) {
      Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se eliminó la medicina"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se pudo eliminar"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
