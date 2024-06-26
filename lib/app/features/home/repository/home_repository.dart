import '../../doctor_appointment/model/doctor_model.dart';

abstract class HomeRepository {
  // TODO: add your impl here
  Future<List<DoctorModel>> getDoctorUpComingList();

  Future<List<DoctorModel>> getTopDoctorList();
}
