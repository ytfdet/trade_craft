
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_craft/features/signup/data/models/sign_up_request_body.dart';
import 'package:trade_craft/features/signup/data/repos/sign_up_repo.dart';


import '../../../core/helpers/constant.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/networking/dio_factory.dart';
import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
int gender = 0 ;
  //TextEditingController genderController = TextEditingController();
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
        gender: gender,));

    response.when(
      success: (signupResponse) async{
        await saveUserToken(signupResponse.userData?.token ?? '');
        emit(SignupState.success(signupResponse));
      },
      failure: (error) {
        emit(SignupState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    if (kDebugMode) {
      print('Saved token: $token');
    }
    DioFactory.setTokenAfterLogin(token);
  }
  // void setAccountType(int value) {
  //   gender = value;
  // }
}
