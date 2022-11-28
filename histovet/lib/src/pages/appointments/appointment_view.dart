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

  TextEditingController ownerNameController = TextEditingController();
  TextEditingController petNameController = TextEditingController();

  TextEditingController fechaController = TextEditingController();

  TextEditingController reasonController = TextEditingController();
  TextEditingController vet_nameController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController timeController = TextEditingController();

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
          controller: ownerNameController,
          enabled: false,
          name: "ownerName",
          decoration: const InputDecoration(
              labelText: "Nombre del dueño",
              prefixIcon: Icon(Icons.document_scanner_sharp),
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
              prefixIcon: Icon(Icons.document_scanner_sharp),
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
              prefixIcon: Icon(Icons.document_scanner_sharp),
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
              labelText: "Motivo",
              prefixIcon: Icon(Icons.document_scanner_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: vet_nameController,
          enabled: false,
          name: "vet_name",
          decoration: const InputDecoration(
              labelText: "Nombre veterinaria",
              prefixIcon: Icon(Icons.document_scanner_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: doctorController,
          enabled: false,
          name: "doctor",
          decoration: const InputDecoration(
              labelText: "Doctor",
              prefixIcon: Icon(Icons.document_scanner_sharp),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: timeController,
          enabled: false,
          name: "time",
          decoration: const InputDecoration(
              labelText: "Hora de atención",
              prefixIcon: Icon(Icons.document_scanner_sharp),
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
    Appointment appointment =
        await appointmentCont.getAppointment(widget.idAppointment);
    setState(() {
      
      ownerNameController.text = appointment.ownerName;
      petNameController.text = appointment.petName;
      fechaController.text = appointment.fecha;
      reasonController.text = appointment.reason;

      vet_nameController.text = appointment.vet_name;
      doctorController.text = appointment.doctor;
      timeController.text = appointment.time;
    });
  }
}
