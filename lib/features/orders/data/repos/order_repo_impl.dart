import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  final DataBaseService dataBaseService;

  OrderRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final response = await dataBaseService.getData(
        path: BackendEndpoint.getOrders,
      );
      List<OrderEntity> orders = (response as List<dynamic>)
          .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
          .toList();
      return right(orders);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
