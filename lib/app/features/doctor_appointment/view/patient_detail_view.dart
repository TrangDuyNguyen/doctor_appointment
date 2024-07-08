import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../../../../design/utils/dialog_utils.dart';
import '../../../../design/widget/bottom_sheet.dart';
import '../../../../design/widget/text_form_base.dart';
import '../../../core/router/app_routing_mixin.dart';

class PatientDetailView extends HookWidget with AppRoutingMixin {
  const PatientDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final mNameTextController = TextEditingController();
    final mFocusName = FocusNode();

    final mAgeTextController = TextEditingController();
    final mFocusAge = FocusNode();

    final mGenderTextController = TextEditingController();
    final mGenderFocus = FocusNode();

    final mProblemTextController = TextEditingController();
    final mProblemFocus = FocusNode();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            pop(context);
          },
          child: Image.asset(
            "lib/design/assets/icons/back.png",
            width: 24,
            height: 24,
          ),
        ),
        title: Text(
          "Patient Detail",
          style: context.appTextStyles.titleMedium.bold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            BaseTextInputField(
                controller: mNameTextController,
                focusNode: mFocusName,
                labelText: "Full name",
                isAutoValidate: true,
                validator: (value, context) {
                  return null;
                },
                errorMessageOnValidation: (value, context) {
                  return null;
                }),
            BaseTextInputField(
                controller: mAgeTextController,
                focusNode: mFocusAge,
                labelText: "Your Age",
                isAutoValidate: true,
                textInputType: TextInputType.number,
                validator: (value, context) {
                  return null;
                },
                errorMessageOnValidation: (value, context) {
                  return null;
                }).paddingTopSpace(SpaceType.medium),
            BaseTextInputField(
              controller: mGenderTextController,
              focusNode: mGenderFocus,
              isObscureText: false,
              labelText: "Gender",
              isAutoValidate: false,
              readOnly: true,
              validator: (value, context) {
                return null;
              },
              errorMessageOnValidation: (value, context) {
                return null;
              },
              onTap: () {
                CustomBottomSheet.showBottomSheet(
                  context: context,
                  title: 'Gender',
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                child: Text(
                                  index == 0 ? "Female" : "Male",
                                  style: context.appTextStyles.labelLarge,
                                ),
                                onTap: () => {
                                  // Change state topic
                                  if (index == 0)
                                    {
                                      mGenderTextController.text = "Female",
                                    }
                                  else
                                    {
                                      mGenderTextController.text = "Male",
                                    },
                                  context.pop()
                                },
                              ),
                            );
                          },
                        )),
                  ),
                  scrollable: false,
                  initialChildSize: 0.6,
                  minChildSize: 0.5,
                  maxChildSize: 0.8,
                  isCustomSizeWithKeyBoard: true,
                );
              },
            ).paddingTopSpace(SpaceType.medium),
            TextFormField(
              controller: mProblemTextController,
              keyboardType: TextInputType.text,
              focusNode: mProblemFocus,
              maxLines: null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: context.appColors.grayColorMedium)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: context.appColors.error)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: context.appColors.error)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: context.appColors.brandPrimary)),
                labelText: "Your Problem",
                labelStyle: TextStyle(
                  color: context.appColors.secondaryText,
                  fontSize: 14,
                ),
              ),
              validator: (value) {
                return null;
              },
            ).paddingTopSpace(SpaceType.medium),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, context.bottomSpacer),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              DialogHelpers.showSuccessDialog(
                context,
                title: 'Congratulations!',
                content:
                    "Your appointment with Dr. Jennie Thorn on Wednesday, August 17, 2023 at 11:00 AM  ",
                onConfirm: (ctx) {
                  goOnBoard(context);
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  context.appColors.brandPrimary, // Màu nền của nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Text(
              'NEXT',
              style: context.appTextStyles.labelLarge.bold
                  .copyWith(color: context.appColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
