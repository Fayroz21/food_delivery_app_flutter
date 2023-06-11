import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_button.dart';
import 'package:food_delivery_app/components/Custom_textButton.dart';
import 'package:food_delivery_app/components/Custom_textField.dart';
import 'package:food_delivery_app/screens/Login_screen/controller/Login_controller.dart';
import 'package:get/get.dart';
import '../../components/Custom_Text.dart';
import '../../components/Custom_logo.dart';
import '../../constants/otherConsts/other_consts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailLoginControl = TextEditingController();
  TextEditingController passLoginControl = TextEditingController();

  LoginController loginController =  Get.put(LoginController());

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
                  child: Column(children: [
                    CustomLogo(),
                    SizedBox(
                      height: 35.h,
                    ),
                    CustomText(
                      text: 'Login To Your Account',
                      size: 20.sp,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextField(
                      hint: '  Email',
                      controller: emailLoginControl,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      hint: '  password',
                      controller: passLoginControl,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: 'Or Continue With',
                      size: 14.sp,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         CustomButton(
                            onPressed: () {},
                            color: Colors.white,
                            text: 'Facebook',
                            textSize: 14.sp,
                            textColor: K.textColor,
                            width: 152.w,
                            icon: 'assets/images/facebook.png',
                          ),

                        CustomButton(
                          onPressed: () {},
                          color: Colors.white,
                          text: 'Google',
                          textSize: 14.sp,
                          textColor: K.textColor,
                          width: 152.w,
                          icon: 'assets/images/google.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextButton(
                        func: () {}, text: 'Forgot Your Password?'),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => CustomButton(
                        onPressed: () {
                          loginController.login(emailLoginControl.text.trim(),
                              passLoginControl.text.trim(), context);
                        },
                        text: loginController.isLoading.value ? '...Loading' : 'Login',
                        textSize: 16.sp,
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}
