import '../models/pet_model.dart';
import '../services/pet_service.dart';

// Clase encargada de comunicar las vistas con los servicios de mascotas
class PetController {
  final PetService _service = PetService();
  List<Pet> _pets = [];

  // Permite usar el servicio para agregar mascotas a la base de datos
  // Retorna true si la mascota se agregó correctamente
  Future<bool> addPet(Pet pet) async {
    bool respuesta;
    respuesta = await _service.addPetBD(pet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para buscar una mascota por su código en la base de datos
  // Retorna las mascotas que se encuentren
  Future<List<Pet>> searchPet(String name) async {
    List<Pet> pets = await _service.searchPet(name);
    return pets;
  }

  //Permite usar el servicio para actualizar un registro de una mascota de la base de datos
  // Retorna true si la mascota se actualizó correctamente
  Future<bool> updatePet(Pet pet) async {
    bool respuesta;
    respuesta = await _service.updatePetBD(pet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para eliminar un registro de una mascota de la base de datos
  // Retorna true si la mascota se eliminó correctamente
  Future<bool> deletePet(String idPet) async {
    bool respuesta;
    respuesta = await _service.deletePetBD(idPet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para obtener todas las mascotas de la base de datos
  // Retorna las mascotas que se encuentren
  Future<List<Pet>> allPets() async {

    try{
      _pets = await _service.getPetsBD();
    return _pets;
    
    } catch (e) {
      return _pets;
    }
    
    
  }

  // Permite usar el servicio para obtener una mascota de la base de datos usando el id
  // Retorna la mascota que se encontró o null si no se encontró
  Future<Pet> getPet(String id) async {
    Pet pet = await _service.getPetBD(id);
    return pet;
  }
}
