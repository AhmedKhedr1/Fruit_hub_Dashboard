import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final String orderID;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProductEntity;
  final String paymentMethod;
  final OrderStatusEnum status;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.orderProductEntity,
    required this.paymentMethod,
    required this.status,
    required this.orderID,
  });
}
