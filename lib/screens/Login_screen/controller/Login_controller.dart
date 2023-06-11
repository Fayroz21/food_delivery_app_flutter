
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/Login_screen/Login_screen.dart';
import 'package:food_delivery_app/screens/signup_screen/signup_screen.dart';
import 'package:food_delivery_app/shared_preference/shared_pref.dart';
import 'package:get/get.dart';

import '../../../services/firebase_services.dart';
import '../../home_screen/home_screen.dart';

class LoginController extends GetxController{
  Services services = Services();

  final isLoading = false.obs;

  //Login
  login(email, password, context) async{
    isLoading.value = true;
    try{
      final resultAuth = await services.auth
          .signInWithEmailAndPassword(email: email, password: password);

      //Take user id
      if(resultAuth.user!.uid != null){
        Services.currentFirebaseUser.value = resultAuth.user;

        //save user id in shared preference
        await CacheHelper.saveDataToSharedPrefrence('token', resultAuth.user!.uid);

        print(resultAuth.user!.uid);
        Get.offAll(HomeScreen());

      }else{
        Get.to(() => SignupScreen());
      }
    } on FirebaseAuthException catch(e){
      final snackBar = SnackBar(
        content: Text('${e.message}', style: const TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    isLoading.value = false;
  }

  //Log out
  logOut() async{
    await services.auth.signOut();

    Get.offAll(() => LoginScreen());
    await CacheHelper.sharedPreferences!.remove('token');
    await CacheHelper.sharedPreferences!.clear();
  }
}