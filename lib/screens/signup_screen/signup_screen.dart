import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_Text.dart';
import 'package:food_delivery_app/components/Custom_button.dart';
import 'package:food_delivery_app/components/Custom_logo.dart';
import 'package:food_delivery_app/components/Custom_radioButton.dart';
import 'package:food_delivery_app/components/Custom_textButton.dart';
import 'package:food_delivery_app/components/Custom_textField.dart';
import 'package:food_delivery_app/screens/Login_screen/Login_screen.dart';
import 'package:food_delivery_app/screens/Signup_process_screen/signup_process_screen.dart';
import 'package:food_delivery_app/screens/signup_screen/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/consts.dart';
import '../../constants/otherConsts/other_consts.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  SignupController signupControl = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/Pattern.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 20, right: 20).w,
                    child: Column(
                      children: [
                        CustomLogo(),
                        SizedBox(
                          height: 35.h,
                        ),
                        CustomText(
                          text: 'Sign Up For Free',
                          size: 20.sp,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomTextField(
                            hint: 'Anamwp...',
                            controller: signupControl.userNameControl,
                            prefixIcon: Icons.perm_identity,
                        ),
                        SizedBox( height: 10.h,),
                        CustomTextField(
                          hint: 'Email',
                          controller: signupControl.emailControl,
                          prefixIcon: Icons.email,
                        ),
                        SizedBox( height: 10.h,),
                        Obx(
                          () => CustomTextField(
                              hint: 'Password',
                              controller: signupControl.passControl,
                              prefixIcon: Icons.lock,
                              obscure: signupControl.passObscure.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  signupControl.passObscure.value ? Icons.visibility : Icons.visibility_off,
                                  color: K.fieldMainColor,
                                ),
                                onPressed: () {
                                  signupControl.passObscure.value = !signupControl.passObscure.value;
                                },
                              ),
                          ),
                        ),
                        Obx(
                          () => CustomRadioButton(
                              val: signupControl.isKeptSignIn.value,
                              text: 'Keep Me Signed In',
                              func: (bool? val){
                                signupControl.isKeptSignIn.value = val as bool;
                                print(signupControl.isKeptSignIn.value);
                              },
                          ),
                        ),
                        Obx(
                              () => CustomRadioButton(
                            val: signupControl.emailUser.value,
                            text: 'Email Me About Special Pricing',
                            func: (bool? val){
                              signupControl.emailUser.value = val as bool;
                              print(signupControl.emailUser.value);
                            },
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Obx(
                          () => CustomButton(
                              onPressed: (){
                                signupControl.signUp(signupControl.emailControl.text.trim(), signupControl.passControl.text.trim(), context);
                              },
                              height: 57.h,
                              width: 175.w,
                              text: signupControl.isLoading.value? '...Loading' : 'Create Account',
                              textSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 5.h,),

                        CustomTextButton(func: (){
                          Get.to(LoginScreen());
                        }, text: 'already have an account?')
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }
}
