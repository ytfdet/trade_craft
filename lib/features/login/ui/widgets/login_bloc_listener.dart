
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_craft/core/helpers/extention.dart';
import 'package:trade_craft/core/theming/color.dart';
import 'package:trade_craft/core/theming/font_weight_helper.dart';
import 'package:trade_craft/core/theming/styles.dart';
import 'package:trade_craft/features/login/logic/login_cubit.dart';
import 'package:trade_craft/features/login/logic/login_state.dart';

import '../../../../core/routing/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setupErrorState(context, error);
          },
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          },
        );
      },
      listenWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text(
            error,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeightHelper.medium,
              color: ColorsManger.darkBlue,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'Go Item',
                  style: TextStyles.font14BlueSemiBold,
                )),
          ],
        );
      },
    );
  }
}
