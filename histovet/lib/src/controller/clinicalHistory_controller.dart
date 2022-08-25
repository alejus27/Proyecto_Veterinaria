import '../models/clinicalhistory_model.dart';
import '../services/clinicalHistory_Service.dart';

// Clase encargada de comunicar las vistas con los servicios de historia clínica
class ClinicalHistoryController {
  final ClinicalHistoryService _service = ClinicalHistoryService();
  List<ClinicalHistory> clinicalHistories = [];

  // Permite usar el servicio para agregar historias clínicas a la base de datos
  // Retorna true si la historia clínica se agregó correctamente
  Future<bool> addClinicalHistory(ClinicalHistory clinicalHistory) async {
    bool respuesta;
    respuesta = await _service.addClinicalHistory(clinicalHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para actualizar un registro de historias clínicas de la base de datos
  // Retorna true si la historia clínica se actualizó correctamente
  Future<bool> updateClinicalHistory(ClinicalHistory clinicalHistory) async {
    bool respuesta;
    respuesta = await _service.updateClinicalHistory(clinicalHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para eliminar un registro historia clínica de la base de datos
  // Retorna true si la historia clínica se eliminó correctamente
  Future<bool> deleteHistory(String idHistory) async {
    bool respuesta;
    respuesta = await _service.deleteHistoryBD(idHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para obtener todas las historias clínicas de la base de datos
  // Retorna las historias clínicas que encuentre
  Future<List<ClinicalHistory>> allClinicalHistories() async {
    clinicalHistories = await _service.getClinicalHistories();
    return clinicalHistories;
  }

  // Permite usar el servicio para obtener una historias clínicas de la base de datos
  // Retorna la historia clínica que se encontró o null si no se encontró
  Future<ClinicalHistory> getClinicalHistory(String id) async {
    ClinicalHistory clinicalHistory = await _service.getClinicalHistory(id);
    return clinicalHistory;
  }

  // Permite usar el servicio para buscar la historias clínica usando el
  // nombre de la mascota
  // Retorna la historias clínica que se encuentren
  Future<List<ClinicalHistory>> searchHistories(String name) async {
    List<ClinicalHistory> histories = await _service.searchHistories(name);
    return histories;
  }
}
