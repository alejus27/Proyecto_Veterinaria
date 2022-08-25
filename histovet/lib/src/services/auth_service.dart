import 'package:firebase_auth/firebase_auth.dart';

// Clase encargada de realizar las operaciones con la autenticación de Firebase
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Permite inciar sesión utilizando el servicio de autenticación de Firebase
  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Crea una cuenta con email y password utilizando el servicio de autenticación de Firebase
  // Retorna true si la cuenta fue creada con exito, false para error
  Future<bool> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Recupera la contraseña del correo que se recibe utilizando el servicio de autenticación de Firebase
  // Retorna true si los datos pertenecen a una cuenta existente y se pudo recuperar
  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  //Cierra la sesión actual utilizando el servicio de Firebase
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Retorna el correo del usuario que inició sesión
  Future<String> username() async {
    try {
      final User? user = _auth.currentUser;
      final name = user?.email;
      return name.toString();
    } catch (e) {
      return "";
    }
  }

  // Permite identificar si un usuario es administrador o no
  // Retorna true si el usuario es administrador o false si no es administrador
  Future<bool> estado() async {
    try {
      final administradores = [
        "5Q5W4CWh9KUSz0J6uSuCxuhxZAm2",
        "Kwiz2KFQYdTwDm1skFgxeBaF1LV2",
        "iPDk5F0wvYeYferaZoPcLaa6MwL2"
      ];
      final User? user = _auth.currentUser;
      final uid = user?.uid;
      bool admin = false;

      for (var element in administradores) {
        if (uid == element) {
          admin = true;
        }
      }

      return admin;
    } catch (e) {
      return false;
    }
  }
}
