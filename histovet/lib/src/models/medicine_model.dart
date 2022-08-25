// Clase encargada del modelo de medicina
class Medicine {
  final String? id;
  final String code;
  final String name;
  final String descripcion;
  final String group;
  final double precio;
  final String fechaVen;

  Medicine(this.id, this.code, this.name, this.descripcion, this.group,
      this.precio, this.fechaVen);
}
