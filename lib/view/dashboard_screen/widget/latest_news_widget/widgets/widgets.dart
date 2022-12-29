import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

Container latestNewsColumnTile(
    int index, String formattedDate, String formattedtime) {
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
    height: 130.h,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        kWidth10,
        Flexible(
          flex: 1,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: kBorderRadius10),
            child: Image.network(
              ApiCalls().imageUrl +
                  (dashCtrl.dashboardData.value?.data.latestNews[index].image ??
                      ""),
              fit: BoxFit.cover,
              height: 100.h,
              width: 96.w,
            ),
          ),
        ),
        kWidth10,
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              kHeight10,
              Text(
                dashCtrl.dashboardData.value?.data.latestNews[index].title ??
                    "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                // height: 60.h,
                width: 224.w,
                child: Text(
                  dashCtrl.dashboardData.value?.data.latestNews[index]
                          .description ??
                      "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 8.sp,

                      // overflow: TextOverflow.clip,
                      fontWeight: FontWeight.w400),
                ),
              ),
              kHeight5,
              SizedBox(
                width: 215.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      formattedDate.toString(),
                      style: textLatestNewsText10,
                    ),
                    Text(
                      formattedtime,
                      style: textLatestNewsText10,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
