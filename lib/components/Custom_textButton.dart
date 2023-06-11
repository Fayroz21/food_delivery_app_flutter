import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/consts.dart';
import 'Custom_Text.dart';

class CustomTextButton extends StatelessWidget {

  VoidCallback func;
  String? text;

  CustomTextButton({Key? key,
    required this.func,
    required this.text,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: func,
        style: ButtonStyle(

        ),
        child: CustomText(
          text: text,
          color: Const.mainColor,
          fontWeight: FontWeight.w400,
          size: 12.sp,
          textDecorate: TextDecoration.underline,
        )
    );
  }
}
