import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trade_craft/core/helpers/spacing.dart';
import 'package:trade_craft/core/routing/routes.dart';

class ServiceMakerScreen extends StatelessWidget {
  const ServiceMakerScreen({super.key});

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
                              Navigator.pushNamed(context, Routes.homeScreen);
                            },
                          ),
                          const Spacer(),
                          const Text(
                            'مقدمين الخدمة',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Image.asset('assets/images/logo2.png', height: 40),
                        ],
                      ),
                    ),
                    Card(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(64),
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/images/download.jpg",
                                  height: 90,
                                  width: 90,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'هشام احمد هاشم علي',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    verticalSpacing(8),
                                    const Text(
                                      'صقر قريش المعادي القاهرة',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    verticalSpacing(8),
                                    const Text(
                                      "01066113493",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    verticalSpacing(8),
                                    const Row(
                                      //mainAxisAlignment: mainAxisAlignment,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Color(0xffFFDD4F),
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          "4.2",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text('(222)',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff484555))),
                                      ],
                                    ),
                                    verticalSpacing(8),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.green, width: 2),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                 'assets/images/accept.png',
                                                  color:Colors.green,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Expanded(
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacing(8),
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
