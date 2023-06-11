import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_backGround2.dart';
import 'package:food_delivery_app/screens/setlocation_screen/controller/setLocation_controller.dart';
import 'package:get/get.dart';
import '../../components/Custom_Text.dart';
import '../../components/Custom_appBar.dart';
import '../../components/Custom_button.dart';
import '../../constants/otherConsts/other_consts.dart';
import 'googleMapSet_screen.dart';

class SetLocationScreen extends StatelessWidget {
  SetLocationScreen({Key? key}) : super(key: key);

  SetLocationController locationController = Get.put(SetLocationController());

  @override
  Widget build(BuildContext context) {
    return
        CustomBackGround2(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading messages
            CustomAppBar(
              func: () {
                Get.back();
              },
            ),
            K.fixed10h,
            CustomText(
              text: 'Set Your Location',
              fontWeight: FontWeight.bold,
              size: 25.sp,
            ),
            K.fixed10h,
            K.securityMess,
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 342.w,
              height: 147.h,
              child: Card(
                color: Colors.white,
                elevation: 30.0,
                shadowColor: K.shadowColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.w))
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0).w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.pin_drop_outlined, color: Colors.deepOrangeAccent,),
                          K.fixed10w,
                          CustomText(text: 'Your Location',
                            fontWeight: FontWeight.bold,
                            size: 15.sp,
                          ),
                        ],
                      ),
                      CustomButton(
                        onPressed: (){
                          print('I am fucking hereee');
                          locationController.getPermission();
                        },
                        color: const Color(0xFFF6F6F6),
                        width: 322.w,
                        height: 57.h,
                        text: 'Set Location',
                        textColor: K.textColor,
                        textSize: 14.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            K.fixed10h,
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 40).w,
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  onPressed: (){
                    ///To-do: user have to fill all text fields to pass
                    ///Some other validation f exist
                    locationController.saveLocation(context);
                  },
                  textSize: 16.sp,
                ),
              ),
            )
          ],
        ));
    //   Container(
    //   constraints: const BoxConstraints.expand(),
    //   decoration: const BoxDecoration(
    //     color: Colors.white,
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/secondPattern.png'),
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    //   child: SafeArea(
    //     child: Scaffold(
    //       backgroundColor: Colors.transparent,
    //       body: Padding(
    //         padding: const EdgeInsets.only(top: 20, left: 25, right: 25).w,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             //heading messages
    //             CustomAppBar(
    //               func: () {
    //                 Get.back();
    //               },
    //             ),
    //             K.fixed10h,
    //             CustomText(
    //               text: 'Set Your Location',
    //               fontWeight: FontWeight.bold,
    //               size: 25.sp,
    //             ),
    //             K.fixed10h,
    //             K.securityMess,
    //             SizedBox(
    //               height: 20.h,
    //             ),
    //             SizedBox(
    //               width: 342.w,
    //               height: 147.h,
    //               child: Card(
    //                 color: Colors.white,
    //                 elevation: 30.0,
    //                 shadowColor: K.shadowColor,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(22.w))
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.all(10.0).w,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           const Icon(Icons.pin_drop_outlined, color: Colors.deepOrangeAccent,),
    //                           K.fixed10w,
    //                           CustomText(text: 'Your Location',
    //                             fontWeight: FontWeight.bold,
    //                             size: 15.sp,
    //                           ),
    //                         ],
    //                       ),
    //                       CustomButton(
    //                           onPressed: (){
    //                             print('I am fucking hereee');
    //                             locationController.getPermission();
    //                           },
    //                         color: const Color(0xFFF6F6F6),
    //                         width: 322.w,
    //                         height: 57.h,
    //                         text: 'Set Location',
    //                         textColor: K.textColor,
    //                         textSize: 14.sp,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             K.fixed10h,
    //             Expanded(
    //               child: Container(
    //                 padding: const EdgeInsets.only(bottom: 40).w,
    //                 alignment: Alignment.bottomCenter,
    //                 child: CustomButton(
    //                   onPressed: (){
    //                     ///To-do: user have to fill all text fields to pass
    //                     ///Some other validation f exist
    //                     locationController.saveLocation(context);
    //                   },
    //                   textSize: 16.sp,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
