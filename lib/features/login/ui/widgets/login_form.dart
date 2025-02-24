import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_craft/core/helpers/extention.dart';
import 'package:trade_craft/core/routing/routes.dart';
import 'package:trade_craft/core/widgets/custom_button.dart';
import 'package:trade_craft/features/login/logic/login_cubit.dart';

import '../../../../core/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 16.0),
        child: Card(
          color: const Color(0xFF45404a),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                 CustomTextField(
                  controller: context.read<LoginCubit>().emailController,
                  hint: 'ايميل المستخدم',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,

                ),
                const SizedBox(height: 20),
                 CustomTextField(
                   controller: context.read<LoginCubit>().passwordController,
                   hint: 'كلمة المرور',
                  icon: Icons.lock_outline,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "تسجيل الدخول",
                  onPressed: () {
                    if(context.read<LoginCubit>().formKey.currentState!.validate())
                      {
                        context.read<LoginCubit>().emitLoginStates();
                      }
                  },

                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'اضغط هنا',
                        style: TextStyle(
                          color: Colors.amber,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                        Navigator.pushNamed(context, Routes.signupScreen);
                      },
                      child: const Text(
                        'اضغط هنا',
                        style: TextStyle(
                          color: Colors.amber,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      'إنشاء حساب جديد ؟',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}