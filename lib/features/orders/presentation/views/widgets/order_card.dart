import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_actions.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_payment_info.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_products_list.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_user_info.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderActions(order: order),
            SizedBox(height: 16),

            OrderUserInfo(order: order),

            Divider(height: 20),

            OrderPaymentInfo(order: order),

            SizedBox(height: 12),

            Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            SizedBox(height: 10),

            OrderProductsList(products: order.orderProductEntity),
          ],
        ),
      ),
    );
  }
}
