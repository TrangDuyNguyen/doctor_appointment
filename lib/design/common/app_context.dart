import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;
  double get bottomSpacer => size.width*0.128;
}