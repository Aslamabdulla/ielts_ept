import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';

Widget name(String hintText) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
    child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: kBlack.withOpacity(.8)),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: kWhite,
          filled: true,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: kBlack.withOpacity(.5)),
        ),
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[a-z A-z]+$').hasMatch(value)) {
            return "Enter correct Name";
          } else {
            regCtrl.name = value;
          }
        }),
  );
}

Widget phoneNumber(String hintText) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
    child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: kBlack.withOpacity(.8)),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: kWhite,
          filled: true,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: kBlack.withOpacity(.5)),
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^((\+91-?)|0)?[6-9]\d{9}$').hasMatch(value)) {
            return "Enter correct number";
          } else {
            try {
              regCtrl.phoneNum = value;
            } catch (e) {
              Get.snackbar("Error", "Please verify phone number");
            }
          }
        }),
  );
}

Widget email(String hintText) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
    child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: kBlack.withOpacity(.8)),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: kWhite,
          filled: true,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: kBlack.withOpacity(.5)),
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                  .hasMatch(value)) {
            return "Enter correct email";
          } else {
            regCtrl.email = value;
          }
        }),
  );
}
