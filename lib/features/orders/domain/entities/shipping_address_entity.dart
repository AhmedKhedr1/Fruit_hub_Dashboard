class ShippingAddressEntity {
  String? name, email, address, city, phoneNum, floor;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.address,
    this.city,
    this.phoneNum,
    this.floor,
  });
  String tostring() {
    return '$address $floor $city';
  }
}
