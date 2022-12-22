import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';

class UserNameTopWidget extends StatelessWidget {
  const UserNameTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0).r,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
            ),
            Obx(
              () => Text(dashCtrl.userName.value!,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }
}
