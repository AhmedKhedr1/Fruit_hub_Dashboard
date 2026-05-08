import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
}
