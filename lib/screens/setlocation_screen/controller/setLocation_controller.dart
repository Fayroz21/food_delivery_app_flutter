import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geocoding/geocoding.dart';
import 'package:food_delivery_app/screens/setlocation_screen/googleMapSet_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../components/Custom_snackBar.dart';
import '../../../constants/user_info/user_info_const.dart';
import '../../../services/firebase_services.dart';

class SetLocationController extends GetxController {

  //Define user location
  var latitude = 'Getting location'.obs;
  var longitude = 'Getting location'.obs;
  var address = 'Your Current Location'.obs;

  final isLoading = false.obs;
  Services services = Services();

  //Session map
  //camera position
  LatLng initialCameraPosition = const LatLng(20.5937, 78.9629);

  //Markers to display
  final RxList<Marker> markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.5937, 78.9629),
        infoWindow: InfoWindow(
          title: 'Place marker'
        )
    )
  ].obs;

  //Controller
  GoogleMapController? controller;

  //Function on create map
  onMapCreated(GoogleMapController ctr) {
    controller = ctr;
    update();
  }

  //Session map

  @override
  void onInit() {}

  getPermission() async{
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Get.to(() => GoogleMapSetScreen());
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}, ${place.country}';
    print(address.value);
    update();
  }

  saveLocation(context) async{
    isLoading.value = true;

    try{
      if(address.value != 'Your Current Location'){

        String uid = Services.currentFirebaseUser.value!.uid;

        //retrieve place to store data
        DatabaseReference userRef = services.store.ref().child('User');

        await userRef.child(uid).update({
          UserConst.location : address.value,
        });

        // Get.to(() => UploadPhotoScreen());

      }
    }on FirebaseException catch(e){
      CustomSnackBar.showSnackBar('${e.message}', context);
    }
    isLoading.value = false;
  }

}
