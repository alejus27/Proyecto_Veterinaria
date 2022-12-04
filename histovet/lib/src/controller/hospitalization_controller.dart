

import 'package:histovet/src/models/hospitalization_model.dart';
import 'package:histovet/src/services/hospitalization_service%20.dart';



// Clase encargada de comunicar las vistas con los servicios de historia clínica
class HospitalizationController {
  final HospitalizationService _service = HospitalizationService();
  List<Hospitalization> clinicalHistories = [];

  // Permite usar el servicio para eliminar un registro historia clínica de la base de datos
  // Retorna true si la historia clínica se eliminó correctamente
  Future<bool> deleteHistory(String idHistory) async {
    bool respuesta;
    respuesta = await _service.deleteHospitalization(idHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Hospitalization>> searchHospitalizations(String id) async {
    List<Hospitalization> histories = await _service.searchHospitalizations(id);
    return histories;
  }

   // Permite usar el servicio para obtener una historias clínicas de la base de datos
  // Retorna la historia clínica que se encontró o null si no se encontró
  Future<Hospitalization> getHospitalization(String id) async {
    Hospitalization clinicalHistory = await _service.getHospitalization(id);
    return clinicalHistory;
  }



  Future<List<Hospitalization>> allHospitalizations() async {
    clinicalHistories = await _service.getHospitalizations();
    return clinicalHistories;
  }

  
}
