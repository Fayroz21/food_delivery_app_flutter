
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/Custom_snackBar.dart';
import 'package:food_delivery_app/screens/Signup_process_screen/signup_process_screen.dart';
import 'package:get/get.dart';
import '../../../constants/user_info/user_info_const.dart';
import '../../../services/firebase_services.dart';

class SignupController extends GetxController {
  //For password text field
  var passObscure = true.obs;

  //Radio buttons
  var isKeptSignIn = false.obs;
  var emailUser = false.obs;

  //Text field Controllers
  TextEditingController userNameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passControl = TextEditingController();

  //Services and loading status
  Services services = Services();
  final isLoading = false.obs;

  //Sign Up function
  signUp(email, password, context) async {
    isLoading.value = true;

    try {
      if(userNameControl.text.trim().isNotEmpty) {
        final signUpAuth = await services.auth
            .createUserWithEmailAndPassword(email: email, password: password);

        if (signUpAuth.user != null) {
          //Save user in current user firebase
          Services.currentFirebaseUser.value = signUpAuth.user!;
          String uid = Services.currentFirebaseUser.value!.uid;

          print('Signed up successfully');

          //store user info in
          DatabaseReference userRef = services.store.ref().child('User');

          ///To-do save user info at last screen
          await userRef.child(uid).set({
            UserConst.userName: userNameControl.text.trim(),
            UserConst.stayLogIn: isKeptSignIn.value,
            UserConst.emailMe: emailUser.value,
            UserConst.fName : '',
            UserConst.lName : '',
            UserConst.mobileNum : '',
            UserConst.payMethod: '',
            UserConst.image: '',
            UserConst.location: '',
          });

          Get.to(() => SignUpProcess());
        } else {
          CustomSnackBar.showSnackBar('Something went wrong, please try again', context);
        }
      }else{
        CustomSnackBar.showSnackBar('Please Enter a User Name', context);

      }
    } on FirebaseAuthException catch (e) {
      CustomSnackBar.showSnackBar('${e.message}', context);
    }

    isLoading.value = false;
  }

}

