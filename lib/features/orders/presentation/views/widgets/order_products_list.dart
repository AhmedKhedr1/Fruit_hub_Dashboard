import 'package:flutter/widgets.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_product_item.dart';

class OrderProductsList extends StatelessWidget {
  final List<OrderProductEntity> products;

  const OrderProductsList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) {
        return OrderProductItem(
          product: product,
        );
      }).toList(),
    );
  }
}