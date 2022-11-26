import 'package:flutter/material.dart';
import 'package:histovet/src/pages/appointments/appointment_page.dart';
import 'package:histovet/src/pages/appointments/consultar_appointment.dart';
//import 'package:histovet/src/pages/clinicalHistory/clinicalhistory_page.dart';
import 'package:histovet/src/pages/clinicalHistory/consultar_histories.dart';
import 'package:histovet/src/pages/gps/gps_page.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';
import 'package:histovet/src/pages/pet/consultar_mascotas.dart';
import 'package:histovet/src/pages/sale/sale_page.dart';

import '../../controller/auth_controller.dart';
import '../medicine/consultar_medicamento.dart';
import '../pet/pets_page.dart';

// Clases encargadas de mostrar las opciones del menú
// de inicio al usuario de acuerdo al tipo de usuario que sea
class GridDashboard extends StatefulWidget {
  const GridDashboard({Key? key}) : super(key: key);

  @override
  State<GridDashboard> createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  AuthController auth = AuthController();
  bool estado = false;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: [

             
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 211, 255, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/img/pet.png",
                    height: 120,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {/*
                      if (estado) {
                        Navigator.pushNamed(context, PetsPage.id);
                      } else {
                        Navigator.pushNamed(context, ConsultarMascota.id);
                      }*/
                       Navigator.pushNamed(context, ConsultarMascota.id);
                    },
                    child: Text("Mis Mascotas"),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 211, 255, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/img/medicine.png",
                    height: 110,
                    scale: 5,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      /*
                      if (estado) {
                        Navigator.pushNamed(context, MedicinePage.id);
                      } else {
                        Navigator.pushNamed(context, ConsultarMedicamento.id);
                      }
                      */

                      Navigator.pushNamed(context, ConsultarMedicamento.id);
                    },
                    child: Text("Comprar Medicamento"),
                  ),
                ],
              ),
            ),
            
            /*
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 211, 255, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/img/appointment.png",
                    height: 110,
                    scale: 5,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      if (estado) {
                        Navigator.pushNamed(context, AppointmentsPage.id);
                      } else {
                        Navigator.pushNamed(context, ConsultarAppointment.id);
                      }
                    },
                    child: Text(estado ? "Citas Médicas" : "Buscar Citas"),
                  ),
                ],
              ),
            )
            
            
            ,
            

            
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 211, 255, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/img/history.png",
                    height: 110,
                    scale: 5,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      if (estado) {
                        Navigator.pushNamed(context, HistoryPage.id);
                      } else {
                        Navigator.pushNamed(context, ConsultarHistories.id);
                      }
                    },
                    child: Text(estado
                        ? "Historias Clínicas"
                        : "Buscar Historia Clínica"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 211, 255, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/img/maps.png",
                    height: 110,
                    scale: 5,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(33, 150, 255, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, GpsPage.id);
                    },
                    child: const Text("Mapas"),
                  ),
                ],
              ),
            ),
            
           
            
            Visibility(
              visible: estado,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(33, 211, 255, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/img/venta.png",
                      height: 110,
                      scale: 5,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(33, 150, 255, 1)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SalesPage.id);
                      },
                      child: const Text("Ventas"),
                    ),
                  ],
                ),
              ),
            )

            */
          ]
          
          
          ),
    );

    
  }

  @override
  void initState() {
    getEstado();
    super.initState();
  }

  // Permite identificar que tipo de usuario es el que se encuentra en sesión
  void getEstado() async {
    estado = await auth.estado();
    setState(() {});
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(this.title, this.subtitle, this.event, this.img);
}
