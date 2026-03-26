import 'package:fruit_hub_dashboard/features/dashbord/domain/entities/add_product_input_entitiy.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductInputEntitiy addProductInputEntity);
}
