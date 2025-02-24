import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trade_craft/core/helpers/constant.dart';
import 'package:trade_craft/core/helpers/extention.dart';
import 'package:trade_craft/core/helpers/shared_pref_helper.dart';
import 'package:trade_craft/core/routing/app_router.dart';
import 'package:trade_craft/trade_craft_app.dart';
import 'core/di/dependency_injection.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(
    TradeCraftApp(appRouter: AppRouter())
  );
}

checkIfUserIsLoggedIn() async {
  String? token=await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if(token.isNullOrEmpty()){
    isLoggedIn = false;
  }else{
    isLoggedIn = true;
  }
}

