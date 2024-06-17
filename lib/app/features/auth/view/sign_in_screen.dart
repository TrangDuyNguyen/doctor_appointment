import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/app/core/validators/password.dart';
import 'package:doctor_appointment/app/features/auth/form_state/form_state.dart';
import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:doctor_appointment/design/common/text_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../design/widget/round_button.dart';
import '../../../../design/widget/text_form_base.dart';
import '../../../core/validators/email.dart';
import '../enum/auth_status.dart';
import '../providers/auth_providers.dart';

class SignInScreen extends HookConsumerWidget with AppRoutingMixin {
  SignInScreen({super.key});

  final GlobalKey<FormState> _mFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mEmailTextController = useTextEditingController();
    final mFocusEmail = useFocusNode();

    final mPasswordTextController = useTextEditingController();
    final mFocusPassword = useFocusNode();

    final mFormState = useState(FormAuthState.initial());

    final obscureText = useState<bool>(true);

    final authNotifier = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);

    useEffect(() {
      mEmailTextController
        ..text = mFormState.value.email.value
        ..addListener(() {
          mFormState.value = mFormState.value
              .copyWith(email: Email.dirty(mEmailTextController.text.trim()));
        });

      mPasswordTextController
        ..text = mFormState.value.password.value
        ..addListener(() {
          mFormState.value = mFormState.value.copyWith(
              password: Password.dirty(mPasswordTextController.text.trim()));
        });
      return () {};
    }, []);

    useEffect(() {
      if (authState.status == AuthStatus.authenticated) {
        goOnBoard(context);
      }
      return;
    }, [authState.status]);

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
                    BaseTextInputField(
                      isObscureText: obscureText.value,
                      labelText: "Password",
                      controller: mPasswordTextController,
                      focusNode: mFocusPassword,
                      isAutoValidate: true,
                      validator: (value, context) {
                        return mFormState.value.password
                            .validator(value)
                            ?.text();
                      },
                      errorMessageOnValidation:
                          (String? value, BuildContext context) {
                        return mFormState.value.password
                            .validator(value)
                            ?.text();
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    RoundButton(
                        title: "SIGN IN",
                        onPressed: () {
                          if (_mFormKey.currentState!.validate()) {
                            final email = mEmailTextController.text.trim();
                            final password =
                                mPasswordTextController.text.trim();
                            authNotifier.login(
                                email: email,
                                password: password); // Call the login function
                          }
                        }),
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
