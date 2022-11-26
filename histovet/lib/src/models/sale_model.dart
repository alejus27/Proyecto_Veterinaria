// Clase encargada del modelo de ventas

class Sale {
  final String? id;
  //final String code;
  final String? user_id;
  final String name;
  final String formaPago;
  final num precio;
  final num cantidad;
  final num total;

  Sale(this.id, this.user_id, this.name, this.formaPago, this.precio,
      this.cantidad, this.total);
}
