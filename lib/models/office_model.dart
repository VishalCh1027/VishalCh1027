class Office {
  int? id;

  String? name;

  int? businessId;

  Office({
    this.id,
    this.name,
    this.businessId,
  });

  Office.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    businessId = json['businessId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> office = <String, dynamic>{};
    office['id'] = id;
    office['name'] = name;
    office['businessId'] = businessId;
    return office;
  }
}
