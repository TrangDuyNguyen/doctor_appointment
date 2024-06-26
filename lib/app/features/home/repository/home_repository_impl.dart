import 'dart:convert';

import 'package:doctor_appointment/app/features/doctor_appointment/model/doctor_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final String _doctorJson = '''
  [
    {
      "userName": "doctor1",
      "email": "doctor1@example.com",
      "avatar": "https://example.com/avatar1.png",
      "uid": "uid1",
      "fullName": "Dr. John Smith",
      "dateOfBirth": "1975-05-20T00:00:00.000Z",
      "phone": "123-456-7890",
      "gender": "Male",
      "dateCreate": "2020-01-15T00:00:00.000Z",
      "address": "123 Elm St, Springfield",
      "hospital": "General Hospital",
      "specialist": "Cardiologist",
      "workingDays": "Mon-Fri",
      "workingHours": "09:00 AM - 05:00 PM"
    },
    {
      "userName": "doctor2",
      "email": "doctor2@example.com",
      "avatar": "https://example.com/avatar2.png",
      "uid": "uid2",
      "fullName": "Dr. Jane Doe",
      "dateOfBirth": "1980-07-12T00:00:00.000Z",
      "phone": "123-555-7890",
      "gender": "Female",
      "dateCreate": "2018-03-10T00:00:00.000Z",
      "address": "456 Oak St, Springfield",
      "hospital": "City Hospital",
      "specialist": "Dermatologist",
      "workingDays": "Tue-Sat",
      "workingHours": "10:00 AM - 06:00 PM"
    },
    {
      "userName": "doctor3",
      "email": "doctor3@example.com",
      "avatar": "https://example.com/avatar3.png",
      "uid": "uid3",
      "fullName": "Dr. Emily Brown",
      "dateOfBirth": "1985-09-25T00:00:00.000Z",
      "phone": "123-555-1234",
      "gender": "Female",
      "dateCreate": "2019-07-22T00:00:00.000Z",
      "address": "789 Maple St, Springfield",
      "hospital": "Metro Hospital",
      "specialist": "Pediatrician",
      "workingDays": "Mon-Fri",
      "workingHours": "08:00 AM - 04:00 PM"
    },
    {
      "userName": "doctor4",
      "email": "doctor4@example.com",
      "avatar": "https://example.com/avatar4.png",
      "uid": "uid4",
      "fullName": "Dr. Michael White",
      "dateOfBirth": "1978-11-30T00:00:00.000Z",
      "phone": "123-456-1111",
      "gender": "Male",
      "dateCreate": "2016-11-19T00:00:00.000Z",
      "address": "321 Birch St, Springfield",
      "hospital": "General Hospital",
      "specialist": "Orthopedic",
      "workingDays": "Mon-Thu",
      "workingHours": "07:00 AM - 03:00 PM"
    },
    {
      "userName": "doctor5",
      "email": "doctor5@example.com",
      "avatar": "https://example.com/avatar5.png",
      "uid": "uid5",
      "fullName": "Dr. Sarah Green",
      "dateOfBirth": "1982-02-14T00:00:00.000Z",
      "phone": "123-555-7899",
      "gender": "Female",
      "dateCreate": "2017-05-23T00:00:00.000Z",
      "address": "654 Pine St, Springfield",
      "hospital": "City Hospital",
      "specialist": "Neurologist",
      "workingDays": "Mon-Wed, Fri",
      "workingHours": "08:00 AM - 05:00 PM"
    },
    {
      "userName": "doctor6",
      "email": "doctor6@example.com",
      "avatar": "https://example.com/avatar6.png",
      "uid": "uid6",
      "fullName": "Dr. David Black",
      "dateOfBirth": "1970-03-10T00:00:00.000Z",
      "phone": "123-555-1235",
      "gender": "Male",
      "dateCreate": "2015-08-30T00:00:00.000Z",
      "address": "789 Cedar St, Springfield",
      "hospital": "Metro Hospital",
      "specialist": "Urologist",
      "workingDays": "Mon-Fri",
      "workingHours": "09:00 AM - 06:00 PM"
    },
    {
      "userName": "doctor7",
      "email": "doctor7@example.com",
      "avatar": "https://example.com/avatar7.png",
      "uid": "uid7",
      "fullName": "Dr. Olivia Blue",
      "dateOfBirth": "1983-06-08T00:00:00.000Z",
      "phone": "123-555-5678",
      "gender": "Female",
      "dateCreate": "2014-04-12T00:00:00.000Z",
      "address": "123 Spruce St, Springfield",
      "hospital": "General Hospital",
      "specialist": "Gynecologist",
      "workingDays": "Tue-Fri",
      "workingHours": "09:00 AM - 05:00 PM"
    },
    {
      "userName": "doctor8",
      "email": "doctor8@example.com",
      "avatar": "https://example.com/avatar8.png",
      "uid": "uid8",
      "fullName": "Dr. Daniel Red",
      "dateOfBirth": "1986-12-12T00:00:00.000Z",
      "phone": "123-555-3456",
      "gender": "Male",
      "dateCreate": "2013-12-15T00:00:00.000Z",
      "address": "456 Fir St, Springfield",
      "hospital": "City Hospital",
      "specialist": "Ophthalmologist",
      "workingDays": "Mon, Wed-Fri",
      "workingHours": "10:00 AM - 06:00 PM"
    },
    {
      "userName": "doctor9",
      "email": "doctor9@example.com",
      "avatar": "https://example.com/avatar9.png",
      "uid": "uid9",
      "fullName": "Dr. Laura Purple",
      "dateOfBirth": "1990-01-01T00:00:00.000Z",
      "phone": "123-555-7777",
      "gender": "Female",
      "dateCreate": "2019-10-30T00:00:00.000Z",
      "address": "789 Willow St, Springfield",
      "hospital": "Metro Hospital",
      "specialist": "Radiologist",
      "workingDays": "Mon-Thu",
      "workingHours": "07:00 AM - 04:00 PM"
    }
  ]
  ''';

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
    return _parseDoctors(_doctorJson);
  }

  @override
  Future<List<DoctorModel>> getTopDoctorList() async {
    // TODO: implement getTopDoctorList
    await Future.delayed(const Duration(seconds: 1));
    return _parseDoctors(_doctorJson);
  }
  // TODO add your methods here
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
