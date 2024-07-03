import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: context.width * 0.3,
            height: context.width * 0.3,
            child: Image.asset("lib/design/assets/icons/no_result.png")),
        Text(
          "No Result Found",
          style: context.appTextStyles.titleMedium.bold,
        )
      ],
    );
  }
}
