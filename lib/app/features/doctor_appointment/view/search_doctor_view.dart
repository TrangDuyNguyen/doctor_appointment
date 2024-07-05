import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../design/widget/chip_list.dart';
import '../../../core/constraints/fake_data.dart';
import '../../../core/router/app_routing_mixin.dart';
import '../widget/doctor_card_widget.dart';

class SearchDoctorView extends HookWidget with AppRoutingMixin {
  const SearchDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final searchFocusNote = useFocusNode();
    final selectedChipIndex = useState(0);

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
        actions: [
          const SizedBox(
            width: 52,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: 52,
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
                              .copyWith(color: context.appColors.secondaryText),
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
                      color: context.appColors.grayColorLight.withOpacity(0.4),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "lib/design/assets/icons/icon_x.png",
                      color: context.appColors.brandPrimary,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChipsHorizontalWidget(
                chipLabels: listChip,
                selectedChipIndex: selectedChipIndex.value,
                onChipSelected: (index) {
                  selectedChipIndex.value = index;
                }),
            Text(
              "Recent ",
              style: context.appTextStyles.titleMedium.bold,
            ),
            ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const DoctorCardWidget(
                    doctorName: 'DR William Smith',
                    specialty: 'Dentist',
                    hospital: 'Metro Hospital',
                    rating: 3,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemCount: 3)
                .paddingTopSpace(SpaceType.small)
          ],
        ),
      ),
    );
  }
}
