import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/pages/Home/home_page.dart';
import 'package:histovet/src/pages/Login/reset_password.dart';
import 'package:histovet/src/pages/Login/signin_screen.dart';
import 'package:histovet/src/pages/Login/signup_screen.dart';
import 'package:histovet/src/pages/appointments/add_appointment.dart';
import 'package:histovet/src/pages/appointments/appointment_page.dart';
import 'package:histovet/src/pages/appointments/appointment_update.dart';
import 'package:histovet/src/pages/clinicalHistory/add_clinicalhistory.dart';
import 'package:histovet/src/pages/clinicalHistory/add_historypet.dart';
import 'package:histovet/src/pages/clinicalHistory/clinicalhistory_page.dart';
import 'package:histovet/src/pages/clinicalHistory/consultar_histories.dart';
import 'package:histovet/src/pages/gps/gps_page.dart';
import 'package:histovet/src/pages/medicine/add_medicine.dart';
import 'package:histovet/src/pages/pet/add_pets.dart';
import 'package:histovet/src/pages/medicine/consultar_medicamento.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';
import 'package:histovet/src/pages/pet/consultar_mascotas.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';
import 'package:histovet/src/pages/sale/add_sale.dart';
import 'package:histovet/src/pages/sale/sale_page.dart';
import 'package:provider/provider.dart';

import 'src/blocs/application_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ApplicationBloc())
        ],
        child: MaterialApp(
          title: 'HistoVet',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: SignIn.id,
          routes: {
            Home.id: (context) => const Home(),
            '/home': (context) => const Home(),

            PetsPage.id: (context) => const PetsPage(),
            '/pets': (context) => const PetsPage(),
            AddPet.id: (context) => const AddPet(),
            UpdatePet.id: (context) => const UpdatePet(""),


            AppointmentsPage.id: (context) => const AppointmentsPage(),
            '/appointments': (context) => const AppointmentsPage(),
            AddAppointment.id: (context) => const AddAppointment(),
            UpdateAppointment.id: (context) => const UpdateAppointment(""),


            ConsultarMedicamento.id: (context) => const ConsultarMedicamento(),
            SalesPage.id: (context) => const SalesPage(),
            '/sales': (context) => const SalesPage(),
            AddSale.id: (context) => const AddSale(),
            '/addsale': (context) => const AddSale(),
            '/updatepet': (context) => const UpdatePet(""),
            MedicinePage.id: (context) => const MedicinePage(),
            '/medicine': (context) => const MedicinePage(),
            AddMedicine.id: (context) => const AddMedicine(),
            HistoryPage.id: (context) => const HistoryPage(),
            '/clinicalHistories': (context) => const HistoryPage(),
            AddClinicalHistory.id: (context) => const AddClinicalHistory(),
            '/addHistory': (context) => const AddClinicalHistory(),
            ConsultarHistories.id: (context) => const ConsultarHistories(),
            '/searchistories': (context) => const ConsultarHistories(),
            SignIn.id: (context) => const SignIn(),
            '/signin': (context) => const SignIn(),
            SignUp.id: (context) => const SignUp(),
            '/signup': (context) => const SignUp(),
            ResetPassword.id: (context) => const ResetPassword(),
            '/reset-password': (context) => const ResetPassword(),
            GpsPage.id: (context) => const GpsPage(),
            '/gps_page': (context) => const GpsPage(),
            ConsultarMascota.id: (context) => const ConsultarMascota(),
            '/buscarMascota': (context) => const ConsultarMascota(),
            HistoryPetSelectPage.id: (context) =>
                const HistoryPetSelectPage(""),
          },
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return FutureBuilder(
//         future: Firebase.initializeApp(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return const MaterialApp();
//           }
//           return const SizedBox();
//         });
//   }
// }
