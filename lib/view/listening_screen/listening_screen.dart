import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';

import 'package:ielts/view/common/background_onboarding/background_onboarding.dart';

import 'package:ielts/view/course_selection_screen/course_selection_screen.dart';

import 'package:ielts/view/navigation_router/navigation_route.dart';

class ListeningScreen extends StatelessWidget {
  const ListeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundClipperWidget(),
        ],
      ),
    );
  }
}
