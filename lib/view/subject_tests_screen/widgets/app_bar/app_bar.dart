import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/view/common/common_widgets/back_button_app_bar/back_button.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

Widget appBar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: kBlack,
      leading: backButtonLeadingAppBar(),
      title: Text(
        "EPT",
        style: headTextNixmat,
      ),
      centerTitle: true,
    );
