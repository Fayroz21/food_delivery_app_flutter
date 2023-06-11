import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_Text.dart';

import '../Constants/consts.dart';
import '../constants/otherConsts/other_consts.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  String? text;
  double? width = 157.w;
  Color? color = Const.mainColor;
  double? height = 57.h;
  double? textSize;
  Color? textColor;

  dynamic icon;

  CustomButton({Key? key,
    required this.onPressed,
    this.text = 'Next',
    this.width,
    this.height,
    this.color,
    this.textSize,
    this.textColor,

    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 157.0.w,
      height: height ?? 57.0.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color ?? Const.mainColor),
          elevation: MaterialStateProperty.all(20.w),
          shadowColor: MaterialStateProperty.all(K.shadowColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0).w,
            )
          )
        ),
        child: icon == null ?
        CustomText(
          text: text!,
          size: textSize,
          color: textColor,
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              icon,
              width: 25,
              height: 25,
            ),
            CustomText(
              text: text!,
              size: textSize,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}
