
import 'package:histovet/src/services/clinicalHistory_service.dart';

import '../models/clinicalHistory_model.dart';

// Clase encargada de comunicar las vistas con los servicios de historia clínica
class ClinicalHistoryController {
  final ClinicalHistoryService _service = ClinicalHistoryService();
  List<ClinicalHistory> clinicalHistories = [];

  // Permite usar el servicio para eliminar un registro historia clínica de la base de datos
  // Retorna true si la historia clínica se eliminó correctamente
  Future<bool> deleteHistory(String idHistory) async {
    bool respuesta;
    respuesta = await _service.deleteClinicalHistory(idHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ClinicalHistory>> searchClinicalHistories(String id) async {
    List<ClinicalHistory> histories = await _service.searchClinicalHistories(id);
    return histories;
  }

   // Permite usar el servicio para obtener una historias clínicas de la base de datos
  // Retorna la historia clínica que se encontró o null si no se encontró
  Future<ClinicalHistory> getClinicalHistory(String id) async {
    ClinicalHistory clinicalHistory = await _service.getClinicalHistory(id);
    return clinicalHistory;
  }



  Future<List<ClinicalHistory>> allClinicalHistories() async {
    clinicalHistories = await _service.getClinicalHistories();
    return clinicalHistories;
  }

  
}
