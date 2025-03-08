import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_craft/core/di/dependency_injection.dart';
import 'package:trade_craft/features/craft_my_order/ui/craft_my_order_screen.dart';
import 'package:trade_craft/features/craft_personal_profile/logic/profile_cubit.dart';
import 'package:trade_craft/features/craft_personal_profile/logic/profile_state.dart';
import 'package:trade_craft/features/home/home_screen.dart';
import 'package:trade_craft/features/my_order/ui/my_order_screen.dart';
import 'package:trade_craft/features/offers/ui/offers_screen.dart';
import 'package:trade_craft/features/settings/ui/settings_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (profile) => _buildLoadedState(context, profile.data.first.gender),
          error: (error) => Center(child: Text('Error: $error')),
        );
      },
    );
  }

  Widget _buildLoadedState(BuildContext context, String gender) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getCurrentScreen(_selectedIndex, gender),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _getCurrentScreen(int index, String gender) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return gender == 'male' ?  MyOrderScreen() :  CraftMyOrderScreen();
      case 2:
        return const OffersScreen();
      case 3:
        return  SettingsScreen();
      default:
        return const HomeScreen();
    }
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'طلباتي',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'العروض',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'الإعدادات',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF3B5998),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}