import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../design/widget/tab_button.dart';
import '../../../core/router/app_routing_mixin.dart';
import '../../doctor_appointment/view/doctor_appointment_view.dart';
import '../../home/view/home_view.dart';
import '../../scheduled_appointments/view/scheduled_appointments_view.dart';
import '../../user/view/user_view.dart';

class MainView extends HookConsumerWidget with AppRoutingMixin {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 4);
    final selectedTab = useState(0);

    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          HomeView(),
          ScheduledAppointmentsView(),
          DoctorAppointmentView(),
          UserView(),
        ],
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -4))
        ]),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabButton(
                  icon: "lib/design/assets/icons/icon_home.png",
                  title: "Home",
                  isSelect: selectedTab.value == 0,
                  onPressed: () {
                    selectedTab.value = 0;
                    tabController.animateTo(0);
                  }),
              TabButton(
                  icon: "lib/design/assets/icons/icon_calendar.png",
                  title: "Appointment",
                  isSelect: selectedTab.value == 1,
                  onPressed: () {
                    selectedTab.value = 1;
                    tabController.animateTo(1);
                  }),
              TabButton(
                  icon: "lib/design/assets/icons/icon_doctor.png",
                  title: "Doctors",
                  isSelect: selectedTab.value == 2,
                  onPressed: () {
                    selectedTab.value = 2;
                    tabController.animateTo(2);
                  }),
              TabButton(
                  icon: "lib/design/assets/icons/icon_menu.png",
                  title: "Profile",
                  isSelect: selectedTab.value == 3,
                  onPressed: () {
                    selectedTab.value = 3;
                    tabController.animateTo(3);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
