import 'dart:convert';

import 'package:doctor_appointment/app/features/doctor_appointment/model/doctor_model.dart';
import 'package:doctor_appointment/app/features/doctor_appointment/model/speciality_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/constraints/fake_data.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {

  List<DoctorModel> _parseDoctors(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed
        .map<DoctorModel>((json) => DoctorModel.fromMap(json))
        .toList();
  }

  @override
  Future<List<DoctorModel>> getDoctorUpComingList() async {
    // TODO: implement getDoctorUpComingList
    await Future.delayed(const Duration(seconds: 1));
    return _parseDoctors(doctorJson);
  }

  @override
  Future<List<DoctorModel>> getTopDoctorList() async {
    // TODO: implement getTopDoctorList
    await Future.delayed(const Duration(seconds: 1));
    return _parseDoctors(doctorJson);
  }
  // TODO add your methods here
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
