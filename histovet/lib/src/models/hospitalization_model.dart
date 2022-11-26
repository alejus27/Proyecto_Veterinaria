// Clase encargada del modelo de historia clínica

import 'package:cloud_firestore/cloud_firestore.dart';

class Hospitalization {
  final String? id;
  final String apetite;
  final String cardiac;
  final String clinic;
  final String date;
  final String dehydration;
  final String description;
  final String fecal;
  final String medicine;
  final String medicine_frequency;
  final String medicine_quantity;
  final String medicine_via;
  final String mucous;
  final String owner_name;
  final String pet_id;
  final String pet_name;
  final String prognosis;
  final String pulse;
  final String remark;
  final String respiratory;
  final String temperature;
  final String tllc;
  final String urine;

  Hospitalization(
      this.id,
      this.apetite,
      this.cardiac,
      this.clinic,
      this.date,
      this.dehydration,
      this.description,
      this.fecal,
      this.medicine,
      this.medicine_frequency,
      this.medicine_quantity,
      this.medicine_via,
      this.mucous,
      this.owner_name,
      this.pet_id,
      this.pet_name,
      this.prognosis,
      this.pulse,
      this.remark,
      this.respiratory,
      this.temperature,
      this.tllc,
      this.urine);
}
