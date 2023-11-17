import 'package:chaussure/utils/constants.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  // Home
  static const TextStyle homeAppBar = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppConstantsColor.darkTextColor);

  static const TextStyle homeProductName = TextStyle(
    color: AppConstantsColor.ligthTextColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle homeProductModel = TextStyle(
    color: AppConstantsColor.ligthTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static const TextStyle homeProductPrice = TextStyle(
    color: AppConstantsColor.ligthTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle homeMoreText = TextStyle(
    fontSize: 22,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle homeGridNewText = TextStyle(
    color: AppConstantsColor.ligthTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle homeGridNameAndModel = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle homeGridPrice = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );

  // DEtails
  static const TextStyle detailsAppBar = TextStyle(
    color: AppConstantsColor.ligthTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  static const TextStyle detailsMorText = TextStyle(
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    height: 1,
  );

  static const TextStyle detailsProductPrice = TextStyle(
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    height: 1,
  );

  static TextStyle detailsProductDescription =
      TextStyle(color: Colors.grey[600]);

// Bags

  static const TextStyle bagEmptyListTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bagTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );

  static const TextStyle bagProductModel = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle bagProductPrice = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle bagProductNumOfShoe = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bagTotalPrice = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle bagSumOfItemOnBag = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppConstantsColor.darkTextColor,
  );

  // Profile
  static const TextStyle profileAppBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle profileRepeatedListTitleTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );

  static const TextStyle profileDevName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );
}
