import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/sale_model.dart';

// Clase encargada de realizar las operaciones con ventas en la base de datos de Firebase
class SaleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  Sale sale = Sale("", "", "", "", 0.0, 0.0, 0.0);

  CollectionReference medicineAll =
      FirebaseFirestore.instance.collection("medicine");

  // Permite agregar una venta a la base de datos de Firebase
  // Retorna true, si se pudo agregar la venta a la base de datos
  Future<bool> addSale(Sale sale) async {
    final DocumentReference saleDoc = _firestore.collection("sale").doc();

    try {
      await saleDoc.set({
        "id": saleDoc.id,
        "code": sale.code,
        "name": sale.name,
        "formaPago": sale.formaPago,
        "precio": sale.precio,
        "cantidad": sale.cantidad,
        "total": sale.total
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // Permite obtener la venta que tenga el id recibido de la base de datos de Firebase
  // Retorna la venta que se la haya especificado
  Future<Sale> getSaleBD(String id) async {
    final snapshot = await _firestore.collection('sale').doc(id).get();
    Sale sale = Sale(
        snapshot["id"],
        snapshot["code"],
        snapshot["name"],
        snapshot["formaPago"],
        snapshot["precio"],
        snapshot["cantidad"],
        snapshot["total"]);
    return sale;
  }

  // Permite obtener todas las ventas de la base de datos de de Firebase
  // Retorna una lista con las ventas que haya encontrado
  Future<List<Sale>> getSales() async {
    List<Sale> sales = [];
    try {
      final collection = FirebaseFirestore.instance.collection('sale');
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          Sale newSale = Sale(
              data["id"],
              data["code"],
              data["name"],
              data["formaPago"],
              data["precio"],
              data["cantidad"],
              data["total"]);
          sales.add(newSale);
        }
      });
      return sales;
    } catch (e) {
      return sales;
    }
  }
}
