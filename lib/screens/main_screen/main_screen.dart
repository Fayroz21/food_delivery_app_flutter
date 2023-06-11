import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_Text.dart';
import 'package:food_delivery_app/components/Custom_appBar.dart';
import 'package:food_delivery_app/components/Custom_backGround2.dart';
import 'package:food_delivery_app/components/Custom_textField.dart';
import 'package:food_delivery_app/screens/main_screen/controller/main_controller.dart';
import 'package:get/get.dart';

import '../../Constants/consts.dart';
import '../../constants/otherConsts/other_consts.dart';


class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return CustomBackGround2(
        backgroundColor: Colors.transparent.mix(Colors.white, .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 223.w,
                  height: 82.h,
                  child: CustomText(
                    text: 'Find Your Favorite Food',
                    fontWeight: FontWeight.bold,
                    size: 31.sp,
                  ),
                ),
                CustomAppBar(
                  alignment: Alignment.topRight,
                  backgroundColor: Colors.white,
                  func: () {},
                  iconBar: Icons.notifications_none,
                  iconColor: Const.mainColor,
                ),
              ],
            ),
            K.fixed10h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 255.w,
                  child: CustomTextField(
                    hint: 'what do you want to order?',
                    controller: mainController.searchController,
                    prefixIcon: Icons.search,
                    color: const Color(0xFFF9A84D).withOpacity(0.2),
                    prefixIconColor: Colors.orange.shade700,
                    size: 33.w,
                    hintColor: Colors.orangeAccent.shade200,
                  ),
                ),
                InkWell(
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: K.fieldRadius,
                      color: const Color(0xFFF9A84D).withOpacity(0.1),
                    ),
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.orange.shade700,
                    ),
                  ),
                )
              ],
            ),
            K.fixed10h,
            Container(
              width: 325.w,
              height: 150.h,
              child: Image.asset('assets/images/Promo Advertising.png',
                  fit: BoxFit.fill),
            )
          ],
        ));
  }
}
