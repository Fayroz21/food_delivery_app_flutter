import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/components/Custom_snackBar.dart';
import 'package:food_delivery_app/screens/setlocation_screen/setLocation_Screen.dart';
import 'package:food_delivery_app/services/firebase_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/user_info/user_info_const.dart';

class UploadPhotoController extends GetxController{
  List imagePick = [
    { 'image' : Image.asset('assets/user/Gallery-Icon.png'),
      'source' : ImageSource.gallery
    },
    { 'image' : Image.asset('assets/user/Camera-Icon.png'),
      'source' : ImageSource.camera
    },
  ];

  //Fields
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  //Loading status and firebase services
  final isLoading = false.obs;
  Services services = Services();


  void getImage(ImageSource imageSource, context) async{
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    //if user picked an image
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
      selectedImageSize = ('${((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)}Mb') as RxString;

    }else{
      CustomSnackBar.showSnackBar('No image selected', context);
    }
  }

  void saveTheImage(context) async{
    isLoading.value = true;

    try{

      if(selectedImagePath.value != ''){
        //save uid
        String uid = Services.currentFirebaseUser.value!.uid;

        //retrieve place to store data
        DatabaseReference userRef = services.store.ref().child('User');

        await userRef.child(uid).update({
          UserConst.image: selectedImagePath.value,
        });

        Get.to(() => SetLocationScreen());

      }else{
        CustomSnackBar.showSnackBar(
            'Please pick an image', context);
      }

    }on FirebaseException catch(e){
      CustomSnackBar.showSnackBar('${e.message}', context);
    }

    isLoading.value = false;

  }

}