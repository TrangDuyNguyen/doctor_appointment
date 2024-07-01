import 'package:flutter/material.dart';

class DoctorCardWidget extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String hospital;
  final int star;
  final String? avatar;

  const DoctorCardWidget(
      {super.key,
      required this.doctorName,
      required this.specialty,
      required this.hospital,
      required this.star,
      this.avatar});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
