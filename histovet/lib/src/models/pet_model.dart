// Clase encargada del modelo de mascota

class Pet {
  final String? id;
  final String? owner;
  final String name;
  final int age;
  final String breed;
  final String specie;
  final String color;
  final String gender;
  final String birthday;
  final String neutering;
  final String clinic;

  Pet(
      this.id,
      this.owner,
      this.birthday,
      this.name,
      this.neutering,
      this.age,
      this.breed,
      this.specie,
      this.color,
      this.gender,
      this.clinic);
}
