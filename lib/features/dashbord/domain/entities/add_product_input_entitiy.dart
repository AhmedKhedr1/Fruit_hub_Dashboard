import 'dart:io';

class AddProductInputEntitiy {
  final String? name, code, description, imageUrl;
  final num price;
  final File image;
  final bool isFeatured;

  AddProductInputEntitiy({
    required this.name,
    required this.code,
    required this.description,
     this.imageUrl,
    required this.price,
    required this.image,
    required this.isFeatured,
  });
}
