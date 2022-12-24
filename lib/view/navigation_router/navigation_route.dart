import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common_widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:ielts/view/dashboard_screen/dashboard_screen.dart';
import 'package:ielts/view/login_screen/login_screen.dart';
import 'package:ielts/view/registration_screen/registration_screen.dart';

class NavigationBottomBarScreen extends StatelessWidget {
  NavigationBottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    print(index);
    return Obx(
      () => Scaffold(
          bottomNavigationBar: const BottomNavBar(),
          body: FadeIn(
            child: screenList[dashCtrl.currentBottomIndex.value],
            duration: const Duration(milliseconds: 400),
          )),
    );
  }

  List screenList = [
    const HomeScreen(),
    const LoginScreen(),
    const RegistrationScreen(),
    const HomeScreen(),
  ];
}
