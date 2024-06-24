import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'doctor_appointment_repository.dart';

class DoctorAppointmentRepositoryImpl extends DoctorAppointmentRepository {
  // TODO add your methods here
}

final doctorAppointmentRepositoryProvider = Provider<DoctorAppointmentRepository>((ref) {
  return DoctorAppointmentRepositoryImpl();
});
