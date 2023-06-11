import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/Custom_logo.dart';
import 'package:food_delivery_app/screens/welcome_screen/entry_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

//Giving it some time
startTimer() {
  Timer(const Duration(seconds: 2), () {
    Get.offAll(EntryScreen());
  });
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/Pattern.png'),
            fit: BoxFit.cover
        ),
      ),
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: CustomLogo(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
}
