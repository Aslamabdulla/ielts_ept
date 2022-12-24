import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

class LessonsListViewTileWidget extends StatelessWidget {
  const LessonsListViewTileWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.5.h,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5), //New
                    blurRadius: 8.0,
                    spreadRadius: 0)
              ],
              borderRadius: kBorderRadius10,
              color: kWhite,
            ),
            margin: index == 0
                ? const EdgeInsets.only(left: 20, right: 5, top: 10, bottom: 10)
                    .r
                : const EdgeInsets.only(left: 5, right: 10, top: 10, bottom: 10)
                    .r,
            padding: const EdgeInsets.only(left: 10).r,
            height: 100.h,
            width: 150.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(lessonsImages[index]),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0).r,
                  child: Text(
                    lessonsTileName[index],
                    maxLines: 1,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
