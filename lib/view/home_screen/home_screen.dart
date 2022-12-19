import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.width * .4);
    var width = Get.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -100,
            top: -60,
            child: Container(
              height: width * 1.06,
              width: width * 1.06,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            left: -60,
            top: -60,
            child: Container(
              height: width * .92,
              width: width * .92,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
