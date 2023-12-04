import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    // ***************
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // ***************
    return SizedBox(
      width: width,
      height: height,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No shoes added", style: AppThemes.bagEmptyListTitle),
          SizedBox(height: 10),
          Text(
            "Once you have added, come back",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          )
        ],
      ),
    );
  }
}
