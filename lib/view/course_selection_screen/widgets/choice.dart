import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';

Widget choiceWidget() => InkWell(
      onTap: () {
        choiceCtrl.isCoiceSelected.value = true;
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(10)),
        width: 215.w,
        height: 42.h,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(
                flex: 3,
              ),
              const Text(
                "IELTS",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(
                flex: 2,
              ),
              choiceCtrl.isCoiceSelected.value
                  ? const Icon(
                      Icons.check_circle,
                      color: kGreen,
                    )
                  : kWidth20,
              kWidth10
            ],
          ),
        ),
      ),
    );
