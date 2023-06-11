import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_Text.dart';
import 'package:food_delivery_app/components/Custom_appBar.dart';
import 'package:food_delivery_app/components/Custom_backGround2.dart';
import 'package:food_delivery_app/components/Custom_button.dart';
import 'package:food_delivery_app/components/Custom_textField.dart';
import 'package:food_delivery_app/screens/Signup_process_screen/controller/process_controller.dart';
import 'package:get/get.dart';
import '../../constants/otherConsts/other_consts.dart';

class SignUpProcess extends StatelessWidget {
  SignUpProcess({Key? key}) : super(key: key);

  SignupProcessController signupProcessController =
      Get.put(SignupProcessController());

  @override
  Widget build(BuildContext context) {
    return CustomBackGround2(
      resizeToAvoidBottomInset: false,
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
            text: 'Fill in your bio to get started',
            fontWeight: FontWeight.bold,
            size: 25.sp,
          ),
          K.fixed10h,
          K.securityMess,
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
              hint: '  First Name',
              controller: signupProcessController.firstNameControl),
          K.fixed10h,
          CustomTextField(
              hint: '  Last Name',
              controller: signupProcessController.lastNameControl),
          K.fixed10h,
          CustomTextField(
            hint: '  Mobile Number',
            controller: signupProcessController.mobileControl,
            boardType: TextInputType.number,
          ),
          K.fixed10h,
          K.fixed10h,
          Expanded(
            child: Obx(
              () => Container(
                padding: const EdgeInsets.only(bottom: 40).w,
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  onPressed: () {
                    ///To-do: user have to fill all text fields to pass
                    ///Some other validation f exist
                    ///
                    /// Then:
                    signupProcessController.saveUserInfo(context);
                  },
                  text: signupProcessController.isLoading.value
                      ? '...Loading'
                      : 'Next',
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
    //       resizeToAvoidBottomInset: false,
    //       body: Padding(
    //           padding: const EdgeInsets.only(top: 20, left: 25, right: 25).w,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               //heading messages
    //               CustomAppBar(
    //                 func: () {
    //                   Get.back();
    //                 },
    //               ),
    //               K.fixed10h,
    //               CustomText(
    //                 text: 'Fill in your bio to get started',
    //                 fontWeight: FontWeight.bold,
    //                 size: 25.sp,
    //               ),
    //               K.fixed10h,
    //               K.securityMess,
    //               SizedBox(
    //                 height: 20.h,
    //               ),
    //               CustomTextField(
    //                   hint: '  First Name',
    //                   controller: signupProcessController.firstNameControl),
    //               K.fixed10h,
    //               CustomTextField(
    //                   hint: '  Last Name',
    //                   controller: signupProcessController.lastNameControl),
    //               K.fixed10h,
    //               CustomTextField(
    //                 hint: '  Mobile Number',
    //                 controller: signupProcessController.mobileControl,
    //                 boardType: TextInputType.number,
    //               ),
    //               K.fixed10h,
    //               K.fixed10h,
    //               Expanded(
    //                 child: Obx(
    //                   () => Container(
    //                     padding: const EdgeInsets.only(bottom: 40).w,
    //                     alignment: Alignment.bottomCenter,
    //                     child: CustomButton(
    //                       onPressed: () {
    //                         ///To-do: user have to fill all text fields to pass
    //                         ///Some other validation f exist
    //                         ///
    //                         /// Then:
    //                         signupProcessController.saveUserInfo(context);
    //                       },
    //                       text: signupProcessController.isLoading.value? '...Loading' : 'Next',
    //                       textSize: 16.sp,
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //     ),
    //   ),
    // );
  }
}
