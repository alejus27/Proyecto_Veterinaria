import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/controller/appointment_controller.dart';
import 'package:histovet/src/models/appointment.dart';
import '../../controller/pet_controller.dart';
import '../../models/pet_model.dart';

// Clases encargadas de la vista que le permite al usuario
// actualizar los datos de la mascota
class UpdateAppointment extends StatefulWidget {
  static String id = "edit_appoint";
  final String idAppointment;

  const UpdateAppointment(this.idAppointment, {Key? key}) : super(key: key);

  @override
  State<UpdateAppointment> createState() => _UpdateAppointment();
}

class _UpdateAppointment extends State<UpdateAppointment> {
  final _formState = GlobalKey<FormBuilderState>();
  AppointmentController appointmentCont = AppointmentController();

  TextEditingController codeController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController petNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController fechaController = TextEditingController();


  bool respuesta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Editar Información Mascota"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoAppointmentAppointment();
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
                        hintText: "Ingrese el código de la cita médica",
                        prefixIcon: Icon(Icons.numbers),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderTextField(
                        name: "ownerName",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            labelText: "Nombre",
                            hintText:
                                "Ingrese el nombre del dueño de la mascota",
                            prefixIcon: Icon(Icons.pets),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        keyboardType: TextInputType.text,
                        maxLength: 10,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context,
                              errorText: "Valor requerido")
                        ]))),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderTextField(
                        name: "petName",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            labelText: "Nombre",
                            hintText: "Ingrese el nombre de la mascota",
                            prefixIcon: Icon(Icons.pets),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        keyboardType: TextInputType.text,
                        maxLength: 10,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context,
                              errorText: "Valor requerido")
                        ]))),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                    name: "email",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Correo electrónico",
                        hintText: "Ingrese el correo electrónico",
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
                    name: "phone",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "contacto",
                        hintText: "Ingrese el contacto",
                        prefixIcon: Icon(Icons.contact_phone_outlined),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.integer(context,
                          errorText: "No puede tener decimales"),
                      FormBuilderValidators.min(context, 1,
                          errorText: "Debe ser un número mayor que 0"),
                      FormBuilderValidators.minLength(context, 10,
                          errorText: "La longitud del número es de 10")
                    ]),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: FormBuilderTextField(
                        name: "reason",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            labelText: "Razón",
                            hintText: "Ingrese la razón de la cita médica",
                            prefixIcon: Icon(Icons.pets),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        keyboardType: TextInputType.text,
                        maxLength: 100,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context,
                              errorText: "Valor requerido")
                        ]))),
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
                              'Rango de fecha',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)))),
                )
              ]
            ),
          )),
    );
  }

  @override
  void initState() {
    getInfoAppointment();
    super.initState();
  }

  // Se encarga de obtener los datos que el usuario ingresó
  getInfoAppointmentAppointment() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final code = codeController.text;
      final ownerName = ownerNameController.text;
      final petName = petNameController.text;
      final email = emailController.text;
      final phone = int.parse(phoneController.text);
      final reason = reasonController.text;
      final fecha = fechaController.text;

      late Appointment appointment = Appointment(widget.idAppointment, code, ownerName, petName, email,
          phone, reason, fecha);
          
      messageUpdate(appointment);
    }
  }

  // Le indica al usuario si se pudo o no actualizar la información de la mascota
  void messageUpdate(Appointment pet) async {
    respuesta = await appointmentCont.updateAppointment(pet);
    if (respuesta) {
      Navigator.pushNamed(context, '/appointments').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se actualizó la informació"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se actualizó la información"),
        backgroundColor: Colors.green,
      ));
    }
  }

  /// Obtiene la información de la mascota a la cual se quiere
  /// cambiar su información

  void getInfoAppointment() async {
    Appointment appointment = await appointmentCont.getAppointment(widget.idAppointment);
    setState(() {
      codeController.text = appointment.code;
      ownerNameController.text = appointment.ownerName;
      petNameController.text = appointment.petName;
      emailController.text = appointment.email;
      reasonController.text = appointment.reason;
      fechaController.text = appointment.fecha;
      phoneController.text = appointment.phone.toString();


    });
  }
}
