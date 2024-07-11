import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_routing_mixin.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScheduledAppointmentDetailView extends HookWidget with AppRoutingMixin {
  const ScheduledAppointmentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    const String status = "Completed";
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            pop(context);
          },
          child: Image.asset(
            "lib/design/assets/icons/back.png",
            width: 24,
            height: 24,
          ),
        ),
        title: Text(
          "Dr. Jennie Thorn",
          style: context.appTextStyles.titleMedium.bold,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: ClipOval(
              child: SizedBox(
                width: 36,
                height: 36,
                child: Image.asset(
                  "lib/design/assets/icons/icon-menu.png",
                  color: context.appColors.brandPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                              "DR Williem Smith",
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
                                  'Dentist |',
                                  style: context.appTextStyles.labelMedium
                                      .copyWith(
                                          color:
                                              context.appColors.secondaryText),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: status == "Upcoming"
                                          ? context.appColors.waning
                                              .withOpacity(0.2)
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
                                    style: context
                                        .appTextStyles.labelMedium.bold
                                        .copyWith(
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
                              "Royal Hospital, Phonm Penh",
                              style: context.appTextStyles.labelMedium.copyWith(
                                  color: context.appColors.secondaryText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "Schedule Appointment",
              style: context.appTextStyles.titleMedium.bold,
            ).paddingTopSpace(SpaceType.medium),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/design/assets/icons/icon_calendar.png",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Monday August 17, 2023",
                  style: context.appTextStyles.labelLarge
                      .copyWith(color: context.appColors.primaryText),
                )
              ],
            ).paddingTopSpace(SpaceType.medium),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/design/assets/icons/clock.png",
                  width: 24,
                  height: 24,
                  color: context.appColors.secondaryText,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "11:00 AM",
                    style: context.appTextStyles.labelLarge,
                  ),
                )
              ],
            ).paddingTopSpace(SpaceType.medium),
            Text(
              "Patient Information",
              style: context.appTextStyles.titleMedium.bold,
            ).paddingTopSpace(SpaceType.medium),
            Table(
              columnWidths: const {
                0: IntrinsicColumnWidth(), // Adjusts to the content of the key column
                1: FixedColumnWidth(20.0), // Width for the colon column
                2: FlexColumnWidth(), // Takes up remaining space for the value column
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Full Name',
                        style: context.appTextStyles.labelLarge,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(':'),
                    ),
                    Text(
                      'Samata Shin',
                      style: context.appTextStyles.labelLarge,
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    SizedBox(height: 10), // Khoảng cách giữa các dòng
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Age',
                        style: context.appTextStyles.labelLarge,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(':'),
                    ),
                    Text(
                      '27',
                      style: context.appTextStyles.labelLarge,
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    SizedBox(height: 10), // Khoảng cách giữa các dòng
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Gender',
                        style: context.appTextStyles.labelLarge,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(':'),
                    ),
                    Text(
                      'Female',
                      style: context.appTextStyles.labelLarge,
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    SizedBox(height: 10), // Khoảng cách giữa các dòng
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Problem',
                        style: context.appTextStyles.labelLarge,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(':'),
                    ),
                    Text(
                      'Hello, simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                      style: context.appTextStyles.labelLarge,
                    ),
                  ],
                ),
              ],
            ).paddingTopSpace(SpaceType.medium),
          ],
        ),
      ),
      bottomNavigationBar: status == "Upcoming"
          ? Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, context.bottomSpacer),
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    //context.push(AppPage.bookAppointment.getPath);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.appColors.error, // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    'CANCEL',
                    style: context.appTextStyles.labelLarge.bold
                        .copyWith(color: context.appColors.whiteColor),
                  ),
                ),
              ),
            )
          : status == "Cancelled"
              ? Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, context.bottomSpacer),
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        //context.push(AppPage.bookAppointment.getPath);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            context.appColors.brandPrimary, // Màu nền của nút
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Book Again',
                        style: context.appTextStyles.labelLarge.bold
                            .copyWith(color: context.appColors.whiteColor),
                      ),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, context.bottomSpacer),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              // Xử lý sự kiện hủy đặt chỗ
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: context.appColors.brandPrimary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
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
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              // Xử lý sự kiện đặt lại
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context
                                  .appColors.brandPrimary, // Màu nền của nút
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
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
                      ),
                    ],
                  ),
                ),
    );
  }
}
