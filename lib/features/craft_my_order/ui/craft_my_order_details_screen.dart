import 'package:flutter/material.dart';
import 'package:trade_craft/core/helpers/spacing.dart';

import '../../../core/routing/routes.dart';

class CraftMyOrderDetailsScreen extends StatelessWidget {
  const CraftMyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Card(
            color: const Color(0xFF45404a),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo2.png',
                          height: 40,
                        ),

                        const Spacer(),
                        const Text(
                          'تفاصيل الطلب',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 24,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.craftMyOrderScreen,
                            );
                          },
                        ),
                      ],
                    ),
                    verticalSpacing(16),
                    Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/palmur2.jpg',
                          fit: BoxFit.cover,
                          height: 160,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    buildInfoRow('الاسم', 'هشام احمد هاشم '),
                    const Divider(height: 1),

                    buildInfoRow('وصف المشكله',
                        'الحنفيه بتنقط على العيال بليل وهما نايمينا لحقونا  '),
                    const Divider(height: 1),

                    buildInfoRow('رقم الهاتف', '01012345678'),
                    const Divider(height: 1),

                    buildInfoRow(
                      'العنوان',
                      'المعادىن شارع الملك عبدالعزيز',
                    ),
                    const Divider(height: 1),
                    buildInfoRow('التاريخ', '2023-09-20 10:00 AM'),
                    const Divider(height: 1),
                    verticalSpacing(16),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context, Routes.craftMyOrderScreen,
                              );
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.red, width: 2),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/img_13.png',
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.craftMyOrderScreen,
                              );
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.green, width: 2),
                              ),
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/accept.png',
                                      color: Colors.green,

                                    )

                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

Widget buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    ),
  );
}
