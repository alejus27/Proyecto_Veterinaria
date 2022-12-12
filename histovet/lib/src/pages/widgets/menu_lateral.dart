import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/pages/Login/signin_screen.dart';
import 'package:histovet/src/pages/appointments/add_appointment.dart';
import 'package:histovet/src/pages/appointments/appointment_page.dart';
import 'package:histovet/src/pages/appointments/consultar_appointment.dart';
//import 'package:histovet/src/pages/clinicalHistory/clinicalhistory_page.dart';
import 'package:histovet/src/pages/clinicalHistory/consultar_histories.dart';
import 'package:histovet/src/pages/gps/gps_page.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';
import 'package:histovet/src/pages/medicine/consultar_medicamento.dart';
import 'package:histovet/src/pages/pet/consultar_mascotas.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';
import 'package:histovet/src/pages/sale/sale_page.dart';

import '../../controller/auth_controller.dart';
import '../Home/home_page.dart';

// Clases encargadas de mostrar el menú lateral con las secciones que puede visitar
// el usuario de acuerdo al tipo de usuario que sea
class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  AuthController sign = AuthController();
  String username = "";
  String username_aux = "";
  bool estado = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/img/vet.png')),
                  const Text("HistoVet",style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              )),
          Column(children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_front_outlined,
                  color: Colors.green),
              title: Text(username.toString()),
            ),
            ListTile(
              leading: const Icon(Icons.door_back_door, color: Colors.red),
              title: const Text("Cerrar sesión"),
              onTap: () {
                messageOut();
              },
            ),
            Container(height: 1, color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.house),
              title: const Text("Inicio"),
              onTap: () async{
                await Navigator.pushNamed(context, Home.id);
              },
            ),


            ListTile(
              leading: const Icon(Icons.pets, color: Colors.amber),
              title: const Text("Administrar Mascotas"),
              onTap: () async
              {
                await Navigator.pushNamed(context, PetsPage.id);
              },
            ),


            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded,
                  color: Colors.amber),
              title: const Text("Mis Mascotas"),
              onTap: () async{
                 await Navigator.pushNamed(context, ConsultarMascota.id);
              },
            ),
            Container(height: 1, color: Colors.grey),
            ListTile(
              leading:
                  const Icon(Icons.medical_information_rounded, color: Colors.deepPurple),
              title: const Text("Citas Médicas"),
              onTap: () async{
                 await Navigator.pushNamed(context, AppointmentsPage.id);
              },
            ),

            Container(height: 1, color: Colors.grey),
            ListTile(
              leading:
                  const Icon(Icons.shopping_cart, color: Colors.blueAccent),
              title: const Text("Comprar Medicamentos"),
              onTap: () async{
                 await Navigator.pushNamed(context, ConsultarMedicamento.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.point_of_sale_outlined,
                  color: Colors.blueAccent),
              title: const Text("Mis Compras"),
              onTap: () async{
                 await Navigator.pushNamed(context, SalesPage.id);
              },
            ),
            

            /*


             
            Visibility(
              visible: estado,
              child: ListTile(
                leading: const Icon(Icons.book),
                title: const Text("Citas médicas"),
                onTap: () {
                  Navigator.pushNamed(context, AppointmentsPage.id);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Consultar Cita Médica"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarAppointment.id);
              },
            ),

           
            Visibility(
              visible: estado,
              child: ListTile(
                leading: const Icon(Icons.medication),
                title: const Text("Medicinas"),
                onTap: () {
                  Navigator.pushNamed(context, MedicinePage.id);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Consultar Medicamento"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarMedicamento.id);
              },
            ),
            Visibility(
              visible: estado,
              child: ListTile(
                leading: const Icon(Icons.article_sharp),
                title: const Text("Historias Clínicas"),
                onTap: () {
                  Navigator.pushNamed(context, HistoryPage.id);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Buscar Historias Clínicas"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarHistories.id);
              },
            ),
            */
            Container(height: 1, color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.map, color: Colors.brown),
              title: const Text("Mapa"),
              onTap: () {
                Navigator.pushNamed(context, GpsPage.id);
              },
            ),
          ])
        ],
      ),
    );
  }

  void messageOut() async {
    bool answer = await sign.signOut();

    if (answer) {
      Navigator.pushNamed(context, SignIn.id);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se cerró sesión"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se pudo cerrar sesión"),
        backgroundColor: Colors.green,
      ));
    }
  }

  @override
  void initState() {
    getUsername();
    getEstado();
    super.initState();
  }

  void getUsername() async {
    username = (await sign.username());
    estado = await sign.estado();

    if (estado) {
      username_aux = "Usuario regular";
    } else {
      username_aux = "Usuario administrador";
    }

    setState(() {});
  }

  void getEstado() async {
    estado = await sign.estado();
    setState(() {});
  }
}
