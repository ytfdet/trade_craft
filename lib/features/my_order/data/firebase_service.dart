// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'models/my_order_service_model.dart';
//
// class OrderFireStoreService {
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//
//   Future<void> updateOrderAcceptance(MyOrderServiceModel myOrderServiceModel) async {
//     await _fireStore
//         .collection('service_details')
//         .doc(myOrderServiceModel.id) // Add an id field to your model if missing
//         .update({'isAccept': true});
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateAcceptStatus(String docId, bool newStatus) async {
    await _firestore
        .collection('service_details')
        .doc(docId)
        .update({'isAccept': newStatus});
  }

  Future<void> updateRejectStatus(String docId, bool newStatus) async {
    await _firestore
        .collection('service_details')
        .doc(docId)
        .update({'isReject': newStatus});
  }
}