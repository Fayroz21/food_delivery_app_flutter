

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/consts.dart';
import '../constants/otherConsts/other_consts.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/Logo.png'),
        ),
        Text('FoodNinja', style: TextStyle(
          fontSize: 40.sp,
          color: Const.mainColor,
          fontWeight: FontWeight.bold,
        ),),
        Text(
          'Deliver Favorite Food',
          style: TextStyle(
              fontSize: 13.sp,
              color: K.textColor,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
