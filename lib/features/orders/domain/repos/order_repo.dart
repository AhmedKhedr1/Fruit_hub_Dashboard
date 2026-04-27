import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderModel>> fetchOrders();
}
