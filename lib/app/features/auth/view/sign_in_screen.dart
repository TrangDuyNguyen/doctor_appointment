import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/app/features/auth/model/form_state.dart';
import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:doctor_appointment/design/common/text_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:validators/validators.dart';

import '../../../../design/widget/round_button.dart';
import '../../../../design/widget/text_form_base.dart';
import '../../../core/hook/hook_input_controller.dart';

class SignInScreen extends HookWidget with AppRoutingMixin {
  SignInScreen({super.key});

  final GlobalKey<FormState> _mFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mEmailTextController = TextEditingController();
    final mFocusEmail = useFocusNode();

    final mPasswordTextController = TextEditingController();
    final mFocusPassword = useFocusNode();

    final mFormState = useState(FormAuthState());

    useEffect(() {
      mEmailTextController
        ..text = mFormState.value.name
        ..addListener(() {
          mFormState.value =
              mFormState.value.copyWith(name: mEmailTextController.text.trim());
        });

      mPasswordTextController
        ..text = mFormState.value.password
        ..addListener(() {
          mFormState.value = mFormState.value
              .copyWith(name: mPasswordTextController.text.trim());
        });
      return () {
        // mEmailTextController.dispose();
        // mFocusEmail.dispose();
        // mPasswordTextController.dispose();
        // mFocusPassword.dispose();
      };
    });

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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Sign In to Your \nAccount",
                    style: context.appTextStyles.headlineLarge.bold
                        .copyWith(color: context.appColors.brandPrimary),
                  ),
                ],
              ),
              Form(
                key: _mFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BaseTextInputField(
                        labelText: "Email",
                        controller: mEmailTextController,
                        focusNode: mFocusEmail,
                        isAutoValidate: true,
                        errorMessageOnValidation: (value, context) {
                          print(value);
                          return isEmail(value.toString())
                              ? null
                              : 'Provide a valid email';
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    BaseTextInputField(
                        isObscureText: true,
                        labelText: "Password",
                        controller: mPasswordTextController,
                        focusNode: mFocusPassword,
                        isAutoValidate: true,
                        errorMessageOnValidation: (value, context) {
                          return isLength(value.toString(), 4)
                              ? null
                              : 'Provide a valid password of more than 4 characters';
                        }),
                    const SizedBox(
                      height: 32,
                    ),
                    RoundButton(title: "SIGN IN", onPressed: () {}),
                    const SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot the password?",
                        style: context.appTextStyles.labelLarge.bold
                            .copyWith(color: context.appColors.secondaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: context.appColors.grayColorLight,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "or create with",
                          style: context.appTextStyles.labelMedium,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: context.appColors.grayColorLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                              onPressed: () {},
                              height: 52,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: context.appColors.grayColorLight,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset(
                                  "lib/design/assets/icons/face_bock.png")),
                          MaterialButton(
                              onPressed: () {},
                              height: 52,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: context.appColors.grayColorLight,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset(
                                  "lib/design/assets/icons/google.png")),
                          MaterialButton(
                              onPressed: () {},
                              height: 52,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: context.appColors.grayColorLight,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset(
                                  "lib/design/assets/icons/apple.png"))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.bottomSpacer,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//loi validate ben textfield
