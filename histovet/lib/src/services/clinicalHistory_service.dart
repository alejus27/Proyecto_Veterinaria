import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

import '../models/clinicalHistory_model.dart';

// Clase encargada de realizar las operaciones con historias clínicas en la base de datos de Firebase
class ClinicalHistoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  // Permite obtener una historia clinica de la base de datos de Firebase
  // Retorna la historia clinica que se la haya especificado
  Future<ClinicalHistory> getClinicalHistory(String id) async {

     final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final snapshot = await _firestore.collection('clinical_history').doc(id).get();

    ClinicalHistory clinicalHistory = ClinicalHistory(
        snapshot["id"],
        snapshot["birth_number"],
        snapshot["clinic"],
        snapshot["consultation_reason"],
        snapshot["date"].toDate().toString(),
        snapshot["deworming"],
        snapshot["diet_type"],
        snapshot["digestive_system"],
        snapshot["nervous_system"],
        snapshot["observations"],
        snapshot["owner_name"],
        snapshot["paraclinical_tests"],
        snapshot["parasites_control"],
        snapshot["pet_id"],
        snapshot["pet_name"],
        snapshot["presumptive_diagnosis"],
        snapshot["previous_illnesses"],
        snapshot["previous_surgeries"],
        snapshot["previous_treatments"],
        snapshot["reproductive_status"],
        snapshot["respiratory_system"],
        snapshot["therapeutic_plan"],
        snapshot["vaccination"]);
    return clinicalHistory;
  }

  CollectionReference clinicalHistoryAll =
      FirebaseFirestore.instance.collection("clinical_history");

  // Permite eliminar una historia clinica indicada de la base de datos de Firebase
  // Retorna true, si se pudo eliminar la historia clinica de la base de datos
  Future<bool> deleteClinicalHistory(id) async {
    try {
      await _firestore.collection("clinical_history").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite obtener todas las historias clinicas de la base de datos de Firebase
  // Retorna una lista con las historias clinicas que haya encontrado
  Future<List<ClinicalHistory>> getClinicalHistories() async {
    List<ClinicalHistory> clinicalHistories = [];

    try {
      final collection =
          FirebaseFirestore.instance.collection('clinical_history');

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          //print(doc.data());
          ClinicalHistory newCinicalHistory = ClinicalHistory(
              data["id"],
              data["birth_number"],
              data["clinic"],
              data["consultation_reason"],
              data["date"].toDate().toString(),
              data["deworming"],
              data["diet_type"],
              data["digestive_system"],
              data["nervous_system"],
              data["observations"],
              data["owner_name"],
              data["paraclinical_tests"],
              data["parasites_control"],
              data["pet_id"],
              data["pet_name"],
              data["presumptive_diagnosis"],
              data["previous_illnesses"],
              data["previous_surgeries"],
              data["previous_treatments"],
              data["reproductive_status"],
              data["respiratory_system"],
              data["therapeutic_plan"],
              data["vaccination"]);
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
  Future<List<ClinicalHistory>> searchClinicalHistories(String id) async {
    List<ClinicalHistory> histories = [];

    try {
      var collection;
      collection = FirebaseFirestore.instance.collection('clinical_history').where('pet_id', isEqualTo: id);

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          ClinicalHistory newMedicine = ClinicalHistory(
              data["id"],
              data["birth_number"],
              data["clinic"],
              data["consultation_reason"],
              data["date"].toDate().toString(),
              data["deworming"],
              data["diet_type"],
              data["digestive_system"],
              data["nervous_system"],
              data["observations"],
              data["owner_name"],
              data["paraclinical_tests"],
              data["parasites_control"],
              data["pet_id"],
              data["pet_name"],
              data["presumptive_diagnosis"],
              data["previous_illnesses"],
              data["previous_surgeries"],
              data["previous_treatments"],
              data["reproductive_status"],
              data["respiratory_system"],
              data["therapeutic_plan"],
              data["vaccination"]);
              
          histories.add(newMedicine);
        }
      });
      return histories;
    } catch (e) {
      return histories;
    }
  }
}
