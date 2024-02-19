import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:labaratoriska5_mis/google_maps.dart';
import 'lokacija_univerzitet.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Мапа'),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(41.9981, 21.4254),
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.labaratoriska5_mis',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  university.latitude,
                  university.longitude,
                ),
                width: 120,
                height: 120,
                child: GestureDetector(
                  onTap: () {

                    _showAlertDialog();
                  },
                  child: const Icon(Icons.pin_drop),
                ),
              )
            ],
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Отвори "google maps"?'),
          content: const Text('Дали ви е потребна апликацијата за пронаоѓање на рутата?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Откажи'),
            ),
            TextButton(
              onPressed: () {
                GoogleMaps.openGoogleMaps(
                    university.latitude,
                    university
                        .longitude);
                Navigator.of(context).pop();
              },
              child: const Text('Отвори'),
            ),
          ],
        );
      },
    );
  }
}
