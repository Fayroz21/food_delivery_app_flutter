import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_backGround2.dart';
import 'package:food_delivery_app/components/Custom_container.dart';
import 'package:food_delivery_app/screens/PaymentMethod_screen/controller/paymentMethod_controller.dart';
import 'package:get/get.dart';
import '../../components/Custom_Text.dart';
import '../../components/Custom_appBar.dart';
import '../../components/Custom_button.dart';
import '../../constants/otherConsts/other_consts.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);

  PaymentMethodController payMethController =
      Get.put(PaymentMethodController());

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
            text: 'Payment Method',
            fontWeight: FontWeight.bold,
            size: 25.sp,
          ),
          K.fixed10h,
          K.securityMess,
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: payMethController.methods.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  K.fixed10h,
                  CustomContainerImage(
                    height: 74.h,
                    width: 355.w,
                    child: payMethController.methods[index]['image'],
                    func: () {
                      ///To-do:
                      ///Assign a variable with the value
                      payMethController.chosenMethod =
                      payMethController.methods[index]['method'];
                    },
                  )
                ],
              );
            },
          ),
          SizedBox(height: 30.h,),
          Obx(
                () =>  Container(
              alignment: Alignment.center,
              child: CustomText(
                text:
                payMethController.chosenMethod == 'chosen'? ' ' : payMethController.chosenMethod.toString(),
                size: 20.sp,
                color: Colors.indigo,
                align: true,
              ),
            ),
          ),
          K.fixed10h,
          Expanded(
            child: Obx(
                  () => Container(
                padding: const EdgeInsets.only(bottom: 40).w,
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: payMethController.isLoading.value? '...Loading' : 'Next',
                  onPressed: () {
                    ///To-do: user have to fill all text fields to pass
                    ///Some other validation f exist
                    payMethController.savePaymentMethod(context);
                  },
                  textSize: 16.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
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
    //               text: 'Payment Method',
    //               fontWeight: FontWeight.bold,
    //               size: 25.sp,
    //             ),
    //             K.fixed10h,
    //             K.securityMess,
    //             SizedBox(
    //               height: 20.h,
    //             ),
    //             ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: payMethController.methods.length,
    //               itemBuilder: (context, index) {
    //                 return Column(
    //                   children: [
    //                     K.fixed10h,
    //                     CustomContainerImage(
    //                       height: 74.h,
    //                       width: 355.w,
    //                       child: payMethController.methods[index]['image'],
    //                       func: () {
    //                         ///To-do:
    //                         ///Assign a variable with the value
    //                         payMethController.chosenMethod =
    //                             payMethController.methods[index]['method'];
    //                       },
    //                     )
    //                   ],
    //                 );
    //               },
    //             ),
    //             SizedBox(height: 30.h,),
    //             Obx(
    //               () =>  Container(
    //                 alignment: Alignment.center,
    //                 child: CustomText(
    //                     text:
    //                         payMethController.chosenMethod.value.toString().isNotEmpty ? payMethController.chosenMethod.value.toString() : '',
    //                     size: 20.sp,
    //                     color: Colors.indigo,
    //                     align: true,
    //                   ),
    //               ),
    //             ),
    //             K.fixed10h,
    //             Expanded(
    //               child: Obx(
    //                 () => Container(
    //                   padding: const EdgeInsets.only(bottom: 40).w,
    //                   alignment: Alignment.bottomCenter,
    //                   child: CustomButton(
    //                     text: payMethController.isLoading.value? '...Loading' : 'Next',
    //                     onPressed: () {
    //                       ///To-do: user have to fill all text fields to pass
    //                       ///Some other validation f exist
    //                       payMethController.savePaymentMethod(context);
    //                     },
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
