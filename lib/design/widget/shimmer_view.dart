import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: context.appColors.brandPrimary.withOpacity(0.3),
        highlightColor: context.appColors.brandSecondary.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildShimmerContainer(height: 20.0, width: double.infinity),
            const SizedBox(height: 8.0),
            _buildShimmerContainer(height: 15.0, width: double.infinity),
            const SizedBox(height: 8.0),
            _buildShimmerContainer(height: 15.0, width: double.infinity),
            const SizedBox(height: 8.0),
            _buildShimmerContainer(
                height: 15.0, width: MediaQuery.of(context).size.width / 2),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerContainer({
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}