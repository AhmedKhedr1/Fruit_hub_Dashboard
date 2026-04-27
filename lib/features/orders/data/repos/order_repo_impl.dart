import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/order_repo.dart';

class OrderRepoImpl  extends OrderRepo{
  @override
  Future<Either<Failure, OrderModel>> fetchOrders() {
    // TODO: implement fetchOrders
    throw UnimplementedError();
  }
}