import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? right;
  const RoundTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText,
      this.right,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: context.appColors.textFieldColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        style: TextStyle(color: context.appColors.primaryText, fontSize: 16),
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          suffixIcon: right,
          hintStyle: TextStyle(
            color: context.appColors.secondaryText,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
