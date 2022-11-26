// Clase encargada del modelo de historia clínica

import 'package:cloud_firestore/cloud_firestore.dart';

class ClinicalHistory {
  final String? id;
  final String birth_number;
  final String clinic;
  final String consultation_reason;
  final String date;
  final String deworming;
  final String diet_type;
  final String digestive_system;
  final String nervous_system;
  final String observations;
  final String owner_name;
  final String paraclinical_tests;
  final String parasites_control;
  final String pet_id;
  final String pet_name;
  final String presumptive_diagnosis;
  final String previous_illnesses;
  final String previous_surgeries;
  final String previous_treatments;
  final String reproductive_status;
  final String respiratory_system;
  final String therapeutic_plan;
  final String vaccination;

  ClinicalHistory(
      this.id,
      this.birth_number,
      this.clinic,
      this.consultation_reason,
      this.date,
      this.deworming,
      this.diet_type,
      this.digestive_system,
      this.nervous_system,
      this.observations,
      this.owner_name,
      this.paraclinical_tests,
      this.parasites_control,
      this.pet_id,
      this.pet_name,
      this.presumptive_diagnosis,
      this.previous_illnesses,
      this.previous_surgeries,
      this.previous_treatments,
      this.reproductive_status,
      this.respiratory_system,
      this.therapeutic_plan,
      this.vaccination);
}
