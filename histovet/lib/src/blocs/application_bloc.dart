import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:histovet/src/models/geometry.dart';
import 'package:histovet/src/models/location.dart';
import 'package:histovet/src/models/place.dart';
import 'package:histovet/src/models/place_search.dart';
import 'package:histovet/src/services/geolocator_service.dart';
import 'package:histovet/src/services/marker_service.dart';
import 'package:histovet/src/services/places_service.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();

  //Variables
  Position? currentLocation;
  List<PlaceSearch>? searchResults;
  StreamController<Place> selectedLocation =
      StreamController<Place>.broadcast();
  StreamController<LatLngBounds> bounds =
      StreamController<LatLngBounds>.broadcast();
  Place? selectedLocationStatic;
  String? placeType;
  List<Place>? placeResults;
  // ignore: deprecated_member_use, prefer_collection_literals
  List<Marker> markers = <Marker>[];

  ApplicationBloc() {
    setCurrentLocation();
  }
  //Localiza en el mapa la ubicación actual del usuario
  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    selectedLocationStatic = Place(
      name: '',
      geometry: Geometry(
        location: Location(
            lat: currentLocation!.latitude, lng: currentLocation!.longitude),
      ),
      vicinity: '',
    );
    notifyListeners();
  }
  //Busca en el mapa los lugares deseados según los parametros asignados
  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }
  //Asigna un lugar
  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(sLocation);
    selectedLocationStatic = sLocation;
    var _searchResults = null;
    searchResults = _searchResults;
    notifyListeners();
  }
  //Borra la asignación del lugar
  clearSelectedLocation() {
    var event = null;
    selectedLocation.add(event);
    selectedLocationStatic = null;
    searchResults = null;
    placeType = null;
    notifyListeners();
  }
//Permite desplegar los marcadores de las veterinarias más cercanas
  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
    } else {
      var _placeType = null;
      placeType = _placeType;
    }

    if (placeType != null) {
      var places = await placesService.getPlaces(
          selectedLocationStatic!.geometry!.location.lat,
          selectedLocationStatic!.geometry!.location.lng,
          placeType!);
      markers = [];
      if (places.isNotEmpty) {
        var newMarker = markerService.createMarkerFromPlace(places[0], false);
        markers.add(newMarker);
      }
      if (places.length > 1) {
        var newMarker = markerService.createMarkerFromPlace(places[1], false);
        markers.add(newMarker);
      }
      if (places.length > 2) {
        var newMarker = markerService.createMarkerFromPlace(places[2], false);
        markers.add(newMarker);
      }

      var locationMarker =
          markerService.createMarkerFromPlace(selectedLocationStatic!, true);
      markers.add(locationMarker);

      var _bounds = markerService.bounds(Set<Marker>.of(markers));
      bounds.add(_bounds!);

      notifyListeners();
    }
  }

  @override
  void dispose() {
    selectedLocation.close();
    bounds.close();
    super.dispose();
  }
}
