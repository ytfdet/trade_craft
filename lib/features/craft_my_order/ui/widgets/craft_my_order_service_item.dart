import 'package:flutter/material.dart';
import 'package:trade_craft/features/my_order/data/models/my_order_service_model.dart';

import '../../../../core/helpers/spacing.dart';

class CraftMyOrderServiceItem extends StatelessWidget {
  const CraftMyOrderServiceItem({super.key, required this.myOrderServiceModel, });
  final MyOrderServiceModel   myOrderServiceModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/images/palmur2.jpg",
                  height: 138,
                  width: 138,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      myOrderServiceModel.name,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    verticalSpacing(8),
                     Text(
                      myOrderServiceModel.formDesc ,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    verticalSpacing(8),
                     Text(
                     myOrderServiceModel.phone,
                    ),
                    verticalSpacing(8),
                    Text(
                      myOrderServiceModel.address,
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                         Text(
                         myOrderServiceModel.date,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        horizontalSpacing(8),
                         Text(
                          myOrderServiceModel.time,
                          style: TextStyle(
                            color: Colors.black,
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
    );
  }
}
