import 'package:flutter/material.dart';
import 'Custom_Text.dart';

class CustomSnackBar{

  static showSnackBar(String? mess, context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomText(
            text: mess,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        )
    );
  }
}
