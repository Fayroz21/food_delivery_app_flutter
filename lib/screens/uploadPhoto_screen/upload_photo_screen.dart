import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_backGround2.dart';
import 'package:food_delivery_app/components/Custom_container.dart';
import 'package:food_delivery_app/screens/uploadPhoto_screen/controller/upload_photo_controller.dart';
import 'package:get/get.dart';
import '../../components/Custom_Text.dart';
import '../../components/Custom_appBar.dart';
import '../../components/Custom_button.dart';
import '../../constants/otherConsts/other_consts.dart';

class UploadPhotoScreen extends StatelessWidget {
  UploadPhotoScreen({
    Key? key,
  }) : super(key: key);

  UploadPhotoController uploadController = Get.put(UploadPhotoController());

  @override
  Widget build(BuildContext context) {
    return CustomBackGround2(
        child: Column(
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
          text: 'Upload Your Photo Profile',
          fontWeight: FontWeight.bold,
          size: 25.sp,
        ),
        K.fixed10h,
        K.securityMess,
        SizedBox(
          height: 20.h,
        ),
        Obx(
          () => uploadController.selectedImagePath.value == ''
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: uploadController.imagePick.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        K.fixed10h,
                        CustomContainerImage(
                          height: 129.h,
                          width: 325.w,
                          child: uploadController.imagePick[index]['image'],
                          func: () {
                            ///To-do required functions
                            uploadController.getImage(
                                uploadController.imagePick[index]['source'],
                                context);
                          },
                        ),
                      ],
                    );
                  },
                )
              : Center(
                  child: Container(
                    width: 245.w,
                    height: 260.h,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22.w),
                          child: Image.file(
                            File(uploadController.selectedImagePath.value),
                            fit: BoxFit.fill,
                            width: 245.w,
                            height: 238.h,
                            alignment: Alignment.center,
                          ),
                        ),
                        Positioned(
                            top: 10.w,
                            right: 10.h,
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.5),
                              radius: 16.w,
                              child: GestureDetector(
                                onTap: () {
                                  uploadController.selectedImagePath.value = '';
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ))
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
            child: Obx(
              () => CustomButton(
                onPressed: () {
                  ///To-do: user have to fill all text fields to pass
                  ///Some other validation f exist
                  uploadController.saveTheImage(context);
                },
                text: uploadController.isLoading.value ? '...Loading' : 'Next',
                textSize: 16.sp,
              ),
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
    //               text: 'Upload Your Photo Profile',
    //               fontWeight: FontWeight.bold,
    //               size: 25.sp,
    //             ),
    //             K.fixed10h,
    //             K.securityMess,
    //             SizedBox(
    //               height: 20.h,
    //             ),
    //             Obx(
    //               () => uploadController.selectedImagePath.value == ''
    //                   ? ListView.builder(
    //                       shrinkWrap: true,
    //                       itemCount: uploadController.imagePick.length,
    //                       itemBuilder: (context, index) {
    //                         return Column(
    //                           children: [
    //                             K.fixed10h,
    //                             CustomContainerImage(
    //                               height: 129.h,
    //                               width: 325.w,
    //                               child: uploadController.imagePick[index]
    //                                   ['image'],
    //                               func: () {
    //                                 ///To-do required functions
    //                                 uploadController.getImage(
    //                                     uploadController.imagePick[index]
    //                                         ['source'],
    //                                     context);
    //                               },
    //                             ),
    //                           ],
    //                         );
    //                       },
    //                     )
    //                   : Center(
    //                       child: Container(
    //                         width: 245.w,
    //                         height: 260.h,
    //                         child: Stack(
    //                           children: [
    //                             ClipRRect(
    //                               borderRadius: BorderRadius.circular(22.w),
    //                               child: Image.file(
    //                                 File(uploadController
    //                                     .selectedImagePath.value),
    //                                 fit: BoxFit.fill,
    //                                 width: 245.w,
    //                                 height: 238.h,
    //                                 alignment: Alignment.center,
    //                               ),
    //                             ),
    //                             Positioned(
    //                                 top: 10.w,
    //                                 right: 10.h,
    //                                 child: CircleAvatar(
    //                                   backgroundColor: Colors.white.withOpacity(0.5),
    //                                   radius: 16.w,
    //                                   child: GestureDetector(
    //                                     onTap: (){
    //                                       uploadController.selectedImagePath.value = '';
    //                                     },
    //                                     child: const Icon(
    //                                       Icons.close,
    //                                       color: Colors.white,
    //                                     ),
    //                                   ),
    //                                 ))
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //             ),
    //             K.fixed10h,
    //             Expanded(
    //               child: Container(
    //                 padding: const EdgeInsets.only(bottom: 40).w,
    //                 alignment: Alignment.bottomCenter,
    //                 child: Obx(
    //                   () => CustomButton(
    //                     onPressed: () {
    //                       ///To-do: user have to fill all text fields to pass
    //                       ///Some other validation f exist
    //                       uploadController.saveTheImage(context);
    //                     },
    //                     text: uploadController.isLoading.value? '...Loading' : 'Next',
    //                     textSize: 16.sp,
    //                   ),
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
