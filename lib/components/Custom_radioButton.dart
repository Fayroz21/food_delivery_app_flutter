

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/consts.dart';
import 'Custom_Text.dart';

class CustomRadioButton extends StatelessWidget {
  dynamic val;
  String? text;
  dynamic func;

  CustomRadioButton({Key? key,
    required this.val,
    required this.text,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        visualDensity: const VisualDensity(
          vertical: -4,
        ),
        value: val,
        contentPadding: const EdgeInsets.all(0),
        onChanged: func,
        activeColor: Const.mainColor,
        title: CustomText(
          text : text,
          fontWeight: FontWeight.normal,
          size: 12.sp,
        ),
        checkboxShape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(8).w,
        ),
        side: BorderSide(
            width: 1.w,
            color: Const.mainColor!
        ),
      );
  }
}
