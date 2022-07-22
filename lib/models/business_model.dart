class Business {
  int? id;

  String? name;

  String? email;

  Business({
    this.id,
    this.email,
    this.name,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String);
  }
}
