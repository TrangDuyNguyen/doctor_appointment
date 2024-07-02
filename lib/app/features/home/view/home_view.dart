import 'package:carousel_slider/carousel_controller.dart';
import 'package:doctor_appointment/app/features/doctor_appointment/model/doctor_model.dart';
import 'package:doctor_appointment/app/features/doctor_appointment/widget/doctor_card_widget.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:doctor_appointment/design/widget/carousel_slider.dart';
import 'package:doctor_appointment/design/widget/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../design/widget/shimmer_view.dart';
import '../../doctor_appointment/model/speciality_model.dart';
import '../providers/home_providers.dart';
import '../widget/appointment_card.dart';

class HomeView extends HookConsumerWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  final List<SpecialityModel> specialityList = [
    SpecialityModel(
        speciality: 'General', icon: 'lib/design/assets/icons/general.png'),
    SpecialityModel(
        speciality: 'Dentist', icon: 'lib/design/assets/icons/dentist.png'),
    SpecialityModel(
        speciality: 'Ontology', icon: 'lib/design/assets/icons/otology.png'),
    SpecialityModel(
        speciality: 'Ophthalmology',
        icon: 'lib/design/assets/icons/ophthalmology.png'),
    SpecialityModel(
        speciality: 'Intestine', icon: 'lib/design/assets/icons/intestine.png'),
    SpecialityModel(
        speciality: 'Pediatric', icon: 'lib/design/assets/icons/pediatric.png'),
    SpecialityModel(
        speciality: 'Herbal', icon: 'lib/design/assets/icons/herbal.png'),
    SpecialityModel(
        speciality: 'More', icon: 'lib/design/assets/icons/more.png'),
  ];

  final List<String> listChip = [
    "All",
    "General",
    "Gastroenteritis",
    "Cardiologist",
    "Orthopaedic",
    "Neurologist",
    "Otology",
    "Dentist",
    "Rhinology",
    "Urologist",
    "Otology",
    "Pulmonologist",
    "Neurologist",
    "Gastroenteritis"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchFocusNote = useFocusNode();
    final selectedChipIndex = useState(0);

    final CarouselController mPopularDoctorSliderController =
        CarouselController();

    final upcomingDoctorState = ref.watch(upcomingDoctorNotifierProvider);
    final topDoctorState = ref.watch(topDoctorNotifierProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              ).paddingTopSpace(SpaceType.large),
              upcomingDoctorState.isLoading
                  ? const ShimmerView().paddingTopSpace(SpaceType.medium)
                  : upcomingDoctorState.errorMessage != null
                      ? const ShimmerView().paddingTopSpace(SpaceType.medium)
                      : SliderWidget<DoctorModel>(
                              autoPlay: false,
                              carouselController:
                                  mPopularDoctorSliderController,
                              enlargeCenterPage: true,
                              aspectRatio: 2 / 0.84,
                              viewportFraction: 1,
                              itemBuilder: (context, item) {
                                return AppointmentCard(
                                    doctorName: item.fullName ?? "",
                                    specialty: item.specialist ?? "",
                                    hospital: item.hospital ?? "",
                                    date: item.workingDays ?? "",
                                    time: item.workingHours ?? "");
                              },
                              items: upcomingDoctorState.doctors)
                          .paddingTopSpace(SpaceType.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor Speciality ",
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
              ).paddingTopSpace(SpaceType.large),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: specialityList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    var speciality = specialityList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          child: Image.asset(speciality.icon ?? "",
                              width: 30, height: 30),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            speciality.speciality ?? "",
                            style: context.appTextStyles.labelSmall,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    );
                  }).paddingTopSpace(SpaceType.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctors",
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
              ).paddingTopSpace(SpaceType.large),
              ChipsHorizontalWidget(
                  chipLabels: listChip,
                  selectedChipIndex: selectedChipIndex.value,
                  onChipSelected: (index) {
                    selectedChipIndex.value = index;
                  }),
              topDoctorState.isLoading
                  ? const ShimmerView().paddingTopSpace(SpaceType.medium)
                  : topDoctorState.errorMessage != null
                      ? const ShimmerView().paddingTopSpace(SpaceType.medium)
                      : ListView.separated(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var doctor = topDoctorState.doctors[index];
                                return DoctorCardWidget(
                                    doctorName: doctor.fullName ?? "",
                                    specialty: doctor.specialist ?? "",
                                    hospital: doctor.hospital ?? "",
                                    rating: 0);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 12,
                                  ),
                              itemCount: topDoctorState.doctors.length) //
                          .paddingTopSpace(SpaceType.medium)
                          .paddingBottomSpace(SpaceType.medium),
            ],
          ),
        ),
      ),
    );
  }
}
