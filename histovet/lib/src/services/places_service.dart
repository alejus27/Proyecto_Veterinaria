import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import '../models/place.dart';
import '../models/place_search.dart';

class PlacesService {
  final key = 'AIzaSyCQdaPd6EyJuLoDMLGHX2vNLL18a8kdRH8';


  //Permite autocompletar la busqueda de lugares con predicciones --(no usado actualmente)--
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

   //Permite obtener la información de la ubicación actual, haciendo uso de la API key de google Maps
  Future<Place> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }
  //Permite obtener la información de lugares dada una latitud, longitud y tipo, haciendo uso de la API key de PLACES
  Future<List<Place>> getPlaces(
      double lat, double lng, String placeType) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
