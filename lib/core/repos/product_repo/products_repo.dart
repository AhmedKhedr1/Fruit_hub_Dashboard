import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/features/addProduct/domain/entities/add_product_input_entitiy.dart';

abstract class ProductsRepo {
  Future<Either<Failure,void>> addProduct(AddProductInputEntitiy addProductInputEntity);
}
