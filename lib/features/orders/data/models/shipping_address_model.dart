import 'package:fruit_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name, email, address, city, phoneNum, floor;

  ShippingAddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.phoneNum,
    this.floor,
  });

  factory ShippingAddressModel.fromjson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      phoneNum: json['phoneNum'],
      address: json['address'],
      floor: json['floor'],
      city: json['city'],
      email: json['email'],
    );
  }

  tojson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phoneNum': phoneNum,
      'floor': floor,
    };
  }

  toEntity() {
    return ShippingAddressEntity(
      name: name,
      phoneNum: phoneNum,
      address: address,
      floor: floor,
      city: city,
      email: email,
    );
  }
}
