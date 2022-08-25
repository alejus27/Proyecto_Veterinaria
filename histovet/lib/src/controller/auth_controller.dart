import 'package:histovet/src/services/auth_service.dart';

// Clase encargada de comunicar las vistas con los servicios de autenticación
class AuthController {
  final AuthService _auth = AuthService();

  // Permite usar el servicio de inicio de sesión de la aplicación
  // Retorna true si se pudo iniciar sesión con la información recibida
  Future<bool> signIn(String email, String password) async {
    bool answer = await _auth.signIn(email, password);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio de registro de la aplicación
  // Retorna true si se pudo registrar con la información recibida
  Future<bool> signUp(String email, String password) async {
    bool answer = await _auth.createAccount(email, password);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio de recuperación de contraseña de la aplicación
  // Retorna la aplicación si se pudo recuperar la contraseña con la información recibida
  Future<bool> resetPassword(String email) async {
    bool answer = await _auth.resetPassword(email);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio de cierre de sesión de la aplicación
  // Retorna si se pudo cerrar la sesión
  Future<bool> signOut() async {
    bool answer = await _auth.signOut();
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para obtener el correo del usuario que está en sesión
  //en la aplicación
  // Retorna el corrreo del username del usuario
  Future<String> username() async {
    String username = await _auth.username();
    if (username != "") {
      return username;
    } else {
      return "";
    }
  }

  // Permite usar el servicio para identificar el tipo de usuario
  // Retorna true si el usuario es administrador o false si no es administrador
  Future<bool> estado() async {
    bool estado = await _auth.estado();
    if (estado) {
      return true;
    } else {
      return false;
    }
  }
}
