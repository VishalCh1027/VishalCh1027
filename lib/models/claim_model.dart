class Claim {
  late String value;

  late String valueType;

  late String type;

  Claim({required this.value, required this.type, required this.valueType});

  Claim.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    valueType = json['valueType'];
    type = json['type'];
  }
}
