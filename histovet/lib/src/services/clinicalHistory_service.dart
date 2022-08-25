import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_database/firebase_database.dart';

import '../models/clinicalhistory_model.dart';

// Clase encargada de realizar las operaciones con historias clínicas en la base de datos de Firebase
class ClinicalHistoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  // Permite obtener una historia clinica de la base de datos de Firebase
  // Retorna la historia clinica que se la haya especificado
  Future<ClinicalHistory> getClinicalHistory(String id) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('clinicalHistory')
        .doc(id)
        .get();
    ClinicalHistory clinicalHistory = ClinicalHistory(
        snapshot["id"],
        snapshot["numberCH"],
        snapshot["date"],
        snapshot["time"],
        snapshot["docOwner"],
        snapshot["nameOwner"],
        snapshot["contactOwner"],
        snapshot["addressOwner"],
        snapshot["emailAddressOwner"],
        snapshot["name"],
        snapshot["specie"],
        snapshot["breed"],
        snapshot["sex"],
        snapshot["color"],
        snapshot["weight"],
        snapshot["origin"],
        snapshot["diet"],
        snapshot["previousIllnesses"],
        snapshot["previousSurgeries"],
        snapshot["sterilized"],
        snapshot["nAnimalBirths"],
        snapshot["vaccinationSchedule"],
        snapshot["lastDeworming"],
        snapshot["recentTreatments"],
        snapshot["animalBehavior"],
        snapshot["reasonForConsultation"],
        snapshot["physicalCondition"],
        snapshot["temperature"],
        snapshot["heartFrequency"],
        snapshot["respiratoryFrequency"],
        snapshot["tllc"],
        snapshot["pulse"],
        snapshot["trcp"],
        snapshot["percentageDehydration"],
        snapshot["mucous"]);
    return clinicalHistory;
  }

  CollectionReference clinicalHistoryAll =
      FirebaseFirestore.instance.collection("clinicalHistory");

  // Permite agregar una historia clinicas a la base de datos de Firebase
  // Retorna true, si se pudo agregar la historia clinica a la base de datos
  Future<bool> addClinicalHistory(ClinicalHistory clinicalHistory) async {
    final DocumentReference clinicalHistoryDoc =
        _firestore.collection("clinicalHistory").doc();
    try {
      await clinicalHistoryDoc.set({
        "id": clinicalHistoryDoc.id,
        "numberCH": clinicalHistory.numberCH,
        "date": clinicalHistory.date,
        "time": clinicalHistory.time,
        "docOwner": clinicalHistory.docOwner,
        "nameOwner": clinicalHistory.nameOwner,
        "contactOwner": clinicalHistory.contactOwner,
        "addressOwner": clinicalHistory.addressOwner,
        "emailAddressOwner": clinicalHistory.emailAddressOwner,
        "name": clinicalHistory.name,
        "specie": clinicalHistory.specie,
        "breed": clinicalHistory.breed,
        "sex": clinicalHistory.sex,
        "color": clinicalHistory.color,
        "weight": clinicalHistory.weight,
        "origin": clinicalHistory.origin,
        "diet": clinicalHistory.diet,
        "previousIllnesses": clinicalHistory.previousIllnesses,
        "previousSurgeries": clinicalHistory.previousSurgeries,
        "sterilized": clinicalHistory.sterilized,
        "nAnimalBirths": clinicalHistory.nAnimalBirths,
        "vaccinationSchedule": clinicalHistory.vaccinationSchedule,
        "lastDeworming": clinicalHistory.lastDeworming,
        "recentTreatments": clinicalHistory.recentTreatments,
        "animalBehavior": clinicalHistory.animalBehavior,
        "reasonForConsultation": clinicalHistory.reasonForConsultation,
        "physicalCondition": clinicalHistory.physicalCondition,
        "temperature": clinicalHistory.temperature,
        "heartFrequency": clinicalHistory.heartFrequency,
        "respiratoryFrequency": clinicalHistory.respiratoryFrequency,
        "tllc": clinicalHistory.tllc,
        "pulse": clinicalHistory.pulse,
        "trcp": clinicalHistory.trcp,
        "percentageDehydration": clinicalHistory.percentageDehydration,
        "mucous": clinicalHistory.mucous
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite actualizar una historia clinica en la base de datos de Firebase
  // Retorna true, si se pudo actualizar la historia clinica en la base de datos
  Future<bool> updateClinicalHistory(ClinicalHistory ch) async {
    try {
      await FirebaseFirestore.instance
          .collection("clinicalHistory")
          .doc(ch.id)
          .set({
        "id": ch.id,
        "numberCH": ch.numberCH,
        "date": ch.date,
        "time": ch.time,
        "docOwner": ch.docOwner,
        "nameOwner": ch.nameOwner,
        "contactOwner": ch.contactOwner,
        "addressOwner": ch.addressOwner,
        "emailAddressOwner": ch.emailAddressOwner,
        "name": ch.name,
        "specie": ch.specie,
        "breed": ch.breed,
        "sex": ch.sex,
        "color": ch.color,
        "weight": ch.weight,
        "origin": ch.origin,
        "diet": ch.diet,
        "previousIllnesses": ch.previousIllnesses,
        "previousSurgeries": ch.previousSurgeries,
        "sterilized": ch.sterilized,
        "nAnimalBirths": ch.nAnimalBirths,
        "vaccinationSchedule": ch.vaccinationSchedule,
        "lastDeworming": ch.lastDeworming,
        "recentTreatments": ch.recentTreatments,
        "animalBehavior": ch.animalBehavior,
        "reasonForConsultation": ch.reasonForConsultation,
        "physicalCondition": ch.physicalCondition,
        "temperature": ch.temperature,
        "heartFrequency": ch.heartFrequency,
        "respiratoryFrequency": ch.respiratoryFrequency,
        "tllc": ch.tllc,
        "pulse": ch.pulse,
        "trcp": ch.trcp,
        "percentageDehydration": ch.percentageDehydration,
        "mucous": ch.mucous
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite eliminar una historia clinica indicada de la base de datos de Firebase
  // Retorna true, si se pudo eliminar la historia clinica de la base de datos
  Future<bool> deleteHistoryBD(id) async {
    try {
      await _firestore.collection("clinicalHistory").doc(id).delete();
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
          FirebaseFirestore.instance.collection('clinicalHistory');

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          //print(doc.data());
          ClinicalHistory newCinicalHistory = ClinicalHistory(
              data["id"],
              data["numberCH"],
              data["date"],
              data["time"],
              data["docOwner"],
              data["nameOwner"],
              data["contactOwner"],
              data["addressOwner"],
              data["emailAddressOwner"],
              data["name"],
              data["specie"],
              data["breed"],
              data["sex"],
              data["color"],
              data["weight"],
              data["origin"],
              data["diet"],
              data["previousIllnesses"],
              data["previousSurgeries"],
              data["sterilized"],
              data["nAnimalBirths"],
              data["vaccinationSchedule"],
              data["lastDeworming"],
              data["recentTreatments"],
              data["animalBehavior"],
              data["reasonForConsultation"],
              data["physicalCondition"],
              data["temperature"],
              data["heartFrequency"],
              data["respiratoryFrequency"],
              data["tllc"],
              data["pulse"],
              data["trcp"],
              data["percentageDehydration"],
              data["mucous"]);
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
  Future<List<ClinicalHistory>> searchHistories(String name) async {
    List<ClinicalHistory> histories = [];
    try {
      final collection = FirebaseFirestore.instance
          .collection('clinicalHistory')
          .where("name", isEqualTo: name);
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          ClinicalHistory newMedicine = ClinicalHistory(
              data["id"],
              data["numberCH"],
              data["date"],
              data["time"],
              data["docOwner"],
              data["nameOwner"],
              data["contactOwner"],
              data["addressOwner"],
              data["emailAddressOwner"],
              data["name"],
              data["specie"],
              data["breed"],
              data["sex"],
              data["color"],
              data["weight"],
              data["origin"],
              data["diet"],
              data["previousIllnesses"],
              data["previousSurgeries"],
              data["sterilized"],
              data["nAnimalBirths"],
              data["vaccinationSchedule"],
              data["lastDeworming"],
              data["recentTreatments"],
              data["animalBehavior"],
              data["reasonForConsultation"],
              data["physicalCondition"],
              data["temperature"],
              data["heartFrequency"],
              data["respiratoryFrequency"],
              data["tllc"],
              data["pulse"],
              data["trcp"],
              data["percentageDehydration"],
              data["mucous"]);
          histories.add(newMedicine);
        }
      });
      return histories;
    } catch (e) {
      return histories;
    }
  }
}
