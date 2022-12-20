import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/animated_container/animated_toggle_switch.dart';
import 'package:ielts/view/common/bottom_nav_bar/bottom_nav.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/widget/app_bar_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.width * .4);
    int index = 0;
    print(index);
    var width = Get.width;
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: -100,
              top: -100,
              child: Transform.rotate(
                angle: 11.8,
                child: Opacity(
                  opacity: .8,
                  child: Container(
                      height: width * 1.06,
                      width: width * 1.06,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/homeCircle.png"),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle)),
                ),
              ),
            ),
            Positioned(
              left: -60,
              top: -80,
              child: Transform.rotate(
                angle: 1.7,
                child: Container(
                  height: width * .92,
                  width: width * .92,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/homeCircle.png"),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                height: Get.height,
                width: Get.width,
                // padding: const EdgeInsets.only(left: 20, top: 0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarDashBoard(),
                    kHeight20,
                    const UserNameTopWidget(),
                    kHeight35,
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 8).r,
                      child: Text(
                        "Subjects",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                    ),
                    Container(
                      height: 125.h,
                      width: width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: subjectsTileColor[index],
                              ),
                              margin: index == 0
                                  ? const EdgeInsets.only(left: 20, right: 5).r
                                  : const EdgeInsets.only(left: 5, right: 5).r,
                              height: 50.h,
                              width: 170.w,
                              child: Column(
                                // mainAxisAlignment:
                                // MainAxisAlignment.spaceBetween,
                                children: [
                                  kHeight10,
                                  Row(
                                    children: [
                                      kWidth10,
                                      const Text("Listening"),
                                      const Spacer(),
                                      const Text("6/10"),
                                      kWidth10,
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text("60%"),
                                      kHeight5,
                                      const Text("60%")
                                    ],
                                  ),
                                  kHeight10
                                ],
                              ),
                            );
                          },
                          itemCount: 4),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserNameTopWidget extends StatelessWidget {
  const UserNameTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0).r,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
            ),
            Text(dashCtrl.userName.value ?? "USER",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }
}
