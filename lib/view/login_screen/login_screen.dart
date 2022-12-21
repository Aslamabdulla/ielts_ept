import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/view/common/background_clipper/background_clipper.dart';
import 'package:ielts/view/common/background_onboarding/background_onboarding.dart';
import 'package:ielts/view/common/button_widget/button_widget.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/course_selection_screen/widgets/choice.dart';
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
      body: Stack(
        children: [
          const BackgroundClipperWidget(),
          SafeArea(
            child: SingleChildScrollView(
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
                    buttonWidget(
                      "Login",
                      325,
                      () {
                        if (formKey.currentState!.validate()) {
                          regCtrl.loginUser();
                        }
                        // ApiCalls().postRequest("register");
                        // print(regCtrl.email);
                        // print(regCtrl.name);
                        // print(regCtrl.phoneNum);
                      },
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
    );
  }
}
