import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseTextInputField extends HookWidget {
  final bool isObscureText;
  final TextAlign? textAlign;
  final bool? disable;
  final bool isAutoValidate;
  final String? labelText;

  final bool? isRequire;
  final String? name;
  final TextEditingController? controller;
  final String? Function(String? value, BuildContext context)? validator;
  final String? Function(String? value, BuildContext context)?
      errorMessageOnValidation;

  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  final void Function()? onTap;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final bool? enableClearText;
  final bool readOnly;

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
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(isObscureText);
    final showErrorIconNotifier = useState(false);
    final hasInputNotifier = useState(false);
    final textController = useState(controller ?? TextEditingController());

    useEffect(() {
      textController.value.addListener(() {
        hasInputNotifier.value = textController.value.text.isNotEmpty &&
            !showErrorIconNotifier.value;
      });
      return null;
    }, [textController.value]);

    final autoValidateMode = isAutoValidate
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled;

    return TextFormField(
      controller: textController.value,
      keyboardType: textInputType,
      focusNode: focusNode,
      obscureText: obscureText.value,
      readOnly: readOnly,
      onTap: onTap,
      decoration: createTextInputDecoration(
        context,
        textController.value,
        obscureText,
        showErrorIconNotifier,
        hasInputNotifier,
      ),
      validator: (value) {
        return validateInput(
          value,
          context,
          textController.value,
          showErrorIconNotifier,
        );
      },
      autovalidateMode: autoValidateMode,
    );
  }

  Widget _obscureTextIcon(ValueNotifier<bool> isShowPassword) {
    return IconButton(
      icon:
          Icon(isShowPassword.value ? Icons.visibility_off : Icons.visibility),
      onPressed: () {
        isShowPassword.value = !isShowPassword.value;
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
        ),
      );
    });
  }

  InputDecoration createTextInputDecoration(
    BuildContext context,
    TextEditingController mController,
    ValueNotifier<bool> mIsShowPassword,
    ValueNotifier<bool> mShowErrorIconNotifier,
    ValueNotifier<bool> mHasInputNotifier,
  ) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: context.appColors.grayColorMedium)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: context.appColors.error)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: context.appColors.error)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: context.appColors.brandPrimary)),
      labelText: labelText,
      labelStyle: TextStyle(
        color: context.appColors.secondaryText,
        fontSize: 14,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isObscureText) _obscureTextIcon(mIsShowPassword),
          ValueListenableBuilder<bool>(
            valueListenable: mShowErrorIconNotifier,
            builder: (context, showErrorIcon, child) {
              if (showErrorIcon) {
                return _errorIcon(mController.text, context);
              }
              return const SizedBox.shrink();
            },
          ),
          if (enableClearText == true)
            ValueListenableBuilder<bool>(
              valueListenable: mHasInputNotifier,
              builder: (context, hasInput, child) {
                if (hasInput) {
                  return IconButton(
                    onPressed: () {
                      mController.clear();
                      mShowErrorIconNotifier.value = false;
                    },
                    icon: const Icon(Icons.highlight_remove_sharp),
                  );
                }
                return const SizedBox.shrink();
              },
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
    ValueNotifier<bool> mShowErrorIconNotifier,
  ) {
    final messageValidate = validator?.call(value, context);
    if (value != null && value.isNotEmpty) {
      mShowErrorIconNotifier.value = messageValidate != null;
    } else {
      mShowErrorIconNotifier.value = false;
    }
    return messageValidate;
  }
}
