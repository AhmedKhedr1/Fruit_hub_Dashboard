import 'dart:io';

import 'package:fruit_hub_dashboard/features/addProduct/data/review_model.dart';
import 'package:fruit_hub_dashboard/features/addProduct/domain/entities/add_product_input_entitiy.dart';

class AddProductInputModel {
  final String? name, code, description, imageUrl;
  final num price;
  final File image;
  final bool isFeatured;
  final int expirationMonths;
  bool isOrganic = false;
  final int numOfCalories, unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });
  factory AddProductInputModel.fromEntity(
    AddProductInputEntitiy addProductInputEntitiy,
  ) {
    return AddProductInputModel(
      name: addProductInputEntitiy.name,
      code: addProductInputEntitiy.code,
      description: addProductInputEntitiy.description,
      imageUrl: addProductInputEntitiy.imageUrl,
      price: addProductInputEntitiy.price,
      image: addProductInputEntitiy.image,
      isFeatured: addProductInputEntitiy.isFeatured,
      expirationMonths: addProductInputEntitiy.expirationMonths,
      numOfCalories: addProductInputEntitiy.numOfCalories,
      unitAmount: addProductInputEntitiy.unitAmount,
      isOrganic: addProductInputEntitiy.isOrganic,
      reviews: addProductInputEntitiy.revews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }
  tojson() {
    return {
      "name": name,
      "code": code,
      "description": description,
      "price": price,
      "isFeatured": isFeatured,
      "expirationMonths": expirationMonths,
      "isOrganic": isOrganic,
      "numOfCalories": numOfCalories,
      "unitAmount": unitAmount,
      'imageUrl': imageUrl,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
