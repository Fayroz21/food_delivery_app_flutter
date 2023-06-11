import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_Text.dart';
import 'package:food_delivery_app/components/Custom_button.dart';
import 'package:food_delivery_app/screens/setlocation_screen/controller/setLocation_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants/otherConsts/other_consts.dart';

class GoogleMapSetScreen extends StatelessWidget {
  GoogleMapSetScreen({Key? key}) : super(key: key);

  SetLocationController locationController = Get.put(SetLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GetBuilder<SetLocationController>(
              init: SetLocationController(),
              builder: (controller) => Obx(
                () => GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: locationController.initialCameraPosition,
                    zoom: 14,
                  ),
                  markers: Set<Marker>.of(locationController.markers),
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController ctr) {
                    locationController.onMapCreated(ctr);
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0.w),
              padding: EdgeInsets.only(
                  top: 20.0.w, right: 10.0.w, left: 10.0.w, bottom: 10.0.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.w)),
              height: 181.h,
              width: 342.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Your Location',
                    color: Colors.grey,
                    size: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Image.asset('assets/images/Pin Logo.png'),
                        K.fixed10w,
                        CustomText(text: locationController.address.value),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      locationController.getLocation().then((value) async {
                        locationController.getAddressFromLatLang(value);

                        locationController.markers.add(Marker(
                            markerId: MarkerId('2'),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: InfoWindow(
                                title: locationController.address.value
                                    .toString())));

                        CameraPosition cameraPosition = CameraPosition(
                          target: LatLng(value.latitude, value.longitude),
                          zoom: 14,
                        );

                        locationController.update();
                        locationController.markers.refresh();

                        final GoogleMapController controller =
                            await locationController.controller!;
                        controller.animateCamera(
                            CameraUpdate.newCameraPosition(cameraPosition));
                      });
                    },
                    text: 'Set Location',
                    height: 57.h,
                    width: 322.w,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
