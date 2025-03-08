import '../data/firebase_service.dart';
import '../data/models/my_order_service_model.dart';

class OrderController2 {
  final OrderService _orderService;

  OrderController2(this._orderService);

  Future<void> toggleRejectStatus(MyOrderServiceModel myOrderServiceModel) async {
    final previousStatus = myOrderServiceModel.isReject;

    try {
      // Update locally first for instant UI feedback
      myOrderServiceModel.isReject = true;

      // Update Firestore
      await _orderService.updateRejectStatus(myOrderServiceModel.id, myOrderServiceModel.isReject);
    } catch (e) {
      // Revert local change on error
      myOrderServiceModel.isReject = previousStatus;
      throw Exception('Update failed: $e');
    }
  }
}