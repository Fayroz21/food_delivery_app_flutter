import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackGround2 extends StatelessWidget {

  Widget? child;
  bool? resizeToAvoidBottomInset;
  Widget? bottomNavBar;
  Color? backgroundColor;

  CustomBackGround2({Key? key,
    required this.child,
    this.resizeToAvoidBottomInset = true,
    this.backgroundColor = Colors.transparent,
    this.bottomNavBar,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/secondPattern.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomNavigationBar: bottomNavBar,
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25).w,
            child: child,
          ),
        ),
      ),
    );
  }
}
