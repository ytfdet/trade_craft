import '../data/firebase_service.dart';
import '../data/models/my_order_service_model.dart';

class OrderController {
  final OrderService _orderService;

  OrderController(this._orderService);

  Future<void> toggleAcceptStatus(MyOrderServiceModel myOrderServiceModel) async {
    final previousStatus = myOrderServiceModel.isAccept;

    try {
      // Update locally first for instant UI feedback
      myOrderServiceModel.isAccept = true;

      // Update Firestore
      await _orderService.updateAcceptStatus(myOrderServiceModel.id, myOrderServiceModel.isAccept);
    } catch (e) {
      // Revert local change on error
      myOrderServiceModel.isAccept = previousStatus;
      throw Exception('Update failed: $e');
    }
  }
}