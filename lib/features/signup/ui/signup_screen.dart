import 'package:flutter/material.dart';
import 'package:trade_craft/features/signup/ui/widgets/signup_form.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/sign_up_bloc_listener.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo2.png',
                  height: 120,
                  fit: BoxFit.scaleDown,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 16.0),
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.black,
                   // color: Color(0xFF1B5E20),
                    color: const Color(0xFF45404a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          CustomDropdown(
                            items: const ['حساب شخصي', 'حساب تجاري'],
                            hint: 'نوع الحساب',
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 16),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: CustomDropdown(
                          //         width: 10,
                          //         items: const ['سباك فلاتر', 'حساب تجاري'],
                          //         hint: 'إضافة خدمات ',
                          //         onChanged: (value) {},
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          const SignupForm(),
                          const SignupBlocListener()


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}