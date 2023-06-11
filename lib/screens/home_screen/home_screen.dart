import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/Custom_Text.dart';
import 'package:food_delivery_app/components/Custom_appBar.dart';
import 'package:food_delivery_app/components/Custom_backGround2.dart';
import 'package:food_delivery_app/components/Custom_textField.dart';
import 'package:food_delivery_app/screens/home_screen/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../Constants/consts.dart';
import '../../constants/otherConsts/other_consts.dart';
import '../../utils.dart';
import '../cart_screen/cart_screen.dart';
import '../chat_screen/chat_screen.dart';
import '../main_screen/main_screen.dart';
import '../profile_screen/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  List<Widget> screens = [
    MainScreen(),
    ProfileScreen(),
    CartScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx( ()=>
        Container(
          margin: EdgeInsets.only(left: 8.0.w, right: 8.0.w, bottom: 8.0.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22.w)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.w),
            child: GNav(
              selectedIndex: homeController.currentIndex.value,
              onTabChange: (v){
                homeController.onTap(v);
              },

              backgroundColor: Colors.white,
              color: Const.mainColor,
              gap: 8,
              activeColor: Const.mainColor,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
              tabBackgroundColor: Const.mainColor!.withOpacity(0.1),
              tabBorderRadius: 12.w,
              haptic: true,
              padding: EdgeInsets.all(10.w),
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person_rounded,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.mark_unread_chat_alt,
                  text: 'Chat',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => screens[homeController.currentIndex.value]),
    );
  }
}

function(context) {
  double baseWidth = 375;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;
  return Container(
    padding: EdgeInsets.fromLTRB(20 * fem, 15 * fem, 34 * fem, 15 * fem),
    width: 355 * fem,
    height: 74 * fem,
    decoration: BoxDecoration(
      color: Color(0xff252525),
      borderRadius: BorderRadius.circular(15 * fem),
      boxShadow: [
        BoxShadow(
          color: Color(0x7f010107),
          offset: Offset(0 * fem, 0 * fem),
          blurRadius: 25 * fem,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // iconhomeactivefcy (198:1635)
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 46 * fem, 0 * fem),
          padding:
              EdgeInsets.fromLTRB(19.5 * fem, 12 * fem, 21 * fem, 12 * fem),
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12 * fem),
            gradient: LinearGradient(
              begin: Alignment(-1, -1.123),
              end: Alignment(1, 1.228),
              colors: <Color>[Color(0x1953e78b), Color(0x1914be77)],
              stops: <double>[0, 1],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // iconlybulkhomerhT (198:1637)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14.5 * fem, 0 * fem),
                width: 19 * fem,
                height: 20 * fem,
                child: Image.asset(
                  'assets/images/iconly-bulk-home-weu.png',
                  width: 19 * fem,
                  height: 20 * fem,
                ),
              ),
              Container(
                // home8ey (198:1640)
                margin: EdgeInsets.fromLTRB(0 * fem, 4 * fem, 0 * fem, 0 * fem),
                child: Text(
                  'Home',
                  style: SafeGoogleFont(
                    'BentonSans Medium',
                    fontSize: 12 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.3102272352 * ffem / fem,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
        Opacity(
          // iconprofileCuj (198:1649)
          opacity: 0.5,
          child: Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 39.01 * fem, 0 * fem),
            width: 15.99 * fem,
            height: 20 * fem,
            child: Image.asset(
              'assets/images/icon-profile-8Um.png',
              width: 15.99 * fem,
              height: 20 * fem,
            ),
          ),
        ),
        Container(
          // autogroupchdx4S9 (KxtDcoHCRcDhiS4tv9ChDX)
          margin: EdgeInsets.fromLTRB(0 * fem, 8 * fem, 43 * fem, 11.9 * fem),
          width: 26 * fem,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                // 9yP (198:1643)
                left: 21 * fem,
                top: 2 * fem,
                child: Align(
                  child: SizedBox(
                    width: 5 * fem,
                    height: 12 * fem,
                    child: Text(
                      '7',
                      style: SafeGoogleFont(
                        'BentonSans Bold',
                        fontSize: 9 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3102272881 * ffem / fem,
                        color: Color(0xff0c0c0c),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // iconcartbaV (198:1644)
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
                  width: 26 * fem,
                  height: 24.1 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // iconlybulkbuy6n9 (198:1645)
                        left: 0 * fem,
                        top: 4.4995117188 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 20.02 * fem,
                            height: 19.6 * fem,
                            child: Opacity(
                              opacity: 0.5,
                              child: Image.asset(
                                'assets/images/iconly-bulk-buy-9yf.png',
                                width: 20.02 * fem,
                                height: 19.6 * fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // notificationcart8Tw (198:1646)
                        left: 13 * fem,
                        top: 0 * fem,
                        child: Container(
                          width: 13 * fem,
                          height: 14 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // ellipse1632JR (198:1647)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 13 * fem,
                                    height: 13 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.5 * fem),
                                        border: Border.all(
                                            color: Color(0xff0c0c0c)),
                                        color: Color(0xffff6464),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // tbX (198:1648)
                                left: 4 * fem,
                                top: 2 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 5 * fem,
                                    height: 12 * fem,
                                    child: Text(
                                      '7',
                                      style: SafeGoogleFont(
                                        'BentonSans Bold',
                                        fontSize: 9 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3102272881 * ffem / fem,
                                        color: Color(0xff0c0c0c),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          // autogroupzztxiKf (KxtDnTfmLqatYKik1FzzTX)
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4.03 * fem),
          width: 26 * fem,
          height: 23.97 * fem,
          child: Image.asset(
            'assets/images/auto-group-zztx.png',
            width: 26 * fem,
            height: 23.97 * fem,
          ),
        ),
      ],
    ),
  );
}


// Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// width: 223.w,
// height: 82.h,
// child: CustomText(
// text: 'Find Your Favorite Food',
// fontWeight: FontWeight.bold,
// size: 31.sp,
// ),
// ),
// CustomAppBar(
// alignment: Alignment.topRight,
// backgroundColor: Colors.white,
// func: () {},
// iconBar: Icons.notifications_none,
// iconColor: Const.mainColor,
// ),
// ],
// ),
// K.fixed10h,
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// SizedBox(
// width: 255.w,
// child: CustomTextField(
// hint: 'what do you want to order?',
// controller: homeController.searchController,
// prefixIcon: Icons.search,
// color: const Color(0xFFF9A84D).withOpacity(0.2),
// prefixIconColor: Colors.orange.shade700,
// size: 33.w,
// hintColor: Colors.orangeAccent.shade200,
// ),
// ),
// InkWell(
// child: Container(
// width: 50.w,
// height: 50.h,
// decoration: BoxDecoration(
// borderRadius: K.fieldRadius,
// color: const Color(0xFFF9A84D).withOpacity(0.1),
// ),
// child: Icon(Icons.filter_alt, color: Colors.orange.shade700,),
// ),
// )
// ],
// ),
// K.fixed10h,
// Container(
// width: 325.w,
// height: 150.h,
// child: Image.asset('assets/images/Promo Advertising.png', fit: BoxFit.fill),
// )
// ],
// )