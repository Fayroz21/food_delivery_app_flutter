

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/consts.dart';
import '../constants/otherConsts/other_consts.dart';

class CustomContainerImage extends StatelessWidget {

  double? height;
  double? width;
  dynamic child;
  VoidCallback? func;

  CustomContainerImage({Key? key,
    required this.height,
    required this.width,
    required this.child,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Const.mainColor,
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.all(Radius.circular(5.w)),
      onTap: func,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: K.shadowColor,
              blurRadius: 7.r,
              spreadRadius: 3.r,
              offset: const Offset(4,8),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(22.w)),
        ),
        child: child,
      ),
    );
  }
}
