import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';

enum DialogType { success, failure, neutral }

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
      type: DialogType.success,
    );
  }

  static void failureDialog(
    BuildContext context, {
    required String title,
    required String content,
    required Function(BuildContext) onConfirm,
    Function(BuildContext)? onDeny,
    String confirmButtonText = 'Confirm',
    String? denyButtonText = 'Deny',
    bool clickOutsideToDismiss = false,
  }) {
    _showCustomDialog(
      context,
      title: title,
      content: content,
      onConfirm: onConfirm,
      onDeny: onDeny,
      clickOutsideToDismiss: clickOutsideToDismiss,
      confirmButtonText: confirmButtonText,
      denyButtonText: denyButtonText,
      icon: Icons.info,
      iconColor: context.appColors.error,
      type: DialogType.failure,
    );
  }

  static void showNeutralDialog(
    BuildContext context, {
    required String title,
    required String content,
    required Function(BuildContext) onConfirm,
    required Function(BuildContext) onDeny,
    String confirmButtonText = 'Okay',
    bool clickOutsideToDismiss = false,
  }) {
    _showCustomDialog(
      context,
      title: title,
      content: content,
      onConfirm: onConfirm,
      clickOutsideToDismiss: clickOutsideToDismiss,
      confirmButtonText: confirmButtonText,
      onDeny: onDeny,
      denyButtonText: "Cancel",
      icon: Icons.info,
      iconColor: context.appColors.primaryText,
      type: DialogType.neutral,
    );
  }

  static void _showCustomDialog(
    BuildContext context, {
    required DialogType type,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String content,
    required Function(BuildContext) onConfirm,
    Function(BuildContext)? onDeny,
    required bool clickOutsideToDismiss,
    required String confirmButtonText,
    String? denyButtonText = 'Deny',
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          elevation: 2,
          title: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                type == DialogType.success
                    ? Image.asset("lib/design/assets/icons/success.png")
                        .paddingBottomSpace(SpaceType.large)
                    : type == DialogType.failure
                        ? Image.asset("lib/design/assets/icons/error.png")
                            .paddingBottomSpace(SpaceType.large)
                        : const SizedBox.shrink(),
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
          titleTextStyle:
              context.appTextStyles.titleMedium.bold.apply(color: iconColor),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: context.appTextStyles.bodyMedium,
          actions: <Widget>[
            if (onDeny != null)
              SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    // Xử lý sự kiện hủy đặt chỗ
                    onDeny(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: context.appColors.error),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    denyButtonText ?? 'Deny',
                    style: context.appTextStyles.labelMedium.bold
                        .copyWith(color: context.appColors.error),
                  ),
                ),
              ),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý sự kiện đặt lại
                  onConfirm(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      context.appColors.brandPrimary, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  confirmButtonText,
                  style: context.appTextStyles.labelMedium.bold
                      .copyWith(color: context.appColors.whiteColor),
                ),
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
        );
      },
      barrierDismissible: clickOutsideToDismiss,
    );
  }
}
