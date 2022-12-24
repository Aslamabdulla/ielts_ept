import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/constants.dart';

class DialogueSubRowWidget extends StatelessWidget {
  final IconData leading;

  final String text;
  const DialogueSubRowWidget({
    Key? key,
    required this.leading,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            leading,
            size: 18.sp,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.check_circle,
            color: kGreen,
            size: 18.sp,
          ),
        ],
      ),
    );
  }
}
