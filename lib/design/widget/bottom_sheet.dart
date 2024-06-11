import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:doctor_appointment/design/common/text_extention.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool scrollable;
  final List<Widget>? actions;
  final bool? isCustomSizeWithKeyBoard;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.child,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
    this.actions,
    this.isCustomSizeWithKeyBoard,
  }) : scrollable = true;

  const CustomBottomSheet.noScrollable({
    super.key,
    required this.title,
    required this.child,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
    this.actions,
    this.isCustomSizeWithKeyBoard,
  }) : scrollable = false;

  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    required bool scrollable,
    double initialChildSize = 0.6,
    double minChildSize = 0.5,
    double maxChildSize = 0.8,
    List<Widget>? actions,
    bool? isCustomSizeWithKeyBoard,
  }) {
    return showModalBottomSheet<T>(
      //backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: scrollable
              ? CustomBottomSheet(
                  title: title,
                  initialChildSize: initialChildSize,
                  minChildSize: minChildSize,
                  maxChildSize: maxChildSize,
                  actions: actions,
                  isCustomSizeWithKeyBoard: isCustomSizeWithKeyBoard ?? false,
                  child: child,
                )
              : CustomBottomSheet.noScrollable(
                  title: title,
                  initialChildSize: initialChildSize,
                  minChildSize: minChildSize,
                  maxChildSize: maxChildSize,
                  actions: actions,
                  isCustomSizeWithKeyBoard: isCustomSizeWithKeyBoard ?? false,
                  child: child,
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isShowingKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return scrollable
        ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              return (isShowingKeyBoard == true &&
                      isCustomSizeWithKeyBoard == true)
                  ? {}
                  : Navigator.of(context).pop();
            },
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: isCustomSizeWithKeyBoard == true
                  ? (isShowingKeyBoard ? 1 : initialChildSize)
                  : initialChildSize,
              minChildSize: isCustomSizeWithKeyBoard == true
                  ? (isShowingKeyBoard ? 1 : minChildSize)
                  : minChildSize,
              maxChildSize: isCustomSizeWithKeyBoard == true
                  ? (isShowingKeyBoard ? 1 : maxChildSize)
                  : maxChildSize,
              builder: (_, controller) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    color: context.appColors.borderColor,
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                            title: title,
                            isIconClose: (isCustomSizeWithKeyBoard == true &&
                                isShowingKeyBoard == true)),
                        Expanded(
                          child: ListView(
                            controller: controller,
                            children: [child],
                          ),
                        ),
                        if (actions != null && actions!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [...actions!],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: context.appColors.borderColor,
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BottomSheetHeader(
                      title: title,
                      isIconClose: (isCustomSizeWithKeyBoard == true &&
                          isShowingKeyBoard == true)),
                  child,
                  if (actions != null && actions!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [...actions!],
                      ),
                    ),
                ],
              ),
            ),
          );
  }
}

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key,
    required this.title,
    required this.isIconClose,
  });

  final String title;
  final bool isIconClose;

  @override
  Widget build(BuildContext context) {
    double height = 40;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              height: 4,
              width: 32,
              decoration: BoxDecoration(
                color: context.appColors.grayColorMedium,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 24,
              ),
              child: isIconClose
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: height,
                            child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.of(context).pop())),
                        Expanded(child: Container()),
                        Text(
                          title,
                          style: context.appTextStyles.titleLarge
                              .copyWith(color: context.appColors.brandPrimary),
                          textAlign: TextAlign.center,
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          width: height,
                        )
                      ],
                    )
                  : Text(
                      title,
                      style: context.appTextStyles.titleLarge.bold
                          .copyWith(color: context.appColors.brandPrimary),
                    ),
            ),
            const Divider(height: 1)
          ],
        ),
      ),
    );
  }
}
