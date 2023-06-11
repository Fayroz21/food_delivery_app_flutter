import 'package:flutter/cupertino.dart';

import '../constants/otherConsts/other_consts.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? color = K.textColor;
  double? size;
  FontWeight? fontWeight;
  bool? align;
  dynamic textDecorate;

  CustomText({
    Key? key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight = FontWeight.bold,
    this.align = false,
    this.textDecorate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: align! ? TextAlign.center : null,
      style: TextStyle(
        fontWeight: fontWeight!,
        fontSize: size,
        color: color,
        decoration: textDecorate
      ),
    );
  }
}
