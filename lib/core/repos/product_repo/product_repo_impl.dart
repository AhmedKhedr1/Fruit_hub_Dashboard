import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/features/addProduct/data/models/add_product_input_model.dart';
import 'package:fruit_hub_dashboard/features/addProduct/domain/entities/add_product_input_entitiy.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class ProductRepoImpl extends ProductsRepo {
  final DataBaseService dataBaseService;

  ProductRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntitiy addProductInputEntity,
  ) async {
    try {
      await dataBaseService.addData(
        path: BackendEndpoint.addProduct,
        data: AddProductInputModel.fromEntity(addProductInputEntity).tojson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(S.current.add_product_failed));
    }
  }
}
