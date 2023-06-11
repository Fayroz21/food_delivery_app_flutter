import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/consts.dart';
import '../constants/otherConsts/other_consts.dart';

class CustomTextField extends StatelessWidget {
  String? hint;
  TextEditingController? controller = TextEditingController();
  dynamic prefixIcon;
  Widget? suffixIcon;
  bool? obscure;
  dynamic boardType;

  Color? color;
  Color? prefixIconColor;
  double? size;
  Color? hintColor;

  CustomTextField({Key? key,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure = false,
    this.boardType = TextInputType.text,
    this.color = Colors.white,
    this.prefixIconColor,
    this.size,
    this.hintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.sp,
      shadowColor: K.shadowColor,
      color: color,
      borderRadius: K.fieldRadius,
      child: TextFormField(
        keyboardType: boardType,
        controller: controller,
        obscureText: obscure!,
        cursorColor: K.fieldMainColor,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: hintColor?? K.fieldMainColor, ),
            fillColor: Colors.white,
            prefixIcon: prefixIcon != null ? Icon(
              prefixIcon!,
              color: prefixIconColor?? Const.mainColor,
              size: size,
            ) : null ,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderRadius: K.fieldRadius,
                borderSide: const BorderSide(
                  width: 1,
                  color: K.borderColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: K.fieldRadius,
                borderSide: const BorderSide(
                  width: 1,
                  color: K.borderColor,
                ))),
      ),
    );
  }
}
