import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:chaussure/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedListTile extends StatelessWidget {
  const RoundedListTile(
      {super.key,
      this.leadingBackColor,
      required this.icon,
      required this.title,
      required this.trailing});

// ****************
  final Color? leadingBackColor;
  final IconData icon;
  final String title;
  final Widget trailing;
// ****************

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: leadingBackColor,
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: AppConstantsColor.ligthTextColor,
                ),
              ),
            ),
            title: Text(
              title,
              style: AppThemes.profileRepeatedListTitleTitle,
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
