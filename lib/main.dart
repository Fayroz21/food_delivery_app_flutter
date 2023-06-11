import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:food_delivery_app/screens/Login_screen/Login_screen.dart';
import 'package:food_delivery_app/screens/Signup_process_screen/signup_process_screen.dart';
import 'package:food_delivery_app/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/screens/loading_screen/loading.dart';
import 'package:food_delivery_app/screens/uploadPhoto_screen/upload_photo_screen.dart';
import 'package:food_delivery_app/shared_preference/shared_pref.dart';
import 'package:get/get.dart';


Future<void> main() async{
  //Run firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform );

  await CacheHelper.onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:  const Size(360, 690),
      builder: (buildContext, widget) =>
       GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
        ),
        home: LoginScreen(),
      ),
    );
  }
}
