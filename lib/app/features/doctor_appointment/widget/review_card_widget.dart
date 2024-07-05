import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: context.appColors.whiteColor,
                child: ClipOval(
                  child: SizedBox(
                    width: 44,
                    height: 44,
                    child: Image.asset(
                      "lib/design/assets/icons/fake_avatar_doctor.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Samantha",
                  style: context.appTextStyles.labelLarge.bold
                      .copyWith(color: context.appColors.primaryText),
                ),
              ),
              Text(
                "★ 4.8",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appTextStyles.labelLarge.bold
                    .copyWith(color: context.appColors.brandPrimary),
              ),
            ],
          ),
          Text(
            "Dr. Jennie Thorn is the most immunologists specialist in Royal Hospital at Phnom penh. She achieved several awards for her wonderful contributing in medical field. She is available for private consultation.   ",
            style: context.appTextStyles.labelMedium
                .copyWith(color: context.appColors.primaryText),
          ).paddingTopSpace(SpaceType.medium),
        ],
      ),
    );
  }
}
