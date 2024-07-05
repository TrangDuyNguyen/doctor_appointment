import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../design/utils/space_utils.dart';

class UserWidget extends HookWidget {
  /// TODO add your comment here
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isNotification = useState(true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4.0,
        title: Text(
          "My Profile",
          style: context.appTextStyles.titleMedium.bold,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: ClipOval(
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "lib/design/assets/icons/icon-menu.png",
                  color: context.appColors.brandPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22, // Set the radius to 28 to make the diameter 56
                  backgroundColor: context.appColors.brandPrimary,
                  child: ClipOval(
                    child: SizedBox(
                      width: 44,
                      height: 44,
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
                      "Stefani Wong",
                      style: context.appTextStyles.titleMedium.bold
                          .copyWith(color: context.appColors.primaryText),
                    ),
                    Text(
                      "Joined since 27 Dec 2020",
                      style: context.appTextStyles.labelMedium
                          .copyWith(color: context.appColors.primaryText),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox.shrink()),
                ElevatedButton(
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
                    'Edit',
                    style: context.appTextStyles.labelMedium.bold
                        .copyWith(color: context.appColors.whiteColor),
                  ),
                ),
              ],
            ).paddingTopSpace(SpaceType.medium),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: context.appColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: context.appColors.grayColorLight,
                      spreadRadius: 0.2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: context.appTextStyles.titleMedium.bold,
                  ),
                  Row(
                    children: [
                      Image.asset("lib/design/assets/icons/language.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Languages",
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ClipOval(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              "lib/design/assets/icons/arrow_right.png",
                              color: context.appColors.brandPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingTopSpace(SpaceType.medium),
                  Row(
                    children: [
                      Image.asset(
                        "lib/design/assets/icons/location.png",
                        color: context.appColors.brandPrimary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Country",
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ClipOval(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              "lib/design/assets/icons/arrow_right.png",
                              color: context.appColors.brandPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingTopSpace(SpaceType.medium)
                ],
              ),
            ).paddingTopSpace(SpaceType.large),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: context.appColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: context.appColors.grayColorLight,
                      spreadRadius: 0.2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification",
                    style: context.appTextStyles.titleMedium.bold,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "lib/design/assets/icons/icon_notification.png",
                        color: context.appColors.brandPrimary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Pop-up Notification",
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          isNotification.value = !isNotification.value;
                        },
                        child: Image.asset(
                          width: 36,
                          height: 18,
                          fit: BoxFit.fill,
                          isNotification.value
                              ? "lib/design/assets/icons/toggle_off.png"
                              : "lib/design/assets/icons/toggle_on.png",
                        ),
                      ),
                    ],
                  ).paddingTopSpace(SpaceType.medium),
                ],
              ),
            ).paddingTopSpace(SpaceType.medium),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: context.appColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: context.appColors.grayColorLight,
                      spreadRadius: 0.2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Others",
                    style: context.appTextStyles.titleMedium.bold,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "lib/design/assets/icons/about.png",
                        color: context.appColors.brandPrimary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "About Us",
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ClipOval(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              "lib/design/assets/icons/arrow_right.png",
                              color: context.appColors.brandPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingTopSpace(SpaceType.medium),
                  Row(
                    children: [
                      Image.asset(
                        "lib/design/assets/icons/customer_service.png",
                        color: context.appColors.brandPrimary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Customer Service",
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ClipOval(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              "lib/design/assets/icons/arrow_right.png",
                              color: context.appColors.brandPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingTopSpace(SpaceType.medium),
                  Row(
                    children: [
                      Image.asset(
                        "lib/design/assets/icons/invite_team.png",
                        color: context.appColors.brandPrimary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Invite Other",
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ClipOval(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              "lib/design/assets/icons/arrow_right.png",
                              color: context.appColors.brandPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingTopSpace(SpaceType.medium),
                  Row(
                    children: [
                      Image.asset(
                        "lib/design/assets/icons/logout.png",
                        color: context.appColors.error,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Logout",
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.error),
                        ),
                      ),
                    ],
                  ).paddingTopSpace(SpaceType.medium),
                ],
              ),
            ).paddingTopSpace(SpaceType.medium)
          ],
        ),
      ),
    );
  }
}
