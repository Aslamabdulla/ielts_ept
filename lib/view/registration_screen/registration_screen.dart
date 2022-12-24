import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/view/common/common_widgets/background_onboarding/background_onboarding.dart';
import 'package:ielts/view/common/common_widgets/button_widget/button_widget.dart';

import 'package:ielts/view/registration_screen/widgets/text_form_fileds.dart';

import '../../dependency/dependency.dart';
import '../common/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScrolling) {
          overScrolling.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const BackgroundClipperWidget(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100).r,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 100.h,
                        width: 100.w,
                      ),
                      kHeight35,

                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Text(
                              "Registration",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: kBlack),
                            ),
                            kHeight15,
                            name("Name"),
                            kHeight15,
                            phoneNumber("Phone number"),
                            kHeight15,
                            email("Email"),
                          ],
                        ),
                      ),

                      kHeight35,
                      buttonWidget(
                        "Register",
                        325,
                        () {
                          FocusScope.of(context).unfocus();

                          if (formKey.currentState!.validate()) {
                            regCtrl.isLoading.value = true;
                            regCtrl.registerUser();
                          }
                        },
                      ),

                      // const Spacer(
                      //   flex: 3,
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
