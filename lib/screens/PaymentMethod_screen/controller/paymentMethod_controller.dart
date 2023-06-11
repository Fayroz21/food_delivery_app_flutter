import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/screens/uploadPhoto_screen/upload_photo_screen.dart';
import 'package:food_delivery_app/services/firebase_services.dart';
import 'package:get/get.dart';

import '../../../components/Custom_snackBar.dart';
import '../../../constants/user_info/user_info_const.dart';

class PaymentMethodController extends GetxController {
  List methods = [
    {
      'image': Image.asset('assets/user/paypal-2.png'),
      'method': 'paypal'
    },
    {
      'image': Image.asset('assets/user/visa.png'),
      'method': 'visa'
    },
    {
      'image': Image.asset('assets/user/Payoneer_logo.png'),
      'method': 'payoneer'
    },
  ];

  //Fields
  //To save payment method
  final  _chosenMethod = 'chosen'.obs;
  //To load
  final isLoading = false.obs;
  //Services
  Services services = Services();


  set chosenMethod(value) {
    _chosenMethod.value = value;
  }


  String get chosenMethod => _chosenMethod.value;

  savePaymentMethod(context) async{
    isLoading.value = true;

    try{
      if(_chosenMethod.value != null){

        String uid = Services.currentFirebaseUser.value!.uid;

        //retrieve place to store data
        DatabaseReference userRef = services.store.ref().child('User');

        await userRef.child(uid).update({
          UserConst.payMethod : _chosenMethod.value,
        });

        Get.to(() => UploadPhotoScreen());

      }else{
        CustomSnackBar.showSnackBar(
            'Please choose a payment method', context);
      }
    }on FirebaseException catch(e){
      CustomSnackBar.showSnackBar('${e.message}', context);
    }
    isLoading.value = false;
  }

}
