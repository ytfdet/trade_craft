import 'package:flutter/material.dart';
import 'package:trade_craft/features/my_order/data/models/my_order_service_model.dart';

import '../../../../core/helpers/spacing.dart';

class MyOrderServiceItem extends StatelessWidget {
  const MyOrderServiceItem({super.key, required this.myOrderServiceModel});

  final MyOrderServiceModel myOrderServiceModel;
Widget textCondition() {
  if(myOrderServiceModel.isAccept){
    return const Text(
      'تم قبول الطلب',
      style: TextStyle(color: Colors.green),
    );
  }else if (myOrderServiceModel.isReject){
    return const Text(
      'لم يتم قبول الطلب',
      style: TextStyle(color: Colors.red),
    );
  }else{
    return const Text(
      'في الانتظار',
      style: TextStyle(color: Colors.amber),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    print('form : ' + myOrderServiceModel.formDesc);
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
                    const Text(
                      ' خدمات السباكة',
                      style: TextStyle(color: Colors.black),
                    ),
                    verticalSpacing(8),
                    Text(
                      myOrderServiceModel.formDesc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                        Text(
                          myOrderServiceModel.date,
                          style: TextStyle(color: Colors.black),
                        ),
                        horizontalSpacing(8),
                        Text(
                          "\t ${myOrderServiceModel.time}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    verticalSpacing(8),
                    textCondition(),
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
