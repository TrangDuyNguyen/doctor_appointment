import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'scheduled_appointments_repository.dart';

class ScheduledAppointmentsRepositoryImpl extends ScheduledAppointmentsRepository {
  // TODO add your methods here
}

final scheduledAppointmentsRepositoryProvider = Provider<ScheduledAppointmentsRepository>((ref) {
  return ScheduledAppointmentsRepositoryImpl();
});
