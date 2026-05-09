import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

OrderEntity getDummyOrder() {
  return OrderEntity(
    totalPrice: 320.75,
    uId: 'user_12345',
    paymentMethod: 'Cash',
    shippingAddressEntity: ShippingAddressEntity(
      name: 'Ahmed Mohamed',
      email: 'ahmed@gmail.com',
      address: '15 El Geish Street',
      city: 'Alexandria',
      phoneNum: '+20 100 123 4567',
      floor: '3',
    ),
    orderProductEntity: [
      OrderProductEntity(
        name: 'Apple',
        code: 'FR001',
        imageUrl:
            'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
        price: 45.0,
        quantity: 3,
      ),
      OrderProductEntity(
        name: 'Banana',
        code: 'FR002',
        imageUrl:
            'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e',
        price: 25.5,
        quantity: 4,
      ),
    ],
    status: OrderStatusEnum.pending,
  );
}
