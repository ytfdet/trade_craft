
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_craft/core/di/dependency_injection.dart';
import 'package:trade_craft/features/craft_personal_profile/logic/profile_cubit.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/color.dart';

class TradeCraftApp extends StatelessWidget {
  const TradeCraftApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => getIt<ProfileCubit>()..getProfile(),
        child: MaterialApp(
          title: "TradeCraft App",
          theme: ThemeData(
            primaryColor: ColorsManger.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),

    );
  }
}
