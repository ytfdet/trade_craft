
import 'package:trade_craft/core/networking/api_error_handler.dart';
import 'package:trade_craft/core/networking/api_service.dart';
import 'package:trade_craft/features/signup/data/models/sign_up_request_body.dart';
import 'package:trade_craft/features/signup/data/models/sign_up_response.dart';

import '../../../../core/helpers/constant.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../models/profile_response.dart';

class ProfileRepo{
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ProfileResponse> getProfile() async {
    String? token=await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    return _apiService.getProfile('Bearer $token');
  }

}
