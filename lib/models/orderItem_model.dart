import 'package:flutter/services.dart';

class OrderItem {
  int? id;

  String? name;

  String? description;

  String? unit;

  int? orderId;

  double? price;

  double? quantity;

  bool selected = false;

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
    description = json['description'];
    unit =
        Unit.values[json['unit']].toString().replaceFirst(RegExp("Unit."), "");
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

  OrderItem.empty() {
    id = null;
    name = "";
    description = "";
    unit = null;
    quantity = null;
  }
}

enum Unit {
  Qty,

  Mtr,

  SqM,

  CuM,

  KM,

  Ft,

  SqFt,

  CuFt,

  Inch,

  SqInch,

  CuInch,
}
