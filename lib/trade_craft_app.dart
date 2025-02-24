
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: MaterialApp(

        title: "TradeCraft App",
        theme: ThemeData(
          primaryColor: ColorsManger.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.craftPersonalProfileScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
