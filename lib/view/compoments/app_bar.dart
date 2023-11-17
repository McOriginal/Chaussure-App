import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:chaussure/utils/constants.dart';
import 'package:flutter/material.dart';

AppBar CustomDetailViewsAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: const Text(
      "Nike",
      style: AppThemes.detailsAppBar,
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: AppConstantsColor.darkTextColor,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite_border,
        ),
      ),
    ],
  );
}
