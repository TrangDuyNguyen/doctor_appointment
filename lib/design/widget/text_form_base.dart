import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showErrorIconProvider = StateProvider.autoDispose<bool>((ref) => false);
final hasInputProvider = StateProvider.autoDispose<bool>((ref) => false);
final isShowPasswordProvider = StateProvider.autoDispose<bool>((ref) => false);
final textControllerProvider = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class BaseTextInputField extends ConsumerWidget {
  final bool? isObscureText;
  final TextAlign? textAlign;
  final bool? disable;
  final bool? isAutoValidate;
  final String? labelText;

  final bool? isRequire;
  final String? name;
  final TextEditingController? controller;
  final Function(String? value, BuildContext context)? validator;
  final Function(String? value, BuildContext context)? errorMessageOnValidation;

  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  final void Function()? onTap;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final bool? enableClearText;

  /// focus node
  final FocusNode? focusNode;
  final bool autoFocus;

  const BaseTextInputField({
    super.key,
    this.textAlign,
    this.isObscureText = false,
    this.focusNode,
    this.autoFocus = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onTap,
    this.controller,
    this.validator,
    this.isRequire,
    this.name,
    this.disable,
    this.labelText,
    required this.isAutoValidate,
    required this.errorMessageOnValidation,
    this.textInputType,
    this.prefixIcon,
    this.enableClearText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showErrorIcon = ref.watch(showErrorIconProvider.notifier);
    final hasInput = ref.watch(hasInputProvider.notifier);
    final isShowPassword = ref.watch(isShowPasswordProvider.notifier);
    final textController = ref.watch(textControllerProvider.notifier);

    if (controller != null) {
      textController.state = controller!;
    }

    textController.state.addListener(() {
      hasInput.state =
          textController.state.text.isNotEmpty && !showErrorIcon.state;
    });

    final mAutoValidateMode = isAutoValidate == true
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled;

    return Container(
      height: 56,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: context.appColors.textFieldColor.withOpacity(0.5),
        border: Border.all(
            width: 1,
            color: !hasInput.state
                ? context.appColors.borderColor
                : showErrorIcon.state
                    ? context.appColors.error
                    : context.appColors.brandSecondary),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: textController.state,
        keyboardType: textInputType,
        style: context.appTextStyles.labelLarge,
        obscureText: isObscureText == true ? isShowPassword.state : false,
        decoration: createTextInputDecoration(
          context,
          textController.state,
          isShowPassword,
          showErrorIcon,
          hasInput,
        ),
        validator: (value) {
          return validateInput(
            value,
            context,
            textController.state,
            showErrorIcon,
          );
        },
        autovalidateMode: mAutoValidateMode,
      ),
    );
  }

  Widget _obscureTextIcon(StateController<bool> isShowPassword) {
    return IconButton(
      icon:
          Icon(isShowPassword.state ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        isShowPassword.state = !isShowPassword.state;
      },
    );
  }

  Widget _errorIcon(String value, BuildContext context) {
    return Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(errorMessageOnValidation?.call(value, context) ?? ''),
              ),
            );
          },
          icon: Icon(
            Icons.error,
            color: context.appColors.error,
          ));
    });
  }

  InputDecoration createTextInputDecoration(
    BuildContext context,
    TextEditingController mController,
    StateController<bool> mIsShowPassword,
    StateController<bool> mShowErrorIconNotifier,
    StateController<bool> mHasInputNotifier,
  ) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        color: context.appColors.secondaryText,
        fontSize: 14,
      ),
      floatingLabelBehavior:
          FloatingLabelBehavior.auto, // Ensures label floats appropriately
      prefixIcon: prefixIcon,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isObscureText == true) _obscureTextIcon(mIsShowPassword),
          if (mShowErrorIconNotifier.state)
            _errorIcon(mController.text, context),
          if (enableClearText == true && mHasInputNotifier.state)
            IconButton(
              onPressed: () {
                mController.clear();
                mShowErrorIconNotifier.state = false;
              },
              icon: const Icon(Icons.highlight_remove_sharp),
            ),
        ],
      ),
      suffixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
    );
  }

  String? validateInput(
    String? value,
    BuildContext context,
    TextEditingController mController,
    StateController<bool> mShowErrorIconNotifier,
  ) {
    final messageValidate = validator?.call(value, context);
    if (value != null && value.isNotEmpty) {
      mShowErrorIconNotifier.state = messageValidate != null;
    } else {
      mShowErrorIconNotifier.state = false;
    }
    return messageValidate;
  }
}
