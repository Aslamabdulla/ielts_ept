import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/animated_container/animated_toggle_switch.dart';
import 'package:ielts/view/common/bottom_nav_bar/bottom_nav.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/common/text_sub_head_widget/text_sub_head.dart';
import 'package:ielts/view/dashboard_screen/widget/app_bar_widgets.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'widget/lessons_list_view_tile.dart';
import 'widget/subjects_list_view_tile_widget.dart';
import 'widget/username_top_widget.dart';

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
                        shape: BoxShape.circle),
                    // child: Center(),
                  ),
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
                  // child: Center(),
                ),
              ),
            ),
            SafeArea(
              child: ListView(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarDashBoard(),
                  kHeight20,
                  const UserNameTopWidget(),
                  kHeight35,
                  textHead("Subjects"),
                  SubjectListViewTileWidget(width: width),
                  kHeight25,
                  textHeadAndSub("Lessons", "See All"),
                  LessonsListViewTileWidget(width: width),
                  kHeight25,
                  textHeadAndSub("Latest News", "See All"),
                  LatestNewsWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5), //New
                  blurRadius: 8.0,
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.circular(15.r),
            color: kWhite,
          ),
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          width: 350.w,
          height: 110.h,
          child: Row(
            children: [
              Image.asset(
                "assets/images/lessons_book.png",
                height: 100.h,
                width: 96.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  kHeight5,
                  SizedBox(
                    width: 170.w,
                    height: 40.h,
                    child: Text(
                      "IELTS ADMISSION STARTED FOR 2022",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    // height: 60.h,
                    width: 224.w,
                    child: Text(
                      "abjsdslkdl;dmvl;dmv;ldvsfsdfsfsdfsdfsdfsfm;dlvfgsdfsddsfsfsdfsdfsdfsdfsdfsdfsdfsdfsdfsfsfsfsfsdfsdfsfsdfsdfsdfsfsfsfsfsfsfsfsffsfsfsfsfsfsasdfdsadadfdfdfdfdfghghghghfsdfsdfsdfsdfsdfsdfsdfsdfsdfm",
                      maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 8.sp,

                          // overflow: TextOverflow.clip,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "dfdfdfdfd",
                        style: textLatestNewsText10,
                      ),
                      SizedBox(
                        width: 118.w,
                      ),
                      Text(
                        "dfdfdfdfd",
                        style: textLatestNewsText10,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
