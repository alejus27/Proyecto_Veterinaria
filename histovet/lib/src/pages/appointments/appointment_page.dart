import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/appointment_controller.dart';
import 'package:histovet/src/models/appointment.dart';
import 'package:histovet/src/pages/appointments/add_appointment.dart';
import 'package:histovet/src/pages/appointments/appointment_update.dart';
import 'package:histovet/src/pages/appointments/appointment_view.dart';

import 'package:histovet/src/pages/widgets/menu_lateral.dart';


// Clases encargadas de la vista donde se enlistan todas las ventas que existan en la
// base de datos
class AppointmentsPage extends StatefulWidget {
  static String id = "appointments_page";
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  TextStyle txtStyle = const TextStyle(
      fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  AppointmentController appointmentCont = AppointmentController();
  bool answer = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Citas Médicas"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          //drawer: const MenuLateral(),
          floatingActionButton: FloatingActionButton.extended(
              icon: const Icon(FontAwesomeIcons.plus),
              label: const Text('Agendar nueva cita médica'),
   
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, AddAppointment.id);
              }),

          body: FutureBuilder(
              future: appointmentCont.allAppointments(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List appoints = snapshot.data ?? [];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        for (Appointment appoint in appoints)
                          Card(
                            margin: const EdgeInsets.all(6),
                            elevation: 6,
                            child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/img/fondo_cita.png'),
                                      fit: BoxFit.cover,
                                      opacity: 0.3),
                                ),
                                child: ListTile(
                                    onLongPress: () {
                                      Navigator.push(
                                          
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewAppointment(
                                                  appoint.id.toString())));
                                    },
                                    leading: const Icon(
                                      FontAwesomeIcons.bookMedical,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      "Centro Clinico: "+appoint.vet_name,
                                      style: txtStyle.copyWith(fontSize: 18),
                                    ),
                                    subtitle: Text(
                                      "Doctor: "+appoint.doctor,
                                      style: txtStyle.copyWith(fontSize: 18),
                            
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.black),
                                      onPressed: () {
                                        messageDelete(appoint.id.toString());
                                        Navigator.pushNamed(context, '/appointments')
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
  void messageDelete(String idAppointment) async {
    answer = await appointmentCont.deleteAppointment(idAppointment);
    if (answer) {
      Navigator.pushNamed(context, '/appointments').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se eliminó el registro"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se pudo eliminar el registro"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
