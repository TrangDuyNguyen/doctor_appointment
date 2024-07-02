import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorCardWidget extends HookWidget {
  final String doctorName;
  final String specialty;
  final String hospital;
  final double rating;
  final String? avatar;
  final bool? liked;

  const DoctorCardWidget(
      {super.key,
      required this.doctorName,
      required this.specialty,
      required this.hospital,
      required this.rating,
      this.avatar,
      this.liked = false});

  @override
  Widget build(BuildContext context) {
    var selected = useState(liked ?? false);

    return Container(
      height: 144,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: context.appColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: context.appColors.grayColorLight,
              spreadRadius: 0.2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ]),
      child: Row(
        children: [
          CircleAvatar(
            radius: 37,
            backgroundColor: context.appColors.whiteColor,
            child: ClipOval(
              child: SizedBox(
                width: 74,
                height: 74,
                child: Image.asset(
                  "lib/design/assets/icons/fake_avatar_doctor.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.appTextStyles.labelLarge.bold,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '$specialty | $hospital',
                          style: context.appTextStyles.labelMedium
                              .copyWith(color: context.appColors.secondaryText),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox.shrink(),
                  InkWell(
                    onTap: () {
                      selected.value = !selected.value;
                    },
                    child: ClipOval(
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Image.asset(
                          selected.value
                              ? "lib/design/assets/icons/heart_select.png"
                              : "lib/design/assets/icons/heart_unselect.png",
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 14,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Image.asset(
                        'lib/design/assets/icons/rating_star.png',
                        color: context.appColors.brandPrimary,
                      ),
                      unratedColor: context.appColors.grayColorLight,
                      onRatingUpdate: (rating) {},
                      ignoreGestures: true,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      rating.toString(),
                      style: context.appTextStyles.labelMedium,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
