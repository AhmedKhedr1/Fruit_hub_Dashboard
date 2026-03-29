import 'package:fruit_hub_dashboard/features/addProduct/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String data;
  final String image;
  final String reviewDescription;
  final num rating;

  ReviewModel({
    required this.name,
    required this.data,
    required this.image,
    required this.reviewDescription,
    required this.rating,
  });
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      data: reviewEntity.data,
      image: reviewEntity.image,
      reviewDescription: reviewEntity.reviewDescription,
      rating: reviewEntity.rating,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json["name"],
      data: json["data"],
      image: json["image"],
      reviewDescription: json["reviewDescription"],
      rating: json["rating"],
    );
  }
  toJson() {
    return {
      "name": name,
      "data": data,
      "image": image,
      "reviewDescription": reviewDescription,
      "rating": rating,
    };
  }
}
