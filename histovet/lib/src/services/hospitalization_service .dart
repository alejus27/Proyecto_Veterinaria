import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:histovet/src/models/hospitalization_model.dart';

// Clase encargada de realizar las operaciones con historias clínicas en la base de datos de Firebase
class HospitalizationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  // Permite obtener una historia clinica de la base de datos de Firebase
  // Retorna la historia clinica que se la haya especificado
  Future<Hospitalization> getHospitalization(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final snapshot =
        await _firestore.collection('hospitalization').doc(id).get();

    Hospitalization hospitalization = Hospitalization(
      snapshot["id"],
      snapshot["owner_name"],
      snapshot["pet_name"],
      snapshot["pet_id"],
      snapshot["date"].toDate().toString(),
      snapshot["clinic"],
      snapshot["description"],
      snapshot["prognosis"],
      snapshot["cardiac"],
      snapshot["respiratory"],
      snapshot["pulse"],
      snapshot["temperature"],
      snapshot["mucous"],
      snapshot["tllc"],
      snapshot["dehydration"],
      snapshot["apetite"],
      snapshot["urine"],
      snapshot["fecal"],
      snapshot["medicine"],
      snapshot["medicine_quantity"],
      snapshot["medicine2"],
      snapshot["medicine_quantity2"],
      snapshot["medicine3"],
      snapshot["medicine_quantity3"],
      snapshot["remark"],
    );
    return hospitalization;
  }

  CollectionReference hospitalizationAll =
      FirebaseFirestore.instance.collection("hospitalization");

  // Permite eliminar una historia clinica indicada de la base de datos de Firebase
  // Retorna true, si se pudo eliminar la historia clinica de la base de datos
  Future<bool> deleteHospitalization(id) async {
    try {
      await _firestore.collection("hospitalization").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite obtener todas las historias clinicas de la base de datos de Firebase
  // Retorna una lista con las historias clinicas que haya encontrado
  Future<List<Hospitalization>> getHospitalizations() async {
    List<Hospitalization> clinicalHistories = [];

    try {
      final collection =
          FirebaseFirestore.instance.collection('hospitalization');

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          //print(doc.data());
          Hospitalization newCinicalHistory = Hospitalization(
            data["id"],
            data["owner_name"],
            data["pet_name"],
            data["pet_id"],
            data["date"].toDate().toString(),
            data["clinic"],
            data["description"],
            data["prognosis"],
            data["cardiac"],
            data["respiratory"],
            data["pulse"],
            data["temperature"],
            data["mucous"],
            data["tllc"],
            data["dehydration"],
            data["apetite"],
            data["urine"],
            data["fecal"],
            data["medicine"],
            data["medicine_quantity"],
            data["medicine2"],
            data["medicine_quantity2"],
            data["medicine3"],
            data["medicine_quantity3"],
            data["remark"],
          );
          clinicalHistories.add(newCinicalHistory);
        }
      });
      return clinicalHistories;
    } catch (e) {
      return clinicalHistories;
    }
  }

  // Permite obtener todas las historias clinicas que coincidan con el nombre recibido en Firebase
  // Retorna una lista con las historias clinicas que haya encontrado
  Future<List<Hospitalization>> searchHospitalizations(String id) async {
    List<Hospitalization> hospitalizations = [];

    try {
      var collection;
      collection = FirebaseFirestore.instance
          .collection('hospitalization')
          .where('pet_id', isEqualTo: id);

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          Hospitalization newMedicine = Hospitalization(
            data["id"],
            data["owner_name"],
            data["pet_name"],
            data["pet_id"],
            data["date"].toDate().toString(),
            data["clinic"],
            data["description"],
            data["prognosis"],
            data["cardiac"],
            data["respiratory"],
            data["pulse"],
            data["temperature"],
            data["mucous"],
            data["tllc"],
            data["dehydration"],
            data["apetite"],
            data["urine"],
            data["fecal"],
            data["medicine"],
            data["medicine_quantity"],
            data["medicine2"],
            data["medicine_quantity2"],
            data["medicine3"],
            data["medicine_quantity3"],
            data["remark"],
          );

          hospitalizations.add(newMedicine);
        }
      });
      return hospitalizations;
    } catch (e) {
      return hospitalizations;
    }
  }
}
