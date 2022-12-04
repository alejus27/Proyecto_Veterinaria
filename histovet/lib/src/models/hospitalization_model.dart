// Clase encargada del modelo de historia clínica

import 'package:cloud_firestore/cloud_firestore.dart';

class Hospitalization {
  final String? id;
  final String owner_name;
  final String pet_name;
  final String pet_id;
  final String date;
  final String clinic;
  final String description;
  final String prognosis;
  final String cardiac;
  final String respiratory;
  final String pulse;
  final String temperature;
  final String mucous;
  final String tllc;
  final String dehydration;
  final String apetite;
  final String urine;
  final String fecal;
  final String medicine;
  final String medicine_quantity;
  final String medicine2;
  final String medicine_quantity2;
  final String medicine3;
  final String medicine_quantity3;
  final String remark;

  Hospitalization(
      this.id,
      this.owner_name,
      this.pet_name,
      this.pet_id,
      this.date,
      this.clinic,
      this.description,
      this.prognosis,
      this.cardiac,
      this.respiratory,
      this.pulse,
      this.temperature,
      this.mucous,
      this.tllc,
      this.dehydration,
      this.apetite,
      this.urine,
      this.fecal,
      this.medicine,
      this.medicine_quantity,
      this.medicine2,
      this.medicine_quantity2,
      this.medicine3,
      this.medicine_quantity3,
      this.remark);
}
