import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/view/common/animated_container/animated_toggle_switch.dart';
import 'package:ielts/view/common/bottom_nav_bar/bottom_nav.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/common/text_sub_head_widget/text_sub_head.dart';
import 'package:ielts/view/dashboard_screen/widget/app_bar_widgets.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'widget/latest_news_widget/latest_news_widget.dart';
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
