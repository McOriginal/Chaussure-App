import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:chaussure/utils/constants.dart';
import 'package:flutter/material.dart';

AppBar HomeAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Decouvrir",
        style: AppThemes.homeAppBar,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          size: 25,
          color: AppConstantsColor.darkTextColor,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_none,
          size: 25,
          color: AppConstantsColor.darkTextColor,
        ),
      ),
    ],
  );
}
