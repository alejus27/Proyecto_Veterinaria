// Clase encargada del modelo de historia clínica

class ClinicalHistory {
  final String? id;
  final int numberCH;
  final String date;
  final String time;
  final String docOwner;
  final String nameOwner;
  final String contactOwner;
  final String addressOwner;
  final String emailAddressOwner;
  final String name;
  final String specie;
  final String breed;
  final String sex;
  final String color;
  final double weight;
  final String origin;
  final String diet;
  final String previousIllnesses;
  final String previousSurgeries;
  final String sterilized;
  final String nAnimalBirths;
  final String vaccinationSchedule;
  final String lastDeworming;
  final String recentTreatments;
  final String animalBehavior;
  final String reasonForConsultation;
  final String physicalCondition;
  final double temperature;
  final double heartFrequency;
  final double respiratoryFrequency;
  final double tllc;
  final double pulse;
  final double trcp;
  final double percentageDehydration;
  final String mucous;

  ClinicalHistory(
      this.id,
      this.numberCH,
      this.date,
      this.time,
      this.docOwner,
      this.nameOwner,
      this.contactOwner,
      this.addressOwner,
      this.emailAddressOwner,
      this.name,
      this.specie,
      this.breed,
      this.sex,
      this.color,
      this.weight,
      this.origin,
      this.diet,
      this.previousSurgeries,
      this.previousIllnesses,
      this.sterilized,
      this.nAnimalBirths,
      this.vaccinationSchedule,
      this.lastDeworming,
      this.recentTreatments,
      this.animalBehavior,
      this.reasonForConsultation,
      this.physicalCondition,
      this.temperature,
      this.heartFrequency,
      this.respiratoryFrequency,
      this.tllc,
      this.pulse,
      this.trcp,
      this.percentageDehydration,
      this.mucous);
}
