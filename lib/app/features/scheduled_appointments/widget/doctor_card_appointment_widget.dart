import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';

class DoctorCardAppointmentWidget extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String dateBook;
  final String status;
  final String avatar;

  const DoctorCardAppointmentWidget(
      {super.key,
      required this.doctorName,
      required this.specialty,
      required this.dateBook,
      required this.status,
      required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      decoration: BoxDecoration(
          color: context.appColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: context.appColors.grayColorLight,
              spreadRadius: 0.2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 37,
                backgroundColor: context.appColors.whiteColor,
                child: ClipOval(
                  child: SizedBox(
                    width: 74,
                    height: 74,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.labelLarge.bold,
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '$specialty |',
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: status == "Upcoming"
                                  ? context.appColors.waning.withOpacity(0.2)
                                  : status == "Completed"
                                      ? context.appColors.success
                                          .withOpacity(0.2)
                                      : context.appColors.error
                                          .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            status,
                            style:
                                context.appTextStyles.labelMedium.bold.copyWith(
                              color: status == "Upcoming"
                                  ? context.appColors.waning
                                  : status == "Completed"
                                      ? context.appColors.success
                                      : context.appColors.error,
                            ),
                          ),
                        ).paddingLeftSpace(SpaceType.small),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      dateBook,
                      style: context.appTextStyles.labelMedium
                          .copyWith(color: context.appColors.secondaryText),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: context.appColors.borderColor,
          ).paddingTopSpace(SpaceType.small),
          status == "Upcoming"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Xử lý sự kiện hủy đặt chỗ
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: context.appColors.error),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Cancel Booking',
                          style: context.appTextStyles.labelMedium.bold
                              .copyWith(color: context.appColors.error),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Xử lý sự kiện đặt lại
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              context.appColors.brandPrimary, // Màu nền của nút
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Reschedule',
                          style: context.appTextStyles.labelMedium.bold
                              .copyWith(color: context.appColors.whiteColor),
                        ),
                      ),
                    ),
                  ],
                ).paddingTopSpace(SpaceType.small)
              : status == "Completed"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // Xử lý sự kiện hủy đặt chỗ
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: context.appColors.brandPrimary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Rating',
                              style: context.appTextStyles.labelMedium.bold
                                  .copyWith(
                                      color: context.appColors.brandPrimary),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Xử lý sự kiện đặt lại
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context
                                  .appColors.brandPrimary, // Màu nền của nút
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Book Again',
                              style: context.appTextStyles.labelMedium.bold
                                  .copyWith(
                                      color: context.appColors.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ).paddingTopSpace(SpaceType.small)
                  : Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Xử lý sự kiện đặt lại
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context
                                  .appColors.brandPrimary, // Màu nền của nút
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Book Again',
                              style: context.appTextStyles.labelMedium.bold
                                  .copyWith(
                                      color: context.appColors.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ).paddingTopSpace(SpaceType.small)
        ],
      ),
    );
  }
}
