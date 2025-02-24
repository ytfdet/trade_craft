
import 'package:trade_craft/core/networking/api_error_handler.dart';
import 'package:trade_craft/core/networking/api_service.dart';
import 'package:trade_craft/features/signup/data/models/sign_up_request_body.dart';
import 'package:trade_craft/features/signup/data/models/sign_up_response.dart';

import '../../../../core/networking/api_result.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
