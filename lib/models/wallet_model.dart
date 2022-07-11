class Wallet {
  int? id;

  double? balance;

  int? employeeId;

  Wallet({this.id, this.balance, this.employeeId});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    balance = json["balance"];
    employeeId = json["employeeId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> wallet = <String, dynamic>{};
    wallet["id"] = id;
    wallet["balance"] = balance;
    wallet["employeeId"] = employeeId;
    return wallet;
  }
}
