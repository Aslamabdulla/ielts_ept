import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/bottom_nav_bar/bottom_nav.dart';
import 'package:ielts/view/common/bottom_nav_bar/widgets/category.dart';
import 'package:ielts/view/common/constants.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function(bool) onPressed;
  final IconData icon;

  const CategoryCard(
      {required this.category,
      required this.onPressed,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(true);
      },
      child: SizedBox(
        height: 78.h,
        width: Get.width / 4,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: kWhite,
              ),
              kHeight5,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: FittedBox(
                  child: Text(category.title,
                      style: TextStyle(color: kWhite, fontSize: 8.sp)),
                ),
              ),
              kHeight5,
              category.isSelected
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: RadialGradient(
                              tileMode: TileMode.decal,
                              // focalRadius: 1,
                              radius: 5,
                              stops: [0, 0.1, 0.2, 0.35, 0.5, 1],
                              colors: colors,
                              center: Alignment.centerLeft)),
                      height: 10.h,
                      width: (Get.width / 4) - 60.h,
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
