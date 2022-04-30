class OrderItem {
  int? id;

  String? name;

  String? description;

  String? unit;

  int? orderId;

  double? price;

  double? quantity;

  OrderItem({
    this.id,
    this.name,
    this.description,
    this.unit,
    this.price,
    this.quantity,
    this.orderId,
  });

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['decription'];
    unit = json['unit'];
    orderId = json['orderId'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> orderItem = <String, dynamic>{};
    orderItem['id'] = id;
    orderItem['name'] = name;
    orderItem['description'] = description;
    orderItem['unit'] = unit;
    orderItem['orderId'] = orderId;
    orderItem['price'] = price;
    orderItem['quantity'] = quantity;
    return orderItem;
  }
}
