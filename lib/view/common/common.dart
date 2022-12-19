import 'package:flutter/material.dart';
import 'package:get/get.dart';

final screenHeight = Get.height;
final screenWidth = Get.width;

BoxDecoration boxDecorSplash(String image) => BoxDecoration(
    image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover));
