import 'package:flutter/material.dart';

class CustomSnackBars {
  CustomSnackBars._();
  static successSnackBar() => SnackBar(
        backgroundColor: Colors.green[400],
        content: const Text("Successfully added to your bag!"),
        action: SnackBarAction(
          textColor: Colors.white,
          label: "Got it",
          onPressed: () {},
        ),
      );
  static failedSnackBar() => SnackBar(
        backgroundColor: Colors.red[400],
        content: const Text("You have added this before !"),
        action: SnackBarAction(
          label: "Go it",
          textColor: Colors.white,
          onPressed: () {},
        ),
      );
}
