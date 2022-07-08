class Vendor {
  late int id;

  late String name;

  late String email;

  late String phone;

  late int businessId;

  Vendor(
      {required this.id,
      required this.name,
      required this.email,
      required this.businessId,
      required this.phone});

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        businessId: json['businessId'],
        phone: json['phone']);
  }
}
