import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InterNetCheckController extends GetxController {
  @override
  void onInit() {
    getConnectivity();
    super.onInit();
  }

  late StreamSubscription subscription;
  var isConnected = false.obs;
  var isAlertSet = false.obs;

  getConnectivity() {
    try {
      return subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isConnected.value = await InternetConnectionChecker().hasConnection;
        if (!isConnected.value && isAlertSet.value == false) {
          showDialogueBox();
          isAlertSet.value = true;
        }
      });
    } on PlatformException catch (e) {
      var error = e;
    }
  }

  showDialogueBox() => Get.defaultDialog(
          backgroundColor: Colors.white,
          barrierDismissible: false,
          title: "NO INTERNET",
          titleStyle: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20.sp, color: kBlack),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/404.gif",
                height: 250.h,
                width: 250..w,
              ),
              Text(
                "Please Check Your Internet Connectivity ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: kBlack),
              ),
              kHeight15,
            ],
          ),
          actions: <Widget>[
            TextButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(kBlack)),
                onPressed: () async {
                  Get.close(1);

                  isAlertSet.value = false;

                  isConnected.value =
                      await InternetConnectionChecker().hasConnection;
                  dashCtrl.dashBoardFetch(
                      data: dashCtrl.switcherIndex4.value == 1
                          ? dashCtrl.academicData
                          : dashCtrl.generalData);
                  if (!isConnected.value) {
                    showDialogueBox();

                    isAlertSet.value = true;
                  }
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: kWhite),
                ))
          ]);
  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
