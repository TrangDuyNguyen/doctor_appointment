import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:doctor_appointment/design/common/text_extention.dart';
import 'package:flutter/material.dart';

enum RoundButtonType { primary, secondary }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;

  const RoundButton(
      {super.key,
      required this.title,
      this.type = RoundButtonType.primary,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.maxFinite,
        elevation: 0,
        color: type == RoundButtonType.primary
            ? context.appColors.brandPrimary
            : context.appColors.whiteColor,
        height: 60,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: context.appColors.tertiary, width: 1),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          style: context.appTextStyles.titleMedium.bold.copyWith(
            color: type == RoundButtonType.primary
                ? context.appColors.whiteColor
                : context.appColors.brandPrimary,
          ),
        ),
      ),
    );
  }
}
