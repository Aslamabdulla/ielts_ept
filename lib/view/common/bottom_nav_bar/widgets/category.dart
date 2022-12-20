import 'package:flutter/material.dart';

class Category {
  final String title;
  IconData icons;
  bool isSelected;
  Category(
    this.title,
    this.icons,
    this.isSelected,
  );
}
