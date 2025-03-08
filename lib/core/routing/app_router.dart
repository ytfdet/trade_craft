import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_craft/core/di/dependency_injection.dart';
import 'package:trade_craft/core/routing/routes.dart';
import 'package:trade_craft/features/home/layout_screen.dart';
import 'package:trade_craft/features/login/logic/login_cubit.dart';
import 'package:trade_craft/features/my_order/ui/my_order_screen.dart';
import 'package:trade_craft/features/service/ui/sevice_screen.dart';
import 'package:trade_craft/features/service_maker/ui/service_maker_screen.dart';
import 'package:trade_craft/features/signup/logic/sign_up_cubit.dart';

import '../../features/craft_my_order/ui/craft_my_order_details_screen.dart';
import '../../features/craft_my_order/ui/craft_my_order_screen.dart';
import '../../features/craft_my_order/ui/widgets/craft_my_order_history_screen.dart';
import '../../features/craft_personal_profile/logic/profile_cubit.dart';
import '../../features/craft_personal_profile/ui/craft_personal_profile.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/my_order/data/models/my_order_service_model.dart';
import '../../features/settings/ui/settings_screen.dart';
import '../../features/signup/ui/signup_screen.dart';
import '../ex.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupScreen(),
              ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      case Routes.serviceScreen:
        return MaterialPageRoute(builder: (context) => ServiceScreen());
      case Routes.myOrderScreen:
        return MaterialPageRoute(builder: (context) => MyOrderScreen());
      case Routes.serviceMakerScreen:
        return MaterialPageRoute(
          builder: (context) => const ServiceMakerScreen(),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      case Routes.craftMyOrderScreen:
        return MaterialPageRoute(builder: (context) => CraftMyOrderScreen());
      case Routes.craftMyOrderHistoryScreen:
        return MaterialPageRoute(
          builder: (context) => CraftMyOrderHistoryScreen(),
        );
      case Routes.craftMyOrderDetailsScreen:
        final arguments = settings.arguments as MyOrderServiceModel;
        return MaterialPageRoute(
          builder:
              (context) =>
                  CraftMyOrderDetailsScreen(myOrderServiceModel: arguments),
        );
      case Routes.craftPersonalProfileScreen:
        return MaterialPageRoute(
          builder:
              (context) =>
                  CraftPersonalProfileScreen(), //craftPersonalProfileScreen(),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder:
              (context) => SettingsScreen(), //craftPersonalProfileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text('No page defined'))),
        );
    }
  }
}
