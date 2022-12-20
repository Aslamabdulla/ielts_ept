import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/animated_container/animated_toggle_switch.dart';
import 'package:ielts/view/dashboard_screen/dashboard_screen.dart';
import 'package:ielts/view/navigation_router/navigation_route.dart';
import 'package:ielts/view/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'EPT',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 15.sp),
            bodyText1: TextStyle(fontSize: 16.sp),
          ),
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
