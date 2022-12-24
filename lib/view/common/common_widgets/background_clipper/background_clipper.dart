import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path ovalPath = Path();

    ovalPath.lineTo(0, size.height / 1.3);

    ovalPath.quadraticBezierTo(
        size.width / 2, size.height / 1.4, size.width, size.height / 2.2);
    ovalPath.lineTo(size.width, 0);

    ovalPath.close();

    return ovalPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BackgroundClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path ovalPath = Path();

    ovalPath.lineTo(0, size.height / 1.3);

    ovalPath.quadraticBezierTo(
        size.width / 2, size.height / 1.4, size.width, size.height / 2.2);
    ovalPath.lineTo(size.width, 0);

    ovalPath.close();

    return ovalPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
