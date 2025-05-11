import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationTap extends StatefulWidget {
  @override
  State<LocationTap> createState() => _LocationTapState();
}

class _LocationTapState extends State<LocationTap> {
  LatLng? selectedLatLng;
  String? placeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(30.04089385557787, 31.233543621232716),
              zoom: 14,
            ),
            onTap: (latLng) async {
              setState(() {
                selectedLatLng = latLng;
              });

              List<Placemark> placemarks = await placemarkFromCoordinates(
                latLng.latitude,
                latLng.longitude,
              );
              if (placemarks.isNotEmpty) {
                Placemark place = placemarks.first;
                placeName = "${place.street}, ${place.locality}";
              }
            },
            markers:
                selectedLatLng != null
                    ? {
                      Marker(
                        markerId: MarkerId('selected'),
                        position: selectedLatLng!,
                      ),
                    }
                    : {},
          ),
          if (selectedLatLng != null && placeName != null)
            Positioned(
              bottom: 80,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'lat': selectedLatLng!.latitude,
                    'lon': selectedLatLng!.longitude,
                    'place': placeName!,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLight,
                ),
                child: Text(
                  AppLocalizations.of(context)!.choose_event_location,
                  style: AppStyles.medium16White,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
