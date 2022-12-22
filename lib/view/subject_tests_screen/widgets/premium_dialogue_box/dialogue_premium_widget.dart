import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/widgets/premium_dialogue_box/widgets/row_widget.dart';

class DialogueBoxPremiumWidget extends StatelessWidget {
  final String package;
  final Color color;
  const DialogueBoxPremiumWidget({
    Key? key,
    required this.package,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 20, right: 12, top: 10, bottom: 16).r,
      decoration: kboxDecorationDialogue(color),
      height: 320.h,
      width: 280.w,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  package,
                  style: centerTextSubjectDialogue,
                )),
            Text(
              "Lörem ipsum birat doskade nån joktigt. Fuliga mynat för att polyning befanas. Pev dide därför att ofun.",
              style: kDialogueWhiteSubText,
              maxLines: 3,
            ),
            kHeight5,
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rs 2000/ Month",
                  style: centerTextSubjectDialogue,
                )),
            kHeight25,
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                    height: 150.h,
                    width: 234.w,
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 25.0, left: 15, right: 15)
                              .r,
                      child: Column(
                          children: List.generate(
                              iconDialogueText.length,
                              (index) => DialogueSubRowWidget(
                                  leading: iconDialogue[index],
                                  text: iconDialogueText[index]))),
                    )),
                Positioned(
                  top: -20.h,
                  child: Material(
                    borderRadius: BorderRadius.circular(37.84.r),
                    elevation: 5,
                    child: Container(
                      height: 32.h,
                      width: 234.w,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(37.84.r)),
                      child: Center(
                        child: Text(
                          "ADD",
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
