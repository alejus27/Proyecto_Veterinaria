// Clase encargada del modelo
class Appointment {
  final String? id;
  final String code;
  final String ownerName;
  final String petName;
  final String email;
  final int phone;
  final String reason;
  final String fecha;

  Appointment(this.id, this.code, this.ownerName, this.petName, this.email,
      this.phone, this.reason, this.fecha);
}
