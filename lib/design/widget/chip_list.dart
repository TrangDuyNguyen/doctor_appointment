import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:flutter/material.dart';

class ChipsHorizontalWidget extends StatelessWidget {
  final List<String> chipLabels;
  final Function(int) onChipSelected;
  final int selectedChipIndex;

  const ChipsHorizontalWidget(
      {super.key,
      required this.chipLabels,
      required this.onChipSelected,
      this.selectedChipIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: SizedBox(
          height: 36,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ChoiceChip(
                  label: Text(
                    chipLabels[index],
                    style: context.appTextStyles.labelMedium.copyWith(
                        color: selectedChipIndex == index
                            ? context.appColors.whiteColor
                            : context.appColors.brandPrimary),
                  ),
                  selected: selectedChipIndex == index,
                  onSelected: (selected) => onChipSelected(index),
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
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: chipLabels.length),
        ),
      ),
    );
  }
}
