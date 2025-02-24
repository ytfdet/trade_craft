import 'package:flutter/material.dart';
import 'package:trade_craft/features/home/ui/widgets/location_bar.dart';
import 'package:trade_craft/features/home/ui/widgets/services_grid.dart';

import 'ui/widgets/promotion_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Top Bar with Search and Notification
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.search, size: 24),
                const Spacer(),
                Image.asset('assets/images/logo2.png', height: 40),
                const Spacer(),
                Stack(
                  children: [
                    const Icon(Icons.notifications_outlined, size: 24),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const LocationBar(),
          const PromotionBanner(),
          const Expanded(
            child: ServicesGrid(),
          ),
          //const BottomNavigation(),
        ],
      ),
    );
  }
}
