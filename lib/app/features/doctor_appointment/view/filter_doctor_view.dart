import 'package:doctor_appointment/app/core/constraints/fake_data.dart';
import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class FilterDoctorView extends HookWidget with AppRoutingMixin {
  const FilterDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedChipIndex = useState(0);
    final selectedRateChipIndex = useState(0);
    return SafeArea(
      child: Scaffold(
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
            "Filter",
            style: context.appTextStyles.titleMedium.bold,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Specialty",
                style: context.appTextStyles.titleMedium.bold,
              ).paddingTopSpace(SpaceType.large),
              Wrap(
                spacing: 8.0, // Spacing between chips horizontally
                runSpacing: 8.0, // Spacing between chips vertically
                children: List<Widget>.generate(
                  listChip.length,
                  (int index) {
                    return ChoiceChip(
                      label: Text(
                        listChip[index],
                        style: context.appTextStyles.labelMedium.copyWith(
                            color: selectedChipIndex.value == index
                                ? context.appColors.whiteColor
                                : context.appColors.brandPrimary),
                      ),
                      selected: selectedChipIndex.value == index,
                      onSelected: (selected) =>
                          {selectedChipIndex.value = index},
                      backgroundColor: Colors.transparent,
                      selectedColor: context.appColors.brandPrimary,
                      showCheckmark: false,
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: context.appColors.brandPrimary, // Border color
                        ),
                      ),
                      elevation: 0, // Remove shadow
                    );
                  },
                ).toList(),
              ).paddingTopSpace(SpaceType.medium),
              Text(
                "Rating",
                style: context.appTextStyles.titleMedium.bold,
              ).paddingTopSpace(SpaceType.large),
              SizedBox(
                height: 36,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (listRate[index] != 'All')
                              Icon(
                                Icons.star,
                                size: 16,
                                color: selectedRateChipIndex.value == index
                                    ? context.appColors.whiteColor
                                    : context.appColors.brandPrimary,
                              ),
                            const SizedBox(
                                width: 4), // Space between icon and text
                            Text(
                              listRate[index],
                              style: context.appTextStyles.labelMedium.copyWith(
                                  color: selectedRateChipIndex.value == index
                                      ? context.appColors.whiteColor
                                      : context.appColors.brandPrimary),
                            ),
                          ],
                        ),
                        selected: selectedRateChipIndex.value == index,
                        onSelected: (selected) =>
                            selectedRateChipIndex.value = index,
                        backgroundColor: Colors.transparent,
                        selectedColor: context.appColors.brandPrimary,
                        showCheckmark: false,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color:
                                context.appColors.brandPrimary, // Border color
                          ),
                        ),
                        elevation: 0, // Remove shadow
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: listRate.length),
              ).paddingTopSpace(SpaceType.medium),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    selectedChipIndex.value = 0;
                    selectedRateChipIndex.value = 0;
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: context.appColors.brandPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    'Reset',
                    style: context.appTextStyles.labelMedium.bold
                        .copyWith(color: context.appColors.brandPrimary),
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
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        context.appColors.brandPrimary, // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: context.appTextStyles.labelMedium.bold
                        .copyWith(color: context.appColors.whiteColor),
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
