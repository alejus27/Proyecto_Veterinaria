import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';

import '../../blocs/application_bloc.dart';
import '../../models/place.dart';


// Clases encargadas de la vista donde se muestra el mapa través de Google Maps

class GpsPage extends StatefulWidget {
  static String id = "gps_page";

  const GpsPage({Key? key}) : super(key: key);

  @override
  State<GpsPage> createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  final Completer<GoogleMapController> _mapController = Completer();

  late StreamSubscription locationSubscription;
  late StreamSubscription boundsSubscription;
  final _locationController = TextEditingController();

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    //Listen for selected Location
    locationSubscription =
        applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name!;
        _goToPlace(place);
      } else {
        _locationController.text = "";
      }
    });

    applicationBloc.bounds.stream.listen((bounds) async {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Mapa"),
        ),
        body: (applicationBloc.currentLocation == null)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 500.0,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  applicationBloc.currentLocation!.latitude,
                                  applicationBloc.currentLocation!.longitude),
                              zoom: 14,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _mapController.complete(controller);
                            },
                            markers: Set<Marker>.of(applicationBloc.markers),
                          ),
                        ),
                        if (applicationBloc.searchResults != null &&
                            applicationBloc.searchResults!.isNotEmpty)
                          Container(
                              height: 500.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.6),
                                  backgroundBlendMode: BlendMode.darken)),
                        if (applicationBloc.searchResults != null)
                          SizedBox(
                            height: 500.0,
                            child: ListView.builder(
                                itemCount:
                                    applicationBloc.searchResults!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      applicationBloc
                                          .searchResults![index].description,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    onTap: () {
                                      applicationBloc.setSelectedLocation(
                                          applicationBloc
                                              .searchResults![index].placeId);
                                    },
                                  );
                                }),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          'Encuentra las veterinarias más cercanas en tu ubicación',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8.0,
                        children: [
                          FilterChip(
                              label: const Text('BUSCAR'),
                              onSelected: (val) => applicationBloc
                                  .togglePlaceType('veterinary_care', val),
                              selected: applicationBloc.placeType ==
                                  'veterinary_care',
                              selectedColor: Colors.blue),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }

  //Le permite al usuario interactuar con el mapa

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry!.location.lat, place.geometry!.location.lng),
            zoom: 14.0),
      ),
    );
  }
}
