import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path ovalPath = Path();
    // Start paint from 20% height to the left
    // ovalPath.moveTo(0, height * 0.2);
    ovalPath.lineTo(0, size.height / 1.3);
    // paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(
        size.width / 2, size.height / 1.4, size.width, size.height / 2.5);
    ovalPath.lineTo(size.width, 0);
    // Paint a curve from current position to bottom left of screen at width * 0.1
    // ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);

    // draw remaining line to bottom left side
    // ovalPath.lineTo(0, height / 2);

    // Close line to reset it back
    ovalPath.close();

    return ovalPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
