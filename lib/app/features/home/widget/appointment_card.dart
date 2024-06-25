import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String hospital;
  final String date;
  final String time;

  const AppointmentCard({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.hospital,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: context.appColors.brandPrimaryGradient,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: context.appColors.brandPrimary,
                child: ClipOval(
                  child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Image.asset(
                      "lib/design/assets/icons/avatar_fake.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ).paddingRightSpace(SpaceType.small),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: context.appTextStyles.titleMedium.bold
                        .copyWith(color: context.appColors.whiteColor),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '$specialty | $hospital',
                    style: context.appTextStyles.titleSmall
                        .copyWith(color: context.appColors.whiteColor),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: context.appColors.grayColorMedium.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                            "lib/design/assets/icons/calender.png")),
                    const SizedBox(width: 8.0),
                    Text(
                      date,
                      style: context.appTextStyles.titleSmall
                          .copyWith(color: context.appColors.whiteColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: context.appColors.grayColorMedium.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                            "lib/design/assets/icons/clock_card.png")),
                    const SizedBox(width: 8.0),
                    Text(
                      time,
                      style: context.appTextStyles.titleSmall
                          .copyWith(color: context.appColors.whiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
