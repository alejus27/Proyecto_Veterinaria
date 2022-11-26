import 'package:flutter/material.dart';
import 'package:histovet/src/controller/medicine_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/pages/medicine/medicine_view.dart';

// Clases encargadas de la vista que le permite al usuario
// buscar medicamentos
class ConsultarMedicamento extends StatefulWidget {
  static String id = "consultar_medicamento";
  const ConsultarMedicamento({Key? key}) : super(key: key);

  @override
  State<ConsultarMedicamento> createState() => _ConsultarMedicamentoState();
}

class _ConsultarMedicamentoState extends State<ConsultarMedicamento> {
  TextEditingController searchController = TextEditingController();
  MedicineController medCont = MedicineController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultar medicamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            /*
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Ingrese el nombre del medicamento',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
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
                //decoration:
                    //BoxDecoration(border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 20,
                  right: 40,
                  bottom: 20,
                ),
                height: 590,
                child: FutureBuilder(
                    future: medCont.searchMedicine(searchController.text),
                    builder:
                        (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        List medicines = snapshot.data ?? [];
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView(
                            children: [
                              if (medicines.isNotEmpty)
                                for (Medicine medicine in medicines)
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
                                        Image.asset(
                                          "assets/img/medicine.png",
                                          height: 100,
                                        ),
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewMedicine(medicine
                                                              .id
                                                              .toString())));
                                            },
                                            icon: const Icon(
                                                Icons.article_outlined),
                                            label:
                                                const Text("Ver información")),
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/addsale',
                                                  arguments: medicine);
                                            },
                                            icon:
                                                const Icon(Icons.shopping_cart),
                                            label: const Text("Comprar")),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        /*Row(
                                          children: const [
                                            Text("  Código: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " + medicine.code),
                                          ],
                                        ),*/
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
                                            Text("  " + medicine.name),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text("  Precio unitario:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " +
                                                medicine.precio.toString()),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        /*Row(
                                          children: const [
                                            Text("  Fecha de vencimiento: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " + medicine.fechaVen),
                                          ],
                                        ),*/
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text("  Descripción: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " + medicine.descripcion),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                              if (medicines.isEmpty)
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
}
