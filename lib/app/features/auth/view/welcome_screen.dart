import 'package:doctor_appointment/design/common/app_context.dart';
import 'package:doctor_appointment/design/common/color_extention.dart';
import 'package:doctor_appointment/design/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.brandPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/design/assets/img/logo_white.png"),
              ],
            ),
            const Expanded(child: SizedBox()),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "By tapping ‘Sign in’ you agree to our ",
                    style: context.appTextStyles.labelSmall
                        .copyWith(color: context.appColors.whiteColor),
                    children: [
                      TextSpan(
                        text: "Terms.",
                        style: context.appTextStyles.labelMedium
                            .copyWith(color: context.appColors.whiteColor),
                      ),
                      TextSpan(
                        text: "\nLearn how we process your data in our ",
                        style: context.appTextStyles.labelSmall
                            .copyWith(color: context.appColors.whiteColor),
                      ),
                      TextSpan(
                        text: "Privacy Policy ",
                        style: context.appTextStyles.labelMedium
                            .copyWith(color: context.appColors.whiteColor),
                      ),
                      TextSpan(
                        text: "and",
                        style: context.appTextStyles.labelSmall
                            .copyWith(color: context.appColors.whiteColor),
                      ),
                      TextSpan(
                        text: "\nCookies Policy.",
                        style: context.appTextStyles.labelMedium
                            .copyWith(color: context.appColors.whiteColor),
                      ),
                    ])),
            const SizedBox(
              height: 24,
            ),
            RoundButton(
                title: "CREATE ACCOUNT",
                type: RoundButtonType.secondary,
                onPressed: () {
                  context.push(AppPage.signUp.getPath);
                }),
            const SizedBox(
              height: 16,
            ),
            RoundButton(
                title: "SIGN IN",
                type: RoundButtonType.primary,
                onPressed: () {
                  context.push(AppPage.signIn.getPath);
                }),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Trouble signing in?",
                style: context.appTextStyles.labelLarge
                    .copyWith(color: context.appColors.whiteColor),
              ),
            ),
            SizedBox(
              height: context.bottomSpacer,
            ),
          ],
        ),
      ),
    );
  }
}
