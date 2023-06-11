import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/otherConsts/other_consts.dart';

class EntryController extends GetxController{
  int counter = 0;

  var image = const AssetImage('assets/images/Illustartion.png').obs; // equal first image
  var text = K.titleSplash1.obs; //equal first text
  var text2 = K.subTitleSplash1.obs; //equal fits sub text

  var titleW = 211.w.obs;

  var subTitleW = 244.w.obs;
}