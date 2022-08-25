// Clase encargada del modelo de ventas

class Sale {
  final String? id;
  final String code;
  final String name;
  final String formaPago;
  final double precio;
  final double cantidad;
  final double total;

  Sale(this.id, this.code, this.name, this.formaPago, this.precio,
      this.cantidad, this.total);
}
