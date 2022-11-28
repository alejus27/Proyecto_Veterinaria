import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/medicine_model.dart';

import 'package:firebase_database/firebase_database.dart';

// Clase encargada de realizar las operaciones con medicina en la base de datos de Firebase
class MedicineService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  Medicine medicine = Medicine("", "", "", "", 0, "");

  // Permite obtener una medicina de la base de datos de Firebase
  // Retorna la medicina que se la haya especificado
  Future<Medicine> getMedicine(String id) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('medicine').doc(id).get();
    Medicine medicine = Medicine(
        snapshot["id"],
        snapshot["name"],
        snapshot["description"],
        snapshot["group"],
        snapshot["precio"],
        snapshot["fechaVen"].toString(),);
    //print(medicine.toString());
    return medicine;
  }

  // Permite obtener todas las medicinas que coincidan con el nombre recibido en Firebase
  // Retorna una lista con las medicinas que haya encontrado
  Future<List<Medicine>> searchMedicine(String name) async {
    List<Medicine> medicines = [];
    try {
      //final collection = FirebaseFirestore.instance.collection('medicine') .where("name", isEqualTo: name);

      final collection = FirebaseFirestore.instance.collection('medicine');

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          // print("encontró");
          // print(doc.data());
          Medicine newMedicine = Medicine(
              data["id"],
              data["name"],
              data["description"],
              data["group"],
              data["precio"],
              data["fechaVen"].toString(),);
          medicines.add(newMedicine);
        }
      });
      return medicines;
    } catch (e) {
      return medicines;
    }
  }

  CollectionReference medicineAll =
      FirebaseFirestore.instance.collection("medicine");

  // Permite agregar una medicina a la base de datos de Firebase
  // Retorna true, si se pudo agregar la medicina a la base de datos
  Future<bool> addMedicine(Medicine medicine) async {
    final DocumentReference medicineDoc =
        _firestore.collection("medicine").doc();

    try {
      await medicineDoc.set({
        "id": medicineDoc.id,
        "name": medicine.name,
        "description": medicine.description,
        "group": medicine.group,
        "precio": medicine.precio,
        "fechaVen": medicine.fechaVen
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite actualizar una medicina en la base de datos de Firebase
  // Retorna true, si se pudo actualizar la medicina en la base de datos
  Future<bool> updateMedicine(Medicine medicine) async {
    try {
      await FirebaseFirestore.instance
          .collection("medicine")
          .doc(medicine.id)
          .set({
        "id": medicine.id,
        "name": medicine.name,
        "description": medicine.description,
        "group": medicine.group,
        "precio": medicine.precio,
        "fechaVen": medicine.fechaVen
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite eliminar una medicina indicada de la base de datos de Firebase
  // Retorna true, si se pudo eliminar la medicina que se especifico de la base de datos
  Future<bool> deleteMedicineFromFirebase(id) async {
    try {
      await _firestore.collection("medicine").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite obtener todas las medicinas de la base de datos de Firebase
  // Retorna una lista con las medicinas que haya encontrado
  Future<List<Medicine>> getMedicines() async {
    List<Medicine> medicines = [];
    try {
      final collection = FirebaseFirestore.instance.collection('medicine');
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          //print(doc.data());
          Medicine newMedicine = Medicine(
              data["id"],
              data["name"],
              data["description"],
              data["group"],
              data["precio"],
              data["fechaVen"].toString(),);
          medicines.add(newMedicine);
        }
      });
      return medicines;
    } catch (e) {
      return medicines;
    }
  }
}
