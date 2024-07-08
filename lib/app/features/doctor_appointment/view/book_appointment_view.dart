import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/router/app_page.dart';

class BookAppointmentView extends HookWidget with AppRoutingMixin {
  const BookAppointmentView({super.key});

  List<String> generateTimeSlots() {
    List<String> timeSlots = [];
    DateTime startTime = DateTime(2023, 1, 1, 9, 0); // Start at 9:00 AM
    DateTime endTime = DateTime(2023, 1, 1, 18, 0); // End at 6:00 PM

    while (startTime.isBefore(endTime) || startTime.isAtSameMomentAs(endTime)) {
      timeSlots.add(
          '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} ${startTime.hour < 12 ? 'AM' : 'PM'}');
      startTime = startTime.add(const Duration(minutes: 30));
    }

    return timeSlots;
  }

  @override
  Widget build(BuildContext context) {
    CalendarFormat calendarFormat = CalendarFormat.month;
    final focusedDay = useState<DateTime>(DateTime.now());
    final selectedDay = useState<DateTime?>(null);
    final selectedChipIndex = useState<int?>(null);
    List<String> timeSlots = generateTimeSlots();
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
          "Book Appointment ",
          style: context.appTextStyles.titleMedium.bold,
        ),
        centerTitle: true,
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
            Text(
              "Select Date",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.primaryText),
            ).paddingTopSpace(SpaceType.medium),
            Container(
              decoration: BoxDecoration(
                color: context.appColors.brandPrimary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: focusedDay.value,
                calendarFormat: calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay.value, day);
                },
                onDaySelected: (newSelectedDay, newFocusedDay) {
                  selectedDay.value = newSelectedDay;
                  focusedDay.value = newFocusedDay;
                },
                onFormatChanged: (format) {
                  if (calendarFormat != format) {
                    calendarFormat = format;
                  }
                },
                onPageChanged: (focusedDay) {
                  focusedDay = focusedDay;
                },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: context.appTextStyles.titleMedium.bold,
                  leftChevronIcon: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: context.appColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: context.appColors.brandPrimary,
                    shape: BoxShape.circle,
                  ),
                  defaultDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  weekendDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  outsideDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: context.appTextStyles.labelMedium,
                  weekendTextStyle: context.appTextStyles.labelMedium,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: context.appTextStyles.labelMedium,
                  weekendStyle: context.appTextStyles.labelMedium,
                ),
              ),
            ).paddingTopSpace(SpaceType.medium),
            Text(
              "Select Hour",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.primaryText),
            ).paddingTopSpace(SpaceType.medium),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of chips in a row
                crossAxisSpacing: 8.0, // Horizontal spacing between chips
                mainAxisSpacing: 8.0, // Vertical spacing between chips
                childAspectRatio: 2, // Aspect ratio of the chips
              ),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                return ChoiceChip(
                  padding: const EdgeInsets.all(12),
                  showCheckmark: false,
                  label: Text(timeSlots[index]),
                  selected: selectedChipIndex.value == index,
                  onSelected: (bool selected) {
                    selectedChipIndex.value = selected ? index : null;
                  },
                  backgroundColor: Colors.transparent,
                  selectedColor: context.appColors.brandPrimary,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: context.appColors.brandPrimary, // Border color
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: selectedChipIndex.value == index
                        ? Colors.white
                        : context.appColors.brandPrimary,
                  ),
                );
              },
            ).paddingVerticalSpace(SpaceType.medium),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, context.bottomSpacer),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              context.push(AppPage.patientDetail.getPath);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  context.appColors.brandPrimary, // Màu nền của nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Text(
              'NEXT',
              style: context.appTextStyles.labelLarge.bold
                  .copyWith(color: context.appColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
