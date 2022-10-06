import 'package:flutter/material.dart';

import '../../controller/appointment_controller.dart';
import '../../models/appointment.dart';


// Clases encargadas de la vista que le permite al usuario
// buscar appointments
class ConsultarAppointment extends StatefulWidget {
  static String id = "consultar_appointment";
  const ConsultarAppointment({Key? key}) : super(key: key);

  @override
  State<ConsultarAppointment> createState() => _ConsultarAppointmentState();
}

class _ConsultarAppointmentState extends State<ConsultarAppointment> {
  TextEditingController searchController = TextEditingController();
  AppointmentController medCont = AppointmentController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultar appointment"),
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
              decoration: const InputDecoration(
                labelText: 'Ingrese el nombre del appointment',
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
                    future: medCont.searchAppointment(searchController.text),
                    builder:
                        (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        List appointments = snapshot.data ?? [];
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView(
                            children: [
                              if (appointments.isNotEmpty)
                                for (Appointment appointment in appointments)
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
                                            Text("  " + appointment.code),
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
                                            Text("  " + appointment.ownerName),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text("  Precio:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " +
                                                appointment.petName),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text("  Nombre de mascota: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " + appointment.fecha),
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
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("  " + appointment.reason),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                              if (appointments.isEmpty)
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
