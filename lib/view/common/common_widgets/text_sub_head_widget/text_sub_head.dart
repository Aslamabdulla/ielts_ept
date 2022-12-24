import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/constants.dart';

Widget textHead(String headText) => Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8).r,
      child: Text(
        headText,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      ),
    );
Widget textSubHead(String headText) => Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8).r,
      child: Text(
        headText,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp),
      ),
    );
Widget textHeadAndSub(String head, String subHead) => Row(
      children: [textHead(head), Spacer(), textSubHead(subHead), kWidth20],
    );
