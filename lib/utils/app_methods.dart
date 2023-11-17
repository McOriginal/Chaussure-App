import 'package:chaussure/compoments/custom_snack_bar.dart';
import 'package:chaussure/data/dummy_data.dart';
import 'package:chaussure/models/models.dart';
import 'package:flutter/material.dart';

class AppMethods {
  AppMethods._();

  // this function used for adding product to bag or cart list

  static void addToCart(ShoeModel data, BuildContext context) {
    // if its tru we have that item already ontherwise we will add it inside
    bool contains = itemsOnBag.contains(data);

    if (contains) {
      // we have it

      // Error SnackBar ********
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.failedSnackBar());
    }

    // Successfully SnackBar ***********************
    else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.successSnackBar());
    }
  }

  static double allItemsOnBags() {
    double sumPrice = 0.0;
    for (ShoeModel item in itemsOnBag) {
      sumPrice = sumPrice + item.price;
      // sumPrice += item.price;
    }
    return sumPrice;
  }
}
