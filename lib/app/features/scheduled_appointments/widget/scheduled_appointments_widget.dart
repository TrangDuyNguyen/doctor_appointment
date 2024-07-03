import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'doctor_card_appointment_widget.dart';

class ScheduledAppointmentsWidget extends HookWidget {
  /// TODO add your comment here
  const ScheduledAppointmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text(
          "My Appointment",
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
            onTap: () {},
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar(
            controller: tabController,
            labelStyle: context.appTextStyles.labelLarge,
            labelColor: context.appColors.brandPrimary,
            indicatorColor: context.appColors.brandPrimary,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        elevation: 4.0, // Độ cao của AppBar (shadow)
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildListView(context, 'Upcoming'),
          buildListView(context, 'Completed'),
          buildListView(context, 'Cancelled'),
        ],
      ),
    );
  }

  Widget buildListView(BuildContext context, String status) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return DoctorCardAppointmentWidget(
          doctorName: 'DR William Smith',
          specialty: 'Dentist',
          status: status,
          avatar: '',
          dateBook: 'Aug 17, 2023 | 11:00 AM',
        );
      },
    );
  }
}
