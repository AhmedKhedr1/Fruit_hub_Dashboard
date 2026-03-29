import 'dart:io';

import 'package:fruit_hub_dashboard/features/addProduct/domain/entities/review_entity.dart';

class AddProductInputEntitiy {
  final String? name, code, description, imageUrl;
  final num price;
  final File image;
  final bool isFeatured;
  final int expirationMonths;
  bool isOrganic = false;
  final int numOfCalories, unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> revews;

  AddProductInputEntitiy({
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    required this.revews,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
  });
}
