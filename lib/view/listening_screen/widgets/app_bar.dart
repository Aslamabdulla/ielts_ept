import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

Widget appBar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: kBlack,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 30.h,
          )),
      title: Text(
        "EPT",
        style: headTextNixmat,
      ),
      centerTitle: true,
    );
