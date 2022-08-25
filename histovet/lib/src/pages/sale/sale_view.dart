import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../controller/sale_controller.dart';
import '../../models/sale_model.dart';

// Clases encargadas de la vista donde se muestra la información de la venta
class ViewSale extends StatefulWidget {
  static String id = "view_sale";
  final String idSale;

  const ViewSale(this.idSale, {Key? key}) : super(key: key);

  @override
  State<ViewSale> createState() => _ViewSale();
}

class _ViewSale extends State<ViewSale> {
  final _formState = GlobalKey<FormBuilderState>();
  SaleController saleContr = SaleController();

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController formaPagoController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Información Venta"),
      ),
      body: FormBuilder(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: _inputs()),
          )),
    );
  }

  //Cuadros de texto donde se muestra la información de la venta
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
              prefixIcon: Icon(Icons.code),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: nameController,
          enabled: false,
          name: "name",
          decoration: const InputDecoration(
              labelText: "Nombre",
              prefixIcon: Icon(Icons.medication),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: formaPagoController,
          enabled: false,
          name: "formaPago",
          decoration: const InputDecoration(
              labelText: "Forma de pago",
              prefixIcon: Icon(Icons.payment),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: precioController,
          enabled: false,
          name: "precio",
          decoration: const InputDecoration(
              labelText: "Precio",
              prefixIcon: Icon(Icons.price_change),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: cantidadController,
          enabled: false,
          name: "cantidad",
          decoration: const InputDecoration(
              labelText: "Cantidad",
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderTextField(
          controller: totalController,
          enabled: false,
          name: "total",
          decoration: const InputDecoration(
              labelText: "Total",
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal))),
        ),
      )
    ];
  }

  // Se ejecuta apenas se carga la vista
  @override
  void initState() {
    getInfoSale();
    super.initState();
  }

  /// Obtiene la información de la venta
  void getInfoSale() async {
    Sale sale = await saleContr.getSale(widget.idSale);
    setState(() {
      codeController.text = sale.code;
      nameController.text = sale.name;
      formaPagoController.text = sale.formaPago;
      precioController.text = sale.precio.toString();
      cantidadController.text = sale.cantidad.toString();
      totalController.text = sale.total.toString();
    });
  }
}
