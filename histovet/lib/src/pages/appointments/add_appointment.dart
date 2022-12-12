import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/models/extra.dart';
import '../../controller/appointment_controller.dart';
import '../../models/appointment.dart';
import '../../services/appointment_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// Clases encargadas de la vista que le permite al usuario
// ingresar datos para agregar una medicina
class AddAppointment extends StatefulWidget {
  static String id = "form_appointment";
  const AddAppointment({Key? key}) : super(key: key);

  @override
  State<AddAppointment> createState() => _AddAppointment();
}

class _AddAppointment extends State<AddAppointment> {
  final AppointmentService _service = AppointmentService();
  final _formState = GlobalKey<FormBuilderState>();
  bool respuesta = false;
  String vet_name = "";
  String pet_name = "";
  String profile_vetName = "";
  String time = "";

  String nameDoctor_ = "";
  String name_ = "";

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Citas Médicas"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoAppointment();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      name: "reason",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Motivo de cita médica",
                          hintText: "Ingrese el motivo de cita médica",
                          prefixIcon: Icon(Icons.book_online),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 50,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ])),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                    name: "phone",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Telefono de contacto",
                        hintText: "Ingrese telefono de contacto",
                        prefixIcon: Icon(Icons.phone_android),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.numeric(context,
                          errorText: "Debe ser un numero"),
                      FormBuilderValidators.min(context, 1,
                          errorText: "Debe ser un número mayor que 0"),
                    ]),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderDateTimePicker(
                      inputType: InputType.date,
                      keyboardType: TextInputType.datetime,
                      name: "fecha",
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2026),
                      format: DateFormat('dd/MM/yyyy'),
                      initialEntryMode: DatePickerEntryMode.input,
                      enabled: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          labelText: 'Seleccione fecha',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)))),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('pets')
                        .where('owner', isEqualTo: _service.getId())
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return DropdownButton(
                        onChanged: (newValue) {
                          setState(() {
                            pet_name = newValue.toString();
                          });
                        },
                        hint: Text("Mascota: " + pet_name),
                        items: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
                            value: document['name'],
                            child: Text(document['name']),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('vet_list').get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return DropdownButton(
                        onChanged: (newValue) {
                          setState(() {
                            vet_name = newValue.toString();
                            profile_vetName = "";
                            time = "";
                          });
                        },
                        hint: Text("Clinica Veterinaria: " + vet_name),
                        items: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
                            value: document['name'],
                            child: Text(document['name']),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('profiles')
                        .where("clinic", isEqualTo: vet_name)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return DropdownButton(
                        onChanged: (newValue) {
                          setState(() {
                            getDoctorName(newValue);
                            profile_vetName = newValue.toString();
                            time = "";
                          });
                        },
                        hint: Text("Doctor: " + profile_vetName),
                        items: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
                            value: document['userId'],
                            child: Text(document['first_name']),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('attention_ schedule')
                        .where("doctor_id", isEqualTo: profile_vetName)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return DropdownButton(
                        onChanged: (newValue) {
                          setState(() {
                           
                            time = newValue.toString();
                          });
                        },
                        hint: Text("Horario: " + time),
                        items: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
                            value: document['time'],
                            child: Text(document['time']),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // Valida que todos los campos cumplan los formatos y obtiene la
  //información que ingresó el usuario
  getInfoAppointment() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;

      final reason = values['reason']; //values['reason'];
      final phone = int.parse(values['phone']);
      var fecha = values['fecha'].toString();

      late Appointment appointment = Appointment(
          "", name_, pet_name, reason, fecha, vet_name, nameDoctor_, time);

      addAppointment(appointment);
    }
  }

  //Muestra un mensaje que le indica al usuario si se pudo crear la medicina
  void addAppointment(Appointment appointment) async {
    respuesta = await _service.addAppointment(appointment);
    if (respuesta) {
      Navigator.pushNamed(context, '/appointments')
          .then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se guardó la información de la medicina"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se guardó la información de la medicina"),
        backgroundColor: Colors.green,
      ));
    }
  }

  getName() {
    final uid = _service.getId();

    try {
      var collection = FirebaseFirestore.instance
          .collection('profiles')
          .where("userId", isEqualTo: uid);

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          name_ = (data["first_name"]);
        }
      });
    } catch (e) {}
  }

  getDoctorName(id) {
    try {
      var collection = FirebaseFirestore.instance
          .collection('profiles')
          .where("userId", isEqualTo: id);

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          nameDoctor_ = (data["first_name"]);
        }
      });
    } catch (e) {}
  }
}
