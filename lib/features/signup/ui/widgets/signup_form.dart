import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_craft/core/helpers/extention.dart';
import 'package:trade_craft/core/routing/routes.dart';
import 'package:trade_craft/core/widgets/custom_button.dart';
import 'package:trade_craft/core/widgets/custom_text_field.dart';
import 'package:trade_craft/features/signup/logic/sign_up_cubit.dart';
import 'package:trade_craft/features/signup/ui/widgets/custom_checkbox.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
           CustomTextField(
            controller: context.read<SignupCubit>().nameController,
            hint: 'الاسم الكامل',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
           CustomTextField(
            controller: context.read<SignupCubit>().phoneController,
            hint: 'رقم الجوال',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
           CustomTextField(
             controller: context.read<SignupCubit>().emailController,

             hint: 'ايميل المستخدم',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 16),
           CustomTextField(
             controller: context.read<SignupCubit>().passwordController,
             hint: 'كلمة المرور',
            icon: Icons.lock_outline,
          ),
          const SizedBox(height: 20),
          CustomCheckbox(
            text: 'الموافقة على الشروط والأحكام',
            value: _acceptTerms,
            onChanged: (value) {
              setState(() {
                _acceptTerms = value ?? false;
              });
            },
          ),
          CustomButton(
            text: 'إنشاء حساب',
            onPressed: () {
              if (context.read<SignupCubit>().formKey.currentState!.validate() && _acceptTerms) {
                context.read<SignupCubit>().emitSignupStates();
              }
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.pop();
                  Navigator.pushNamed(context, Routes.loginScreen);
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
                'لديك حساب بالفعل؟',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
