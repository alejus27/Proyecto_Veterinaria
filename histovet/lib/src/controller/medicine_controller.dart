import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/medicine_model.dart';
import '../services/medicine_service.dart';

// Clase encargada de comunicar las vistas con los servicios de medicina
class MedicineController {
  final MedicineService _service = MedicineService();
  List<Medicine> medicines = [];

  // Permite usar el servicio para agregar medicina a la base de datos
  // Retorna true si la medicina se agregó correctamente
  Future<bool> addMedicine(Medicine medicine) async {
    bool respuesta;
    respuesta = await _service.addMedicine(medicine);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para buscar una  medicina por su nombre en la base de datos
  // Retorna las medicinas que se encuentren
  Future<List<Medicine>> searchMedicine(String name) async {
    List<Medicine> medicines = [];
    try {
      final collection = FirebaseFirestore.instance
          .collection('medicine')
          .where("name", isEqualTo: name);
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          Medicine newMedicine = Medicine(
              data["id"],
              data["code"],
              data["name"],
              data["description"],
              data["group"],
              data["precio"],
              data["fechaVen"]);
          medicines.add(newMedicine);
        }
      });
      return medicines;
    } catch (e) {
      return medicines;
    }
  }

  // Permite usar el servicio para actualizar un registro de medicina de la base de datos
  // Retorna true si la medicina se actualizó correctamente
  Future<bool> updateMedicine(Medicine medicine) async {
    bool respuesta;
    respuesta = await _service.updateMedicine(medicine);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para eliminar un registro de medicina de la base de datos
  // Retorna true si la medicina se eliminó correctamente
  Future<bool> deleteMedicine(String idMedicine) async {
    bool respuesta;
    respuesta = await _service.deleteMedicineFromFirebase(idMedicine);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para obtener todos los registros de medicina de la base de datos
  // Retorna una lista con todas las medicinas que se encuentren
  Future<List<Medicine>> allMedicines() async {
    medicines = await _service.getMedicines();
    return medicines;
  }

  // Permite usar el servicio para obtener la medicina usando el id en la base de datos
  // Retorna la medicina que encontró, o null si no la encuentra
  Future<Medicine> getMedicine(String id) async {
    Medicine medicine = await _service.getMedicine(id);
    return medicine;
  }
}
