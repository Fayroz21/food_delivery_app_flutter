

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/constants/user_info/user_info_const.dart';
import 'package:get/get.dart';

import '../../../components/Custom_snackBar.dart';
import '../../../services/firebase_services.dart';
import '../../PaymentMethod_screen/paymentMethod_screen.dart';

class SignupProcessController extends GetxController{
  //Text Fields
  TextEditingController firstNameControl = TextEditingController();
  TextEditingController lastNameControl = TextEditingController();
  TextEditingController mobileControl = TextEditingController();

  //Services firebase
  Services services = Services();
  final isLoading = false.obs;

  //Use Info
  saveUserInfo(context) async{
    isLoading.value = true;

    try {
      if (Services.currentFirebaseUser.value != null && firstNameControl.text.trim().isNotEmpty
      && lastNameControl.text.trim().isNotEmpty && mobileControl.text.trim().isNotEmpty) {
        //save uid
        String uid = Services.currentFirebaseUser.value!.uid;

        //retrieve place to store data
        DatabaseReference userRef = services.store.ref().child('User');

        await userRef.child(uid).update({
          UserConst.fName: firstNameControl.text.trim(),
          UserConst.lName: lastNameControl.text.trim(),
          UserConst.mobileNum: mobileControl.text.trim(),
        });

        Get.to(() => PaymentMethodScreen());
      } else {
        CustomSnackBar.showSnackBar(
            'Something went wrong, please try again or fill all the info', context);
      }
    }on FirebaseException catch(e){
      CustomSnackBar.showSnackBar('${e.message}', context);
    }

    isLoading.value = false;
  }
}