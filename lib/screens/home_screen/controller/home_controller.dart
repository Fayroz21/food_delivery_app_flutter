
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final currentIndex = 0.obs;

  onTap(value){
    currentIndex.value = value;
  }
}