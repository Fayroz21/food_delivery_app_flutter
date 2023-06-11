
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/otherConsts/other_consts.dart';

class CustomAppBar extends StatelessWidget {
  dynamic iconBar;
  VoidCallback? func;
  dynamic alignment;
  Color? iconColor;
  Color? backgroundColor;


  CustomAppBar({Key? key,
    this.iconBar = Icons.arrow_back_ios_rounded,
    this.func,
    this.alignment = Alignment.topLeft,
    this.iconColor = const Color(0xFFDA6317),
    this.backgroundColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //   top: 20.w,
      //   left: 25.w,
      // ),
      alignment: alignment,
      child: InkWell(
        onTap: func,
        child: Container(
          width: 45.w,
          height: 45.w,
          decoration: BoxDecoration(
            borderRadius: K.fieldRadius,
            color: backgroundColor?? const Color(0xFFF9A84D).withOpacity(0.1),
          ),
          child: Icon(iconBar, color: iconColor,),

        ),
      ),
    );
  }
}
