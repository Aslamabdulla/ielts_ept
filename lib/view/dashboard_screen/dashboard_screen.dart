import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ielts/view/common/common_widgets/text_sub_head_widget/text_sub_head.dart';

import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/common/common_widgets/scrol_behaviour/scroll_behaviour.dart';

import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';
import 'package:ielts/view/dashboard_screen/widget/app_bar_widget/app_bar_widgets.dart';

import 'widget/latest_news_widget/latest_news_widget.dart';
import 'widget/lessons/lessons_list_view_tile.dart';
import 'widget/subjects_dashboard_list_view/subjects_list_view_tile_widget.dart';
import 'widget/username_dashboard_top/username_top_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      extendBodyBehindAppBar: true,

      body: ScrollConfiguration(
        behavior: NoShadoBehavior(),
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BgCircleFirstClipper(width: width),
              BGCircleSecondClipper(width: width),
              SafeArea(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
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
                    const LatestNewsWidget()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
