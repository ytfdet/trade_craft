import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.textStyle,
      required this.textButton,
      this.buttonHeight,
      this.buttonWidth,
      this.horizontalPadding,
      this.verticalPadding,
      this.borderRadius,
      this.backgroundColor,
      this.onPressed});

  final TextStyle textStyle;

  final String textButton;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(backgroundColor ?? ColorsManger.mainBlue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 52),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        textButton,
        style: textStyle,
      ),
    );
  }
}
