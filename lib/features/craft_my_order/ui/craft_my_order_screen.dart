
import 'package:flutter/material.dart';
import 'package:trade_craft/features/craft_my_order/ui/widgets/craft_my_order_service_item.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';

class CraftMyOrderScreen extends StatelessWidget {
  const CraftMyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF45404a),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.homeScreen,
                              );
                            },
                          ),
                          const Spacer(),
                          const Text(
                            'الطلبات',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/logo2.png',
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            //context.pushNamed(Routes.serviceMakerScreen);
                          },
                          child: CraftMyOrderServiceItem(
                            //myOrderServiceModel: myOrderServiceModelList[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpacing(8),
                      itemCount: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
