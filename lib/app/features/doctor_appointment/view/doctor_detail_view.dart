import 'package:doctor_appointment/app/core/router/app_page.dart';
import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../widget/review_card_widget.dart';

class DoctorDetailView extends HookWidget with AppRoutingMixin {
  const DoctorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var selected = useState(false);
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
            onTap: () {
              selected.value = !selected.value;
            },
            child: ClipOval(
              child: SizedBox(
                width: 36,
                height: 36,
                child: Image.asset(
                  selected.value
                      ? "lib/design/assets/icons/heart_select.png"
                      : "lib/design/assets/icons/heart_unselect.png",
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
              decoration: BoxDecoration(
                color: context.appColors.brandPrimary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. Jennie Thorn",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.appTextStyles.labelLarge.bold,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  'Dentist',
                                  style: context.appTextStyles.labelMedium
                                      .copyWith(
                                          color: context.appColors.primaryText),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  'Royal Hospital, Phonm Penh',
                                  style: context.appTextStyles.labelMedium
                                      .copyWith(
                                          color: context.appColors.primaryText),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox.shrink(),
                        ]),
                        const SizedBox(height: 4.0),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.appColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "180 cm",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTextStyles.labelLarge.bold
                                .copyWith(
                                    color: context.appColors.brandPrimary),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Patient",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTextStyles.labelLarge.copyWith(
                                color: context.appColors.secondaryText),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.appColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "10Y+",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTextStyles.labelLarge.bold
                                .copyWith(
                                    color: context.appColors.brandPrimary),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Experience",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTextStyles.labelLarge.copyWith(
                                color: context.appColors.secondaryText),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.appColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "★ 4.8",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTextStyles.labelLarge.bold
                                .copyWith(
                                    color: context.appColors.brandPrimary),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rating",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTextStyles.labelLarge.copyWith(
                                color: context.appColors.secondaryText),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingTopSpace(SpaceType.medium),
            Text(
              "About me",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.primaryText),
            ).paddingTopSpace(SpaceType.medium),
            Text(
              "Dr. Jennie Thorn is the most immunologists specialist in Royal Hospital at Phnom penh. She achieved several awards for her wonderful contributing in medical field. ",
              style: context.appTextStyles.labelLarge
                  .copyWith(color: context.appColors.primaryText),
            ).paddingTopSpace(SpaceType.medium),
            Text(
              "Working Information",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.primaryText),
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
                  "Monday - Friday, 08:00 AM - 21:00 PM",
                  style: context.appTextStyles.labelLarge
                      .copyWith(color: context.appColors.primaryText),
                )
              ],
            ).paddingTopSpace(SpaceType.medium),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/design/assets/icons/icon_location.png",
                  width: 24,
                  height: 24,
                  color: context.appColors.secondaryText,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "13th Street. 47 W 13th St, New York, NY 10011, USA. 20 Cooper Square. 20 Cooper Square, New York",
                    style: context.appTextStyles.labelLarge
                        .copyWith(color: context.appColors.link),
                  ),
                )
              ],
            ).paddingTopSpace(SpaceType.medium),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Review",
                  style: context.appTextStyles.titleMedium.bold
                      .copyWith(color: context.appColors.primaryText),
                ),
                const Spacer(),
                Text(
                  "SEE ALL",
                  style: context.appTextStyles.titleSmall.bold
                      .copyWith(color: context.appColors.brandPrimary),
                )
              ],
            ).paddingTopSpace(SpaceType.medium),
            ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const ReviewCardWidget(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: 3)
                .paddingVerticalSpace(SpaceType.medium)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, context.bottomSpacer),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              context.push(AppPage.bookAppointment.getPath);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  context.appColors.brandPrimary, // Màu nền của nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Text(
              'BOOK APPOINTMENT',
              style: context.appTextStyles.labelLarge.bold
                  .copyWith(color: context.appColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
