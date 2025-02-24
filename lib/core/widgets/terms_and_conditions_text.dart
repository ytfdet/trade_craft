import 'package:flutter/material.dart';

import '../theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(

            text: "By signing up, you agree to our",
            style: TextStyles.font13DarkGrayRegular,
          ),
          TextSpan(
            text: "Terms & Conditions",
            style: TextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: " and ",
            style: TextStyles.font13DarkGrayRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
