import 'package:flutter/material.dart';
import 'package:histovet/src/controller/auth_controller.dart';
import 'package:histovet/src/pages/Login/signin_screen.dart';

// Clases encargadas de la vista que le permite al usuario
// registrarse en la aplicación
class SignUp extends StatefulWidget {
  static String id = "signup";
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthController auth = AuthController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
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
                  enableSuggestions: true,
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
                  height: 20,
                ),
                _button()
              ],
            ),
          ))),
    );
  }

  // Botón que permite al usuario registrarse en la aplicación
  Widget _button() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          _messageSignUP(
              _emailTextController.text, _passwordTextController.text);
        },
        child: const Text(
          "Crear cuenta",
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

  // Muestra un mensaje indicandole al usuario que pudo iniciar sesión o
  // revisar los datos que ingresó, y si todo sale bien lo dirigirá al login de la aplicación
  void _messageSignUP(String correo, String password) async {
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
      bool answer = await auth.signUp(correo, password);
      if (answer) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignIn()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Se creo la cuenta con éxito"),
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
