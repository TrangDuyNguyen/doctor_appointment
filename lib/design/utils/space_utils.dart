import 'package:flutter/material.dart';

enum SpaceType {
  extraSmall(4.0),
  small(8.0),
  medium(16.0),
  large(32.0),
  extraLarge(64.0),
  ultraLarge(128.0);

  final double value;

  const SpaceType(this.value);
}

extension PaddingUtils on Widget {
  Widget paddingAllSpace(SpaceType size) =>
      Padding(padding: EdgeInsets.all(size.value), child: this);

  Widget paddingLeftSpace(SpaceType size) =>
      Padding(padding: EdgeInsets.only(left: size.value), child: this);

  Widget paddingRightSpace(SpaceType size) =>
      Padding(padding: EdgeInsets.only(right: size.value), child: this);

  Widget paddingTopSpace(SpaceType size) =>
      Padding(padding: EdgeInsets.only(top: size.value), child: this);

  Widget paddingBottomSpace(SpaceType size) =>
      Padding(padding: EdgeInsets.only(bottom: size.value), child: this);

  Widget paddingHorizontalSpace(SpaceType size) => Padding(
      padding: EdgeInsets.symmetric(horizontal: size.value), child: this);

  Widget paddingVerticalSpace(SpaceType size) =>
      Padding(padding: EdgeInsets.symmetric(vertical: size.value), child: this);

  Widget paddingOnlySpace({
    SpaceType? left,
    SpaceType? right,
    SpaceType? top,
    SpaceType? bottom,
  }) =>
      Padding(
          padding: EdgeInsets.only(
              left: left?.value ?? 0,
              right: right?.value ?? 0,
              top: top?.value ?? 0,
              bottom: bottom?.value ?? 0),
          child: this);
}

extension MarginUtils on Widget {
  Widget marginAllSpace(SpaceType size) =>
      Container(margin: EdgeInsets.all(size.value), child: this);

  Widget marginLeftSpace(SpaceType size) =>
      Container(margin: EdgeInsets.only(left: size.value), child: this);

  Widget marginRightSpace(SpaceType size) =>
      Container(margin: EdgeInsets.only(right: size.value), child: this);

  Widget marginTopSpace(SpaceType size) =>
      Container(margin: EdgeInsets.only(top: size.value), child: this);

  Widget marginBottomSpace(SpaceType size) =>
      Container(margin: EdgeInsets.only(bottom: size.value), child: this);

  Widget marginHorizontalSpace(SpaceType size) => Container(
      margin: EdgeInsets.symmetric(horizontal: size.value), child: this);

  Widget marginVerticalSpace(SpaceType size) => Container(
      margin: EdgeInsets.symmetric(vertical: size.value), child: this);

  Widget marginOnlySpace({
    SpaceType? left,
    SpaceType? right,
    SpaceType? top,
    SpaceType? bottom,
  }) =>
      Container(
          margin: EdgeInsets.only(
              left: left?.value ?? 0,
              right: right?.value ?? 0,
              top: top?.value ?? 0,
              bottom: bottom?.value ?? 0),
          child: this);
}
