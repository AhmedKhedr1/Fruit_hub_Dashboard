import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/features/addProduct/domain/entities/add_product_input_entitiy.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;
  Future<void> addProduct(AddProductInputEntitiy addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (l) {
        emit(AddProductFailure(errMessage: l.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (l) {
            emit(AddProductFailure(errMessage: l.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
