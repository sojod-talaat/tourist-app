import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/providers/weather_provider.dart';
import 'package:weather_project/utils/Approuat.dart';

class MapLocationScreen extends StatefulWidget {
  MapLocationScreen({Key? key}) : super(key: key);

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, AppRouat.home);
          }),
          body: GoogleMap(
            onTap: (LatLng c) async {
              value.getdata(c.latitude, c.longitude);
              value.getdaily(c.latitude, c.longitude);
              Navigator.pushNamed(context, AppRouat.home);
            },
            mapType: MapType.hybrid,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
        ),
      ),
    );
  }
}
