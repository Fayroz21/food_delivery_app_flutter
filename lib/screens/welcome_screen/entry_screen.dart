import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_button.dart';
import 'package:food_delivery_app/screens/signup_screen/signup_screen.dart';
import 'package:food_delivery_app/screens/welcome_screen/controller/entry_controller.dart';
import 'package:get/get.dart';
import '../../components/Custom_Text.dart';
import '../../constants/otherConsts/other_consts.dart';

class EntryScreen extends StatelessWidget {
  EntryScreen({Key? key}) : super(key: key);

  EntryController entryController = Get.put(EntryController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Obx(
              () =>  Column(
                children: [
                  ///To-do
                  ///Each take controller variale.value
                  SizedBox(height: 10.h,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 434.22.h,
                      child: Image(image: entryController.image.value),
                  ),
                  SizedBox(
                    width: entryController.titleW.value,
                    height: 58.h,
                    child: CustomText(
                      text: entryController.text.value,
                      align: true,
                      size: 22.sp,
                    ),
                  ),
                  SizedBox(
                    width: entryController.subTitleW.value,
                    height: 44.h,
                    child: CustomText(
                      text: entryController.text2.value,
                      align: true,
                      size: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  CustomButton(
                      onPressed: (){
                        if(entryController.counter == 0){
                          entryController.image.value = const AssetImage('assets/images/Illustration 2.png');
                          entryController.text.value = K.titleSplash2;
                          entryController.text2.value = K.subTitleSplash2;

                          entryController.titleW.value = 348.w;

                          entryController.subTitleW.value = 244.w;
                          entryController.counter++;
                        }
                        else{
                          Get.to(SignupScreen());
                        }
                      },
                  )
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
