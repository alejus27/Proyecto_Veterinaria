import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/pet_model.dart';

// Clase encargada de realizar las operaciones con mascotas en la base de datos de Firebase
class PetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Permite obtener la mascota que tenga el id recibido de la base de datos de Firebase
  // Retorna la mascota que se la haya especificado
  Future<Pet> getPetBD(String id) async {
    final snapshot = await _firestore.collection('pet').doc(id).get();
    Pet pet = Pet(
        snapshot["id"],
        snapshot["user_id"],
        snapshot["code"],
        snapshot["name"],
        snapshot["nameOwner"],
        snapshot["contactOwner"],
        snapshot["documentOwner"],
        snapshot["age"],
        snapshot["breed"],
        snapshot["specie"],
        snapshot["color"],
        snapshot["sex"]);
    return pet;
  }

  // Permite agregar una mascota a la base de datos de Firebase
  // Retorna true, si se pudo agregar la mascota a la base de datos
  Future<bool> addPetBD(Pet pet) async {
    final DocumentReference petDoc = _firestore.collection("pet").doc();

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    try {
      await petDoc.set({
        "id": petDoc.id,
        "user_id": user?.uid,
        "code": pet.code,
        "name": pet.name,
        "nameOwner": pet.nameOwner,
        "contactOwner": pet.contactOwner,
        "documentOwner": pet.documentOwner,
        "age": pet.age,
        "breed": pet.breed,
        "specie": pet.specie,
        "color": pet.color,
        "sex": pet.sex
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite obtener todas las mascotas que coincidan con el codigo recibido en Firebase
  // Retorna una lista con las mascotas que haya encontrado
  Future<List<Pet>> searchPet(String name) async {

    List<Pet> mascotas = [];
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;

    try {
      final collection =_firestore.collection('pet').where("name", isEqualTo: name).where('user_id', isEqualTo: uid);


      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          Pet newMedicine = Pet(
              data["id"],
              data["user_id"],
              data["code"],
              data["name"],
              data["nameOwner"],
              data["contactOwner"],
              data["documentOwner"],
              data["age"],
              data["breed"],
              data["specie"],
              data["color"],
              data["sex"]);
          mascotas.add(newMedicine);
        }
      });
      return mascotas;
    } catch (e) {
      return mascotas;
    }
  }

  // Permite actualizar una mascota en la base de datos de Firebase
  // Retorna true, si se pudo actualizar la mascota en la base de datos
  Future<bool> updatePetBD(Pet pet) async {
    try {
      await _firestore.collection("pet").doc(pet.id).set({
        "id": pet.id,
        "user_id": pet.user_id,
        "code": pet.code,
        "name": pet.name,
        "nameOwner": pet.nameOwner,
        "contactOwner": pet.contactOwner,
        "documentOwner": pet.documentOwner,
        "age": pet.age,
        "breed": pet.breed,
        "specie": pet.specie,
        "color": pet.color,
        "sex": pet.sex
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite eliminar una mascota indicada de la base de datos de Firebase
  // Retorna true, si se pudo eliminar la mascota de la base de datos
  Future<bool> deletePetBD(String id) async {
    try {
      await _firestore.collection("pet").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite obtener todas las mascotas de la base de datos de de Firebase
  // Retorna una lista con las mascotas que haya encontrado
  Future<List<Pet>> getPetsBD() async {
    List<Pet> mascotas = [];

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;

    try {
      //final collection = _firestore.collection('pet');

      var collection;
      collection = FirebaseFirestore.instance.collection('pet').where('user_id', isEqualTo: uid);

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          Pet newPet = Pet(
              data["id"],
              data["user_id"],
              data["code"],
              data["name"],
              data["nameOwner"],
              data["contactOwner"],
              data["documentOwner"],
              data["age"],
              data["breed"],
              data["specie"],
              data["color"],
              data["sex"]);
          mascotas.add(newPet);
        }
      });
      return mascotas;
    } catch (e) {
      return mascotas;
    }
  }
}
