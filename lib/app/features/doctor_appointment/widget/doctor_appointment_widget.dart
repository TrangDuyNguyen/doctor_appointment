import 'package:doctor_appointment/app/core/router/app_page.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../design/widget/chip_list.dart';
import '../../../core/constraints/fake_data.dart';
import '../../../core/router/app_routing_mixin.dart';
import 'doctor_card_widget.dart';

class DoctorAppointmentWidget extends HookWidget with AppRoutingMixin {
  DoctorAppointmentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final selectedChipIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appColors.whiteColor,
        elevation: 4.0, // Độ cao của AppBar (shadow)
        shadowColor: Colors.white, // Màu của shadow
        title: Text(
          "Doctors",
          style: context.appTextStyles.titleMedium.bold,
        ),
        actions: [
          InkWell(
            onTap: () {
              context.push(AppPage.searchDoctor.getPath);
            },
            child: ClipOval(
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "lib/design/assets/icons/search.png",
                  color: context.appColors.brandPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          InkWell(
            onTap: () {
              context.push(AppPage.filterDoctor.getPath);
            },
            child: ClipOval(
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "lib/design/assets/icons/filter.png",
                  color: context.appColors.brandPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(children: [
          ChipsHorizontalWidget(
              chipLabels: listChip,
              selectedChipIndex: selectedChipIndex.value,
              onChipSelected: (index) {
                selectedChipIndex.value = index;
              }),
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
                  itemCount: 12)
              .paddingTopSpace(SpaceType.small)
              .paddingBottomSpace(SpaceType.small)
        ]),
      ),
    );
  }
}
