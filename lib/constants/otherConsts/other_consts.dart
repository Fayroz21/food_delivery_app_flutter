import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_Text.dart';

class K{
  ///Related to button
  static const textColor = Colors.black;
  static const btnText = Colors.white;

  ///Related to text Field
  static const shadowColor = Color.fromRGBO(90, 108, 234, 0.07);
  static dynamic fieldRadius = BorderRadius.circular(15).w;
  static const fieldMainColor = Colors.grey;
  static const borderColor = Color(0xFFF4F4F4);

  ///Related to splash screens
  static const String titleSplash1 = 'Find your Comfort Food here\n';
  static const String subTitleSplash1 = 'Here You Can find a chef or dish for every taste and color. Enjoy!';

  static const String titleSplash2 = 'Food Ninja is Where Your Comfort Food Lives\n';
  static const String subTitleSplash2 = 'Enjoy a fast and smooth food delivery at your doorstep';
  
  ///fixed message in signup process
  static Widget securityMess = SizedBox(
    width: 239.w,
    height: 44.h,
    child: CustomText(
        text: 'This data will be displayed in your account profile for security',
        size: 12.sp,
        fontWeight: FontWeight.w400,
    ),
  );

  ///Fixed Sized Box
  static Widget fixed10h = SizedBox(height: 10.h,);
  static Widget fixed10w = SizedBox(width: 10.h,);
}