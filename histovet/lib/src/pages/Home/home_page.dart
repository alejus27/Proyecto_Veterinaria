import 'package:flutter/material.dart';

import '../widgets/menu_lateral.dart';
import 'griddashboard.dart';

class Home extends StatefulWidget {
  static String id = "home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// Clases encargadas de la vista del inicio de
// la aplicación
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        centerTitle: true,
      ),
      drawer: const MenuLateral(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("HistoVet",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "La historia médica de tu mascota a la mano",
                      style: TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topRight,
                  icon: Image.asset('assets/img/vet.png'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const GridDashboard()
        ],
      ),
    );
  }
}
