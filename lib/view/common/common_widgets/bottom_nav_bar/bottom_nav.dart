// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/controller/dashboard_controller/dashboard_controller.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/category_bottom_nav/category.dart';

import 'package:ielts/view/common/constants.dart';

import 'widgets/category_card.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlack,
      height: 78.h,
      width: MediaQuery.of(context).size.width,
      child: GetBuilder<DashBoardController>(
          init: DashBoardController(),
          builder: (dashCntrol) {
            return Row(
                children: List.generate(
                    4,
                    (index) => CategoryCard(
                          icon: dashCntrol.categoryList[index].icons,
                          category: dashCntrol.categoryList[index],
                          onPressed: (b) {
                            dashCntrol
                                .categoryList[dashCntrol.prevBottomIndex.value]
                                .isSelected = false;

                            dashCntrol.currentBottomIndex.value = index;
                            dashCntrol.prevBottomIndex.value = index;
                            dashCntrol.categoryList[index].isSelected = true;

                            dashCntrol.update();
                          },
                        )));
          }),
    );
  }
}
