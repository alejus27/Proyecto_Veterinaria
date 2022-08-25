import 'package:flutter/material.dart';
import 'package:histovet/src/controller/auth_controller.dart';
import 'package:histovet/src/pages/Login/signin_screen.dart';

// Clases encargadas de la vista que le permite al usuario
// recuperar la contraseña de su cuenta
class ResetPassword extends StatefulWidget {
  static String id = "reset";
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthController _auth = AuthController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Recuperar Contraseña",
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
              children: <Widget>[
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
                      Icons.person_outline,
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
                _button()
              ],
            ),
          ))),
    );
  }

  // botón que le permite al usurio recuperar la contraseña de la cuenta
  Widget _button() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          _messageReset(_emailTextController.text);
        },
        child: const Text(
          "Recuperar contraseña",
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

  // Muestra un mensaje indicandole al usuario si debe revisar su correo o
  // revisar los datos que ingresó
  void _messageReset(String email) async {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Ingrese correo"),
        backgroundColor: Colors.red,
      ));
    } else {
      bool answer = await _auth.resetPassword(email);
      if (answer) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignIn()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Revise su correo"),
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
