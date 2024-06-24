import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:doctor_appointment/design/widget/round_button.dart';
import 'package:flutter/material.dart';

class DialogHelpers {
  DialogHelpers._();

  static void showSuccessDialog(
    BuildContext context, {
    required String title,
    required String content,
    required Function(BuildContext) onConfirm,
    bool clickOutsideToDismiss = false,
    String confirmButtonText = 'Close',
  }) {
    _showCustomDialog(
      context,
      title: title,
      content: content,
      onConfirm: onConfirm,
      clickOutsideToDismiss: clickOutsideToDismiss,
      confirmButtonText: confirmButtonText,
      icon: Icons.check_circle,
      iconColor: context.appColors.brandPrimary,
      pathIcon: "lib/design/assets/icons/success.png",
    );
  }

  static void failureDialog(
    BuildContext context, {
    required String title,
    required String content,
    required Function(BuildContext) onConfirm,
    Function(BuildContext)? onDeny,
    String? denyButtonText = 'Cancel',
    bool clickOutsideToDismiss = false,
  }) {
    _showCustomDialog(
      context,
      title: title,
      isFailure: true,
      content: content,
      onConfirm: onConfirm,
      clickOutsideToDismiss: clickOutsideToDismiss,
      denyButtonText: denyButtonText,
      icon: Icons.info,
      iconColor: context.appColors.error,
      pathIcon: "lib/design/assets/icons/error.png",
    );
  }

  static void _showCustomDialog(
    BuildContext context, {
    required String pathIcon,
    IconData? icon,
    Color? iconColor,
    bool isFailure = false,
    required String title,
    required String content,
    required Function(BuildContext) onConfirm,
    required bool clickOutsideToDismiss,
    String? confirmButtonText,
    String? denyButtonText = 'Deny',
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          elevation: 20,
          title: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  pathIcon,
                  width: context.width * 0.32,
                  height: context.width * 0.32,
                ).paddingBottomSpace(SpaceType.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: iconColor),
                    Text(title).paddingLeftSpace(SpaceType.small),
                  ],
                ),
              ],
            ),
          ),
          titleTextStyle: context.appTextStyles.titleMedium.bold
              .apply(color: isFailure ? context.appColors.error : iconColor),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: context.appTextStyles.bodyMedium,
          actions: <Widget>[
            !isFailure
                ? RoundButton(
                        title: confirmButtonText ?? 'Confirm',
                        onPressed: () => onConfirm(context))
                    .paddingBottomSpace(SpaceType.medium)
                : RoundButton(
                    type: RoundButtonType.secondary,
                    title: denyButtonText ?? 'Cancel',
                    onPressed: () => onConfirm(context)),
          ],
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
        );
      },
      barrierDismissible: clickOutsideToDismiss,
    );
  }
}
