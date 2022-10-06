import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:histovet/src/services/appointment_service.dart';
import '../models/appointment.dart';

// Clase encargada de comunicar las vistas con los servicios de medicina
class AppointmentController {
  final AppointmentService _service = AppointmentService();

  List<Appointment> appointments = [];

  // Permite usar el servicio para agregar medicina a la base de datos
  // Retorna true si la medicina se agregó correctamente
  Future<bool> addAppointment(Appointment appointment) async {
    bool respuesta;
    respuesta = await _service.addAppointment(appointment);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para buscar una  medicina por su nombre en la base de datos
  // Retorna las medicinas que se encuentren
  Future<List<Appointment>> searchAppointment(String name) async {
    List<Appointment> appointments = [];
    try {
      final collection = FirebaseFirestore.instance
          .collection('appointment')
          .where("code", isEqualTo: name);
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          Appointment newAppointment = Appointment(
              data["id"],
              data["code"],
              data["ownerName"],
              data["petName"],
              data["email"],
              data["phone"],
              data["reason"],
              data["fecha"]);
          appointments.add(newAppointment);
        }
      });
      return appointments;
    } catch (e) {
      return appointments;
    }
  }

  // Permite usar el servicio para actualizar un registro de medicina de la base de datos
  // Retorna true si la medicina se actualizó correctamente
  Future<bool> updateAppointment(Appointment appointment) async {
    bool respuesta;
    respuesta = await _service.updateAppointment(appointment);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para eliminar un registro de medicina de la base de datos
  // Retorna true si la medicina se eliminó correctamente
  Future<bool> deleteAppointment(String idAppointment) async {
    bool respuesta;
    respuesta = await _service.deleteAppointmentFromFirebase(idAppointment);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para obtener todos los registros de medicina de la base de datos
  // Retorna una lista con todas las medicinas que se encuentren
  Future<List<Appointment>> allAppointments() async {
    appointments = await _service.getAppointments();
    return appointments;
  }

  // Permite usar el servicio para obtener la medicina usando el id en la base de datos
  // Retorna la medicina que encontró, o null si no la encuentra
  Future<Appointment> getAppointment(String id) async {
    Appointment appointment = await _service.getAppointment(id);
    return appointment;
  }
}
