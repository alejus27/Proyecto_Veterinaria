import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/appointment_controller.dart';
import '../../models/appointment.dart';
import '../../services/appointment_service.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registrar cita"),
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
                    name: "code",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Código",
                        hintText: "Ingrese el código de la cita",
                        prefixIcon: Icon(Icons.code),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.integer(context,
                          errorText: "No puede tener decimales"),
                      FormBuilderValidators.min(context, 1,
                          errorText: "Debe ser un número mayor que 0"),
                      FormBuilderValidators.minLength(context, 4,
                          errorText: "La longitud del documento es de 4")
                    ]),
                  ),
                ),
                Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "email",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      hintText: "Ingrese el correo electrónico del dueño de la mascota",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.email(context,
                        errorText: "Debe tener formato de correo")
                  ]),
                ),
              ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      name: "ownerName",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Nombre del dueño de la mascota",
                          hintText: "Ingrese el nombre del dueño de la mascota",
                          prefixIcon: Icon(Icons.people),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 20,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ])),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      name: "petName",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: "Nombre de la mascota",
                          hintText: "Ingrese el nombre de la mascota",
                          prefixIcon: Icon(Icons.pets_sharp),
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
                        hintText: "Ingrese el telefo de contacto del dueño de la mascota",
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
                  child: FormBuilderDateRangePicker(
                      keyboardType: TextInputType.datetime,
                      name: "fecha",
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2026),
                      //format: DateFormat('dd/MM/yyyy'),
                      initialEntryMode: DatePickerEntryMode.input,
                      enabled: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          labelText: 'Seleccione rango de fechas',
                          helperText:
                              'Rango de fecha en la que se puede usar la appointment',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)))),
                )
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
      final code = values['code'];
      final ownerName = values['ownerName'];
      final petName = values['petName'];
      final reason = values['reason'];
      final phone = int.parse(values['phone']);;
      final email = values['email'];
      var fechaAux = values['fecha'].toString();
      List<String> fechas = fechaAux.split("00:00:00.000");
      //print("fecha " + fechas[0]);
      final fecha = fechas[0] + fechas[1];


      late Appointment appointment = Appointment("", code, ownerName, petName, reason, phone, email,fecha);
      addAppointment(appointment);
    }
  }

  //Muestra un mensaje que le indica al usuario si se pudo crear la medicina
  void addAppointment(Appointment appointment) async {
    respuesta = await _service.addAppointment(appointment);
    if (respuesta) {
      Navigator.pushNamed(context, '/appointments').then((_) => setState(() {}));
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
}
