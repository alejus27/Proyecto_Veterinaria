import 'package:flutter/material.dart';
import 'package:histovet/src/pages/Login/reset_password.dart';
import 'package:histovet/src/pages/Login/signup_screen.dart';
import 'package:histovet/src/pages/Home/home_page.dart';

import '../../controller/auth_controller.dart';

// Clases encargadas de la vista que le permite al usuario
// iniciar sesión en la aplicación

class SignIn extends StatefulWidget {
  static String id = "signin";
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _showPassword = true;
  AuthController auth = AuthController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                const Text(
                  "HistoVet",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                _logoWidget(),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _emailTextController,
                  enableSuggestions: true,
                  autocorrect: false,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white70,
                    ),
                    labelText: "Ingrese correo",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordTextController,
                  obscureText: _showPassword,
                  enableSuggestions: false,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {
                          _showPassword = !_showPassword;
                          setState(() {});
                        },
                        icon: Icon(
                          _showPassword ? Icons.lock : Icons.lock_open,
                          color: Colors.white70,
                        )),
                    labelText: "Ingrese contraseña",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 5,
                ),
                _forgetPassword(context),
                _button(),
                _signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Muestra el logo de la aplicación
  Widget _logoWidget() {
    return Image.asset(
      "assets/img/vet.png",
      fit: BoxFit.cover,
      width: 210,
      height: 210,
    );
  }

  // Permite al usuario dirigirse a la sección para registrarse
  Widget _signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tiene cuenta?", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: const Text(
            " Registrarse",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  // botón que permite al usuario iniciar sesión en la aplicación y
  // dirigirse a la sección de inicio si todo sale bien
  Widget _button() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          _messageSign(_emailTextController.text, _passwordTextController.text);
        },
        child: const Text(
          "Iniciar sesión",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }

  // Permite dirigirse a la sección para recuperar la contraseña
  // de la cuenta
  Widget _forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Olvidó la contraseña?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ResetPassword())),
      ),
    );
  }

  // Muestra un mensaje indicandole al usuario que pudo iniciar sesión o
  // revisar los datos que ingresó, y si todo sale bien lo dirigirá al inicio de la aplicación
  void _messageSign(String correo, String password) async {
    if (correo.isEmpty && password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Ingrese correo y contraseña"),
        backgroundColor: Colors.red,
      ));
    } else if (correo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Ingrese correo"),
        backgroundColor: Colors.red,
      ));
    } else if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Ingrese contraseña"),
        backgroundColor: Colors.red,
      ));
    } else {
      bool answer = await auth.signIn(correo, password);
      if (answer) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Se inició sesión"),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Revise sus datos"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
