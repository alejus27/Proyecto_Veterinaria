// Clase encargada del modelo
class Appointment {
  final String? id;
  final String ownerName;
  final String petName;
  final String reason;
  final String fecha;
  final String vet_name;
  final String doctor;
  final String time;

  Appointment(this.id, this.ownerName, this.petName, this.reason, this.fecha,
      this.vet_name, this.doctor, this.time);
}
