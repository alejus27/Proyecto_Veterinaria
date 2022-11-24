import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/sale_controller.dart';
import 'package:histovet/src/models/sale_model.dart';
import 'package:histovet/src/pages/sale/sale_view.dart';
import 'package:histovet/src/pages/widgets/menu_lateral.dart';

// Clases encargadas de la vista donde se enlistan todas las ventas que existan en la
// base de datos
class SalesPage extends StatefulWidget {
  static String id = "sales_page";
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPAgeState();
}

class _SalesPAgeState extends State<SalesPage> {
  TextStyle txtStyle = const TextStyle(
      fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  SaleController saleController = SaleController();
  bool answer = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Compras"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          drawer: const MenuLateral(),
          body: FutureBuilder(
              future: saleController.allSales(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List sales = snapshot.data ?? [];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        for (Sale sale in sales)
                          Card(
                            margin: const EdgeInsets.all(6),
                            elevation: 6,
                            child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/img/medicament.jpg'),
                                      fit: BoxFit.cover,
                                      opacity: 0.4),
                                ),
                                child: ListTile(
                                  onLongPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSale(sale.id.toString())));
                                  },
                                  leading: const Icon(
                                    FontAwesomeIcons.circleDollarToSlot,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    sale.name,
                                    style: txtStyle,
                                  ),
                                  subtitle: Text(
                                    sale.total.toString(),
                                    style: txtStyle.copyWith(fontSize: 17),
                                  ),
                                )),
                          )
                      ],
                    ),
                  );
                } else {
                  return const Text('Empty data');
                }
              })),
    );
  }
}
