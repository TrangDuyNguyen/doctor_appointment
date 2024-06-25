import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/appointment_card.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchFocusNote = useFocusNode();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Welcome Back,",
                        style: context.appTextStyles.titleMedium
                            .copyWith(color: context.appColors.secondaryText),
                      ),
                      Text(
                        "Stefani Wong",
                        style: context.appTextStyles.titleMedium.bold
                            .copyWith(color: context.appColors.primaryText),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Stack(children: [
                    InkWell(
                      onTap: () {},
                      child: ClipOval(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(
                            "lib/design/assets/icons/icon_notification.png",
                            color: context.appColors.brandPrimary,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: context.appColors.error,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    onTap: () {},
                    child: ClipOval(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          "lib/design/assets/icons/heart.png",
                          color: context.appColors.brandPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: context.appColors.grayColorLight.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/design/assets/icons/search.png",
                      color: context.appColors.secondaryText,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        focusNode: searchFocusNote,
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: context.appTextStyles.titleMedium
                                .copyWith(
                                    color: context.appColors.secondaryText),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 18.0),
                      child: Container(
                        height: 20,
                        width: 1,
                        color: context.appColors.secondaryText,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "lib/design/assets/icons/filter.png",
                        color: context.appColors.brandPrimary,
                      ),
                    )
                  ],
                ),
              ).paddingTopSpace(SpaceType.large),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Appointment ",
                    style: context.appTextStyles.titleMedium.bold,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "SEE ALL",
                      style: context.appTextStyles.titleMedium.bold
                          .copyWith(color: context.appColors.brandPrimary),
                    ),
                  ),
                ],
              ).paddingTopSpace(SpaceType.medium),
              SizedBox(
                height: 160,
                child: PageView(
                  children: const [
                    AppointmentCard(
                      doctorName: "DR Williem Smith",
                      specialty: "Dentist",
                      hospital: "Royal Hospital",
                      date: "Sep 10, 2023",
                      time: "05:00 PM",
                    ),
                    AppointmentCard(
                      doctorName: "DR Jane Doe",
                      specialty: "Cardiologist",
                      hospital: "City Hospital",
                      date: "Sep 12, 2023",
                      time: "03:00 PM",
                    ),
                    // Add more AppointmentCard widgets here
                  ],
                ),
              ).paddingTopSpace(SpaceType.medium),
            ],
          ),
        ),
      ),
    );
  }
}
