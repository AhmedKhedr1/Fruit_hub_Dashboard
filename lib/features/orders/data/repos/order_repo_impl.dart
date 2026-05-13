// ignore_for_file: non_constant_identifier_names

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
        List<OrderEntity> orders = data
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield right(orders);
      }
    } catch (e) {
      yield left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> UpdateOrder({
    required OrderStatusEnum status,
    required String orderID,
  }) async {
    try {
      await dataBaseService.updateData(
        path: BackendEndpoint.updateOrders,
        data: {'status': status.name},
        documentId: orderID,
      );
      return right(null);
    } catch (e) {
      return Future.value(left(ServerFailure(e.toString())));
    }
  }
}
