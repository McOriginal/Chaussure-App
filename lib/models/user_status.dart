import 'package:flutter/material.dart';

class UserStatus {
  IconData emoji;
  String text;
  Color selecteColor;
  Color unSelecteColor;

  UserStatus({
    required this.emoji,
    required this.text,
    required this.selecteColor,
    required this.unSelecteColor,
  });
}
