import 'package:fruit_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProductModel,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      shippingAddressModel: ShippingAddressModel.fromjson(
        json['shippingAddressModel'],
      ),
      orderProductModel: List<OrderProductModel>.from(
        json['orderProductModel'].map((e) => OrderProductModel.fromJson(e)),
      ),
      paymentMethod: json['paymentMethod'],
    );
  }
  tojson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'shippingAddressModel': shippingAddressModel.tojson(),
      'orderProductModel': orderProductModel.map((e) => e.tojson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProductEntity: orderProductModel.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }
}
