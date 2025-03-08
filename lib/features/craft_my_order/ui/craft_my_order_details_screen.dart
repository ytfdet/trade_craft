import 'package:flutter/material.dart';
import 'package:trade_craft/core/helpers/spacing.dart';

import '../../../core/routing/routes.dart';
import '../../my_order/data/firebase_service.dart';
import '../../my_order/data/models/my_order_service_model.dart';
import '../../my_order/logic/order_controller.dart';
import '../../my_order/logic/order_controller2.dart';

class CraftMyOrderDetailsScreen extends StatefulWidget {
  const CraftMyOrderDetailsScreen({super.key, required this.myOrderServiceModel,});
  final MyOrderServiceModel myOrderServiceModel;

  @override
  State<CraftMyOrderDetailsScreen> createState() => _CraftMyOrderDetailsScreenState();
}

class _CraftMyOrderDetailsScreenState extends State<CraftMyOrderDetailsScreen> {
  late final OrderController _controller;
  late final OrderController2 _controller2;
  bool _isUpdating = false;
  bool _isUpdating2 = false;

  @override
  void initState() {
    super.initState();
    _controller = OrderController(OrderService());
    _controller2 = OrderController2(OrderService());
  }

  Future<void> _handleAcceptToggle() async {
    setState(() => _isUpdating = true);

    try {
      await _controller.toggleAcceptStatus(widget.myOrderServiceModel);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Status updated to ${widget.myOrderServiceModel.isAccept}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUpdating = false);
      }
    }
  }
  Future<void> _handleRejectToggle() async {
    setState(() => _isUpdating2 = true);

    try {
      await _controller2.toggleRejectStatus(widget.myOrderServiceModel);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Status updated to ${widget.myOrderServiceModel.isReject}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUpdating = false);
      }
    }
  }
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
                    buildInfoRow('الاسم', widget.myOrderServiceModel.name),
                    const Divider(height: 1),

                    buildInfoRow('وصف المشكله',
                        widget.myOrderServiceModel.formDesc),
                    const Divider(height: 1),

                    buildInfoRow('رقم الهاتف', widget.myOrderServiceModel.phone),
                    const Divider(height: 1),

                    buildInfoRow(
                      'العنوان',
                      widget.myOrderServiceModel.address,
                    ),
                    const Divider(height: 1),
                    buildInfoRow('التاريخ', '${widget.myOrderServiceModel.date} ${widget.myOrderServiceModel.time}'),
                    const Divider(height: 1),
                    verticalSpacing(16),
                    Row(
                      children: [
                        widget.myOrderServiceModel.isAccept ?SizedBox.shrink(): Expanded(
                          child: GestureDetector(
                            onTap: ()async {
                              await _controller2.toggleRejectStatus(widget.myOrderServiceModel);
                              _handleRejectToggle();
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
                        widget.myOrderServiceModel.isAccept ?SizedBox.shrink():Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await _controller.toggleAcceptStatus(widget.myOrderServiceModel);
                              _handleAcceptToggle();
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
