
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trade_craft/core/helpers/extention.dart';
import 'package:trade_craft/features/craft_my_order/ui/widgets/craft_my_order_service_item.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../my_order/data/models/my_order_service_model.dart';


class CraftMyOrderHistoryScreen extends StatelessWidget {
  CraftMyOrderHistoryScreen({super.key});
  CollectionReference serviceDetails = FirebaseFirestore.instance.collection(
    'service_details',
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: serviceDetails.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MyOrderServiceModel> myOrderServiceModelList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            if(snapshot.data!.docs[i]['isAccept'] == true ){
              myOrderServiceModelList.add(
                MyOrderServiceModel.fromFireStore(snapshot.data!.docs[i]),
              );
            }
          }
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
                                  '  سجل الطلبات المقبولة',
                                  style: TextStyle(
                                    fontSize: 20,
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
                                  context.pushNamed(Routes.craftMyOrderDetailsScreen,arguments: myOrderServiceModelList[index]);
                                },
                                child: CraftMyOrderServiceItem(
                                  myOrderServiceModel: myOrderServiceModelList[index],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => verticalSpacing(8),
                            itemCount: myOrderServiceModelList.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(color: Colors.red));
        }
      },
    );
  }
}
