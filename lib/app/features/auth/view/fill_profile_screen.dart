import 'dart:io';

import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:doctor_appointment/design/common/text_extention.dart';
import 'package:doctor_appointment/design/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../design/utils/dialog_utils.dart';
import '../../../../design/widget/bottom_sheet.dart';
import '../../../../design/widget/text_form_base.dart';
import '../../../core/hook/hook_input_controller.dart';
import '../../../core/validators/email.dart';
import '../../../core/validators/name.dart';
import '../../../core/validators/phone.dart';
import '../form_state/fill_profile_form_state.dart';
import 'package:intl/intl.dart';

class FillProfileScreen extends HookWidget with AppRoutingMixin {
  FillProfileScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mNameTextController = useTextEditingController();
    final mFocusName = useFocusNode();

    final mBirthDayTextController = useTextEditingController();
    final mBirthDayFocus = useFocusNode();

    final mEmailTextController = useTextEditingController();
    final mFocusEmail = useFocusNode();

    final mPhoneController = useTextEditingController();
    final mPhoneFocus = useFocusNode();

    final mGenderTextController = useTextEditingController();
    final mGenderFocus = useFocusNode();

    final mFormState = useState(FillProfileFormState.initial());

    useEffect(() {
      mNameTextController
        ..text = mFormState.value.name.value
        ..addListener(() {
          mFormState.value = mFormState.value
              .copyWith(name: Name.dirty(mNameTextController.text.trim()));
        });

      mBirthDayTextController
        ..text = DateFormat('dd/MM/yyyy').format(mFormState.value.dateOfBirth)
        ..addListener(() {
          final DateFormat formatter = DateFormat('dd/MM/yyyy');
          mFormState.value = mFormState.value.copyWith(
              dateOfBirth:
                  formatter.parse(mBirthDayTextController.text.trim()));
        });

      mEmailTextController
        ..text = mFormState.value.email.value
        ..addListener(() {
          mFormState.value = mFormState.value
              .copyWith(email: Email.dirty(mEmailTextController.text.trim()));
        });

      mPhoneController
        ..text = mFormState.value.phone.value
        ..addListener(() {
          mFormState.value = mFormState.value.copyWith(
              phone: Phone.dirty(value: mPhoneController.text.trim()));
        });

      mGenderTextController
        ..text = mFormState.value.gender
        ..addListener(() {
          mFormState.value = mFormState.value
              .copyWith(gender: mGenderTextController.text.trim());
        });

      // Dispose các controller khi widget unmount
      return () {
        // mNameTextController.dispose();
        // mBirthDayTextController.dispose();
        // mEmailTextController.dispose();
        // mPhoneController.dispose();
        // mGenderTextController.dispose();
      };
    }, []);

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
        centerTitle: true,
        title: Text(
          "Fill profile",
          style: context.appTextStyles.titleMedium.bold,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: context.appTextStyles.labelMedium.bold
                    .copyWith(color: context.appColors.brandPrimary),
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: context.height - context.bottomSpacer,
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: context.width * 0.33 / 2,
                      backgroundImage: mFormState.value.avatar.path.isNotEmpty
                          ? FileImage(File(mFormState.value.avatar.path))
                          : const AssetImage(
                              "lib/design/assets/icons/avatar.png",
                            ) as ImageProvider,
                    ),
                    onTap: () {
                      CustomBottomSheet.showBottomSheet(
                        context: context,
                        title: 'Choose Avatar',
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  XFile? pickedFile;
                                  return GestureDetector(
                                    child: Column(
                                      children: [
                                        Text(
                                          index == 0 ? "Camera" : "Photo",
                                          style:
                                              context.appTextStyles.labelLarge,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                    onTap: () async => {
                                      if (index == 0)
                                        {
                                          pickedFile = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera),
                                          if (pickedFile != null)
                                            {
                                              mFormState.value = mFormState
                                                  .value
                                                  .copyWith(avatar: pickedFile),
                                            },
                                        }
                                      else
                                        {
                                          pickedFile = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery),
                                          if (pickedFile != null)
                                            {
                                              mFormState.value = mFormState
                                                  .value
                                                  .copyWith(avatar: pickedFile),
                                            },
                                        }
                                    },
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
                  ),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 26,
                      ),
                      BaseTextInputField(
                          controller: mNameTextController,
                          focusNode: mFocusName,
                          labelText: "Full name",
                          isAutoValidate: false,
                          validator: (value, context) {
                            return mFormState.value.name
                                .validator(value)
                                ?.text();
                          },
                          errorMessageOnValidation: (value, context) {
                            return mFormState.value.name
                                .validator(value)
                                ?.text();
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      BaseTextInputField(
                        controller: mBirthDayTextController,
                        focusNode: mBirthDayFocus,
                        labelText: "Date of birth",
                        isAutoValidate: false,
                        validator: (value, context) {
                          return null;
                        },
                        errorMessageOnValidation: (value, context) {
                          return null;
                        },
                        prefixIcon: Image.asset(
                            "lib/design/assets/icons/icon_calendar.png"),
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: mFormState.value.dateOfBirth,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (selectedDate != null) {
                            mFormState.value = mFormState.value
                                .copyWith(dateOfBirth: selectedDate);
                            final formattedDate = DateFormat('dd/MM/yyyy')
                                .format(mFormState.value.dateOfBirth);
                            mBirthDayTextController.text = formattedDate;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      BaseTextInputField(
                          labelText: "Email",
                          controller: mEmailTextController,
                          focusNode: mFocusEmail,
                          isAutoValidate: false,
                          validator: (value, context) {
                            return mFormState.value.email
                                .validator(value)
                                ?.text();
                          },
                          errorMessageOnValidation: (value, context) {
                            return mFormState.value.email
                                .validator(value)
                                ?.text();
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      IntlPhoneField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: context.appColors.grayColorMedium)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: context.appColors.error)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: context.appColors.error)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: context.appColors.brandPrimary)),
                        ),
                        keyboardType: TextInputType.phone,
                        controller: mPhoneController,
                        focusNode: mPhoneFocus,
                        initialCountryCode: "VN",
                        languageCode: "vn",
                        textInputAction: TextInputAction.done,
                        style: context.appTextStyles.labelMedium,
                        dropdownTextStyle: context.appTextStyles.labelMedium,
                        dropdownIconPosition: IconPosition.trailing,
                        disableLengthCheck: true,
                        showCountryFlag: true,
                        validator: (str) {
                          return mFormState.value.phone
                              .validator(str?.number)
                              ?.text();
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
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
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          child: Text(
                                            index == 0 ? "Female" : "Male",
                                            style: context
                                                .appTextStyles.labelLarge,
                                          ),
                                          onTap: () => {
                                            // Change state topic
                                            if (index == 0)
                                              {
                                                mFormState.value
                                                    .copyWith(gender: "Female"),
                                                mGenderTextController.text =
                                                    "Female",
                                              }
                                            else
                                              {
                                                mFormState.value
                                                    .copyWith(gender: "Male"),
                                                mGenderTextController.text =
                                                    "Male",
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
                      ),
                    ],
                  )),
              const Spacer(),
              RoundButton(
                  title: "CONTINUE",
                  onPressed: () {
                    DialogHelpers.showSuccessDialog(
                      context,
                      title: 'Congratulations!',
                      content:
                          "Your account is ready to use. You will \nbe redirected to the Home page in a \nfew seconds...",
                      onConfirm: (ctx) {
                        ctx.pop();
                      },
                    );
                  }),
              SizedBox(
                height: context.bottomSpacer,
              )
            ],
          ),
        ),
      ),
    );
  }
}
