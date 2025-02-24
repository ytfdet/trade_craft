
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_craft/features/signup/data/models/sign_up_request_body.dart';
import 'package:trade_craft/features/signup/data/repos/sign_up_repo.dart';


import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  // TextEditingController genderController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  void emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(SignupRequestBody(
        name: nameController.text,
        email:emailController.text,
        phone:phoneController.text,
        password:passwordController.text,
        passwordConfirmation:passwordController.text,
        gender: 0,));
    response.when(
      success: (signupResponse) {
        emit(SignupState.success(signupResponse));
      },
      failure: (error) {
        emit(SignupState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
