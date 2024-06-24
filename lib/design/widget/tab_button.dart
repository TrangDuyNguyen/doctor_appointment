import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelect;
  final VoidCallback onPressed;

  const TabButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              child: Image.asset(
                fit: BoxFit.fill,
                icon,
                width: 30,
                height: 30,
                color: isSelect
                    ? context.appColors.brandPrimary
                    : context.appColors.secondaryText,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelect
                    ? context.appColors.brandPrimary
                    : context.appColors.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ));
  }
}
