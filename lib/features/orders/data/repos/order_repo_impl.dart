import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
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
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>)
          in dataBaseService.streamData(path: BackendEndpoint.getOrders)) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield right(orders);
      }
    } catch (e) {
      yield left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> UpdateOrder({required OrderStatusEnum status, required String orderID}) {
    throw UnimplementedError();
  }
}
