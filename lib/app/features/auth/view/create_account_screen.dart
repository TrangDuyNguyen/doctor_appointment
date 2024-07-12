import 'package:doctor_appointment/app/core/router/app_page.dart';
import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/app/core/validators/email.dart';
import 'package:doctor_appointment/app/core/validators/name.dart';
import 'package:doctor_appointment/app/core/validators/password.dart';
import 'package:doctor_appointment/app/features/auth/providers/create_acc_providers.dart';
import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extension.dart';
import 'package:doctor_appointment/design/common/text_extension.dart';
import 'package:doctor_appointment/design/widget/round_button.dart';
import 'package:doctor_appointment/design/widget/text_form_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/hook/hook_navigation.dart';
import '../enum/auth_status.dart';
import '../form_state/form_state.dart';
import '../providers/auth_providers.dart';

class CreateAccountScreen extends StatefulHookConsumerWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen>
    with AppRoutingMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    final mNameTextController = useTextEditingController();
    final mFocusName = useFocusNode();

    final mEmailTextController = useTextEditingController();
    final mFocusEmail = useFocusNode();

    final mPasswordTextController = useTextEditingController();
    final mFocusPassword = useFocusNode();

    final mRePasswordTextController = useTextEditingController();
    final mFocusRePassword = useFocusNode();

    final mFormState = useState(FormAuthState.initial());

    final createAccNotifier = ref.read(authNotifierProvider.notifier);
    final createAccState = ref.watch(authNotifierProvider);

    final appRouting = useAppRouting();

    useEffect(() {
      mNameTextController
        ..text = mFormState.value.name.value
        ..addListener(() {
          mFormState.value = mFormState.value
              .copyWith(name: Name.dirty(mNameTextController.text.trim()));
        });

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
      mRePasswordTextController
        ..text = mFormState.value.cfPassword.value
        ..addListener(() {
          mFormState.value = mFormState.value.copyWith(
              cfPassword: ConfirmPassword.dirty(
                  password: mPasswordTextController.text.trim(),
                  value: mRePasswordTextController.text.trim()));
        });
      return () {};
    }, []);

    useEffect(() {
      if (createAccState.status == AuthStatus.authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          appRouting.navPage(context,
              page: AppPage.fillProfile, args: {'isFirstLogin': true});
        });
      }
      return;
    }, [createAccState.status]);

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
                    "Create Your \nAccount",
                    style: context.appTextStyles.headlineLarge.bold
                        .copyWith(color: context.appColors.brandPrimary),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BaseTextInputField(
                        controller: mNameTextController,
                        focusNode: mFocusName,
                        labelText: "Username",
                        isAutoValidate: true,
                        validator: (value, context) {
                          return mFormState.value.name.validator(value)?.text();
                        },
                        errorMessageOnValidation: (value, context) {
                          return mFormState.value.name.validator(value)?.text();
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    BaseTextInputField(
                        controller: mEmailTextController,
                        focusNode: mFocusEmail,
                        labelText: "Email",
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
                    BaseTextInputField(
                        controller: mPasswordTextController,
                        focusNode: mFocusPassword,
                        isObscureText: true,
                        labelText: "Password",
                        isAutoValidate: false,
                        validator: (value, context) {
                          return mFormState.value.password
                              .validator(value)
                              ?.text();
                        },
                        errorMessageOnValidation: (value, context) {
                          return mFormState.value.password
                              .validator(value)
                              ?.text();
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    BaseTextInputField(
                        controller: mRePasswordTextController,
                        focusNode: mFocusRePassword,
                        isObscureText: true,
                        labelText: "Confirm Password",
                        isAutoValidate: false,
                        validator: (value, context) {
                          return mFormState.value.password
                              .validator(value)
                              ?.text();
                        },
                        errorMessageOnValidation: (value, context) {
                          return mFormState.value.password
                              .validator(value)
                              ?.text();
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Visibility(
                        visible:
                            createAccState.status == AuthStatus.authenticating,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              context.appColors.secondaryColor),
                        )),
                    Visibility(
                        visible:
                            createAccState.status == AuthStatus.createAccError,
                        child: Text(
                          createAccState.errorMessage ?? "",
                          style: context.appTextStyles.titleSmall
                              .copyWith(color: context.appColors.error),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    RoundButton(
                        title: "CREATE ACCOUNT",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final userName = mNameTextController.text.trim();
                            final email = mEmailTextController.text.trim();
                            final password =
                                mPasswordTextController.text.trim();
                            createAccNotifier.createAccount(
                                name: userName,
                                email: email,
                                password: password); // Call the login function
                          }
                        }),
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
