import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseTextInputField extends HookWidget {
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

  /// forcus node
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

  /// ==================================

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> mShowErrorIconNotifier = useValueNotifier<bool>(false);
    ValueNotifier<bool> mHasInputNotifier = useValueNotifier<bool>(false);
    ValueNotifier<bool> mIsShowPassword = useValueNotifier<bool>(false);
    final mTextController = useState(controller ?? TextEditingController());
    useEffect(() {
      mTextController.addListener(() {
        mHasInputNotifier.value = mTextController.value.text.isNotEmpty &&
            !mShowErrorIconNotifier.value;
      });
      return null;
    }, [mTextController]);

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
            color: !mHasInputNotifier.value
                ? context.appColors.borderColor
                : mIsShowPassword.value
                    ? context.appColors.error
                    : context.appColors.brandSecondary),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: mTextController.value,
        keyboardType: textInputType,
        obscureText: isObscureText == true ? mIsShowPassword.value : false,
        decoration: createTextInputDecoration(
          context,
          mTextController.value,
          mIsShowPassword,
          mShowErrorIconNotifier,
          mHasInputNotifier,
        ),
        validator: (value) {
          return validateInput(
            value,
            context,
            mTextController.value,
            mShowErrorIconNotifier,
          );
        },
        autovalidateMode: mAutoValidateMode,
      ),
    );
  }

  Widget _obscureTextIcon(ValueNotifier<bool> isShowPassword) {
    return IconButton(
      icon:
          Icon(isShowPassword.value ? Icons.visibility : Icons.visibility_off),
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
          ));
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
      labelText: labelText,
      labelStyle: TextStyle(
        color: context.appColors.secondaryText,
        fontSize: 14,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isObscureText == true) _obscureTextIcon(mIsShowPassword),
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
    ValueNotifier<bool> _mShowErrorIconNotifier,
  ) {
    final messageValidate = validator?.call(value, context);
    if (value != null && value.isNotEmpty) {
      _mShowErrorIconNotifier.value = messageValidate != null;
    } else {
      _mShowErrorIconNotifier.value = false;
    }
    return messageValidate;
  }
}
