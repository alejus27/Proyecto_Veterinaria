import 'package:histovet/src/models/sale_model.dart';
import 'package:histovet/src/services/sale_service.dart';

// Clase encargada de comunicar las vistas con los servicios de ventas
class SaleController {
  final SaleService _service = SaleService();
  List<Sale> sales = [];

  // Permite usar el servicio para agregar ventas a la base de datos
  // Retorna true si la ventas se agregó correctamente
  Future<bool> addSale(Sale sale) async {
    bool respuesta;
    respuesta = await _service.addSale(sale);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  // Permite usar el servicio para obtener todas las ventas de la base de datos
  // Retorna las ventas que se encuentren
  Future<List<Sale>> allSales() async {
    sales = await _service.getSales();
    return sales;
  }

  // Permite usar el servicio para obtener una venta por su id de la base de datos
  // Retorna la venta que se encontró o null si no se encontró
  Future<Sale> getSale(String id) async {
    Sale sale = await _service.getSaleBD(id);
    return sale;
  }
}
