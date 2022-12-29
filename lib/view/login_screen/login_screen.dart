import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ielts/view/common/common_widgets/background_onboarding/background_onboarding.dart';
import 'package:ielts/view/common/common_widgets/button_widget/button_widget.dart';

import 'package:ielts/view/registration_screen/widgets/text_form_fileds.dart';

import '../../dependency/dependency.dart';
import '../common/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenScreenState();
}

class _LoginScreenScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScrolling) {
          overScrolling.disallowIndicator();
          return true;
        },
        child: Stack(
          children: [
            const BackgroundClipperWidget(),
            SingleChildScrollView(
              child: SafeArea(
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
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: kBlack),
                            ),
                            kHeight15,
                            phoneNumber("Phone number"),
                            kHeight15,
                            email("Email"),
                          ],
                        ),
                      ),

                      kHeight35,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0).h,
                        child: buttonWidget(
                          "Login",
                          325,
                          () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              regCtrl.loginUser();
                            }
                          },
                        ),
                      ),
                      // const Spacer(
                      //   flex: 3,
                      // )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
