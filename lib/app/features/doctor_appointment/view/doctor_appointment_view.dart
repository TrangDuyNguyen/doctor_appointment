import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoctorAppointmentView extends ConsumerWidget {
  /// TODO add your comment here
  const DoctorAppointmentView({Key? key}) : super(key: key);

  static const routeName = '/doctorAppointment';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('Content for Tab 3'));
  }
}
