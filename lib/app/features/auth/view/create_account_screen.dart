import 'package:doctor_appointment/app/core/router/app_routing_mixin.dart';
import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:doctor_appointment/design/common/text_extention.dart';
import 'package:doctor_appointment/design/widget/round_button.dart';
import 'package:doctor_appointment/design/widget/text_form_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateAccountScreen extends StatefulHookConsumerWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> with AppRoutingMixin {

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    final userNameTcr = StateProvider.autoDispose<TextEditingController>(
            (ref) => TextEditingController());



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
                        labelText: "Username",
                        isAutoValidate: false,
                        errorMessageOnValidation: (text, context) {}),
                    const SizedBox(
                      height: 16,
                    ),
                    BaseTextInputField(
                        labelText: "Email",
                        isAutoValidate: false,
                        errorMessageOnValidation: (text, context) {}),
                    const SizedBox(
                      height: 16,
                    ),
                    BaseTextInputField(
                        isObscureText: true,
                        labelText: "Password",
                        isAutoValidate: false,
                        errorMessageOnValidation: (text, context) {}),
                    const SizedBox(
                      height: 16,
                    ),
                    BaseTextInputField(
                        isObscureText: true,
                        labelText: "Confirm Password",
                        isAutoValidate: false,
                        errorMessageOnValidation: (text, context) {}),
                    const SizedBox(
                      height: 32,
                    ),
                    RoundButton(title: "CREATE ACCOUNT", onPressed: () {}),
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
