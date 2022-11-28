import 'package:flutter/material.dart';
import 'package:histovet/src/controller/medicine_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/pages/medicine/medicine_view.dart';
import 'package:hexcolor/hexcolor.dart';

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
        title: const Text("Comprar Medicamento"),
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
                                          "assets/img/medicine.png",
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
                                                fontWeight: FontWeight.bold)),
                                        Text("  " + medicine.name),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text("  Precio unitario:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text('  \$' + medicine.precio.toString()),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const SizedBox(
                                          height: 5,
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
                                            label: const Text("Comprar"))
                                      ],
                                    ),
                                  ),
                              if (medicines.isEmpty)
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
}
