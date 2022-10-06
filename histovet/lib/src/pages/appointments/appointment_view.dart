import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../controller/appointment_controller.dart';
import '../../models/appointment.dart';


// Clases encargadas de la vista donde se muestra la información de la mascota

class ViewAppointment extends StatefulWidget {
  static String id = "view_appointment";
  final String idAppointment;

  const ViewAppointment(this.idAppointment, {Key? key}) : super(key: key);

  @override
  State<ViewAppointment> createState() => _ViewAppointment();
}

class _ViewAppointment extends State<ViewAppointment> {
  final _formState = GlobalKey<FormBuilderState>();
  AppointmentController appointmentCont = AppointmentController();

  TextEditingController codeController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController petNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Información Cita"),
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: _inputs()),
          )),
    );
  }

  List<Widget> _inputs() {
    return [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: codeController,
          enabled: false,
          name: "code",
          decoration: const InputDecoration(
              labelText: "Código",
              prefixIcon: Icon(Icons.abc_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: ownerNameController,
          enabled: false,
          name: "ownerName",
          decoration: const InputDecoration(
              labelText: "Nombre del dueño",
              prefixIcon: Icon(Icons.abc_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: petNameController,
          enabled: false,
          name: "petName",
          decoration: const InputDecoration(
              labelText: "Nombre Mascota",
              prefixIcon: Icon(Icons.abc_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: emailController,
          enabled: false,
          name: "email",
          decoration: const InputDecoration(
              labelText: "email",
              prefixIcon: Icon(Icons.abc_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: fechaController,
          enabled: false,
          name: "fecha",
          decoration: const InputDecoration(
              labelText: "Fecha",
              prefixIcon: Icon(Icons.abc_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: phoneController,
          enabled: false,
          name: "phone",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
              labelText: "Telefono",
              prefixIcon: Icon(Icons.abc_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: reasonController,
          enabled: false,
          name: "reason",
          decoration: const InputDecoration(
              labelText: "Razón",
              prefixIcon: Icon(Icons.abc_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      )
    ];
  }

  @override
  void initState() {
    getInfoAppointment();
    super.initState();
  }

  /// Obtiene la información de la mascota
  void getInfoAppointment() async {
    Appointment appointment = await appointmentCont.getAppointment(widget.idAppointment);
    setState(() {
      codeController.text = appointment.code;
      ownerNameController.text = appointment.ownerName;
      petNameController.text = appointment.petName;
      emailController.text = appointment.email;
      fechaController.text = appointment.fecha;
      phoneController.text = appointment.phone.toString();
      reasonController.text = appointment.reason;
    });
  }
}
