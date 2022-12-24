import 'dart:math';

import 'package:flutter/material.dart';

////////////////////No Colors is in figma///////////////
///
///
///
///////Clipped Container to desired circle shape///////////
///
///
///
///
//////////TO DO ADD GRADIENT//////////////////////////
///
///
/////////Not Used This///////////
///
///
/////////Custom Painer class/////////

class CircleBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _CirclePainter(),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint2 = Paint();

    paint2.color = Colors.red;
    paint2.style = PaintingStyle.fill;

    final center2 = Offset(size.width / 1.25, size.height / 4.5);
    final radius2 = min(size.width, size.height) / 2;

    canvas.drawCircle(center2, radius2, paint2);
    final paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;

    final center = Offset(size.width / 3.5, size.height / 6);
    final radius = min(size.width, size.height) / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
