import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/doctor_appointment_widget.dart';

class DoctorAppointmentView extends ConsumerWidget {
  /// TODO add your comment here
  const DoctorAppointmentView({Key? key}) : super(key: key);

  static const routeName = '/doctorAppointment';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DoctorAppointmentWidget();
  }
}
