import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BGCircleSecondClipper extends StatelessWidget {
  const BGCircleSecondClipper({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -60,
      top: -80,
      child: Transform.rotate(
        angle: 1.7,
        child: Container(
          height: width * .92,
          width: width * .92,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/homeCircle.png"),
                  fit: BoxFit.cover),
              shape: BoxShape.circle),
          // child: Center(),
        ),
      ),
    );
  }
}

class BgCircleFirstClipper extends StatelessWidget {
  const BgCircleFirstClipper({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -100,
      top: -100,
      child: Transform.rotate(
        angle: 11.8,
        child: Opacity(
          opacity: .8,
          child: Container(
            height: width * 1.06,
            width: width * 1.06,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homeCircle.png"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle),
            // child: Center(),
          ),
        ),
      ),
    );
  }
}
