import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScheduledAppointmentsView extends ConsumerWidget {
  /// TODO add your comment here
  const ScheduledAppointmentsView({Key? key}) : super(key: key);

  static const routeName = '/scheduledAppointments';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('Content for Tab 2'));
  }
}
