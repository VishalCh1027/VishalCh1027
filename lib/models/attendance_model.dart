import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_application/models/workmen_model.dart';

class Attendance {
  Workmen? workmen;

  TimeOfDay? in_;

  TimeOfDay? out;

  late int workmenId;

  late int projectId;

  DateTime? date;

  bool? selected;

  int? hoursWorked;

  Attendance(
      {required this.workmenId,
      required this.projectId,
      this.in_,
      this.out,
      this.date,
      this.workmen,
      this.selected,
      this.hoursWorked});

  Attendance.fromJson(Map<String, dynamic> json) {
    workmenId = json['workmenId'];
    var intime = json["in"];
    var outtime = json["out"];
    if (intime != null && intime.length > 0) {
      in_ = TimeOfDay(
          hour: int.parse(json["in"].split(":")[0]),
          minute: int.parse(json["in"].split(":")[1]));
    }
    if (outtime != null && outtime.length > 0) {
      out = TimeOfDay(
          hour: int.parse(json["out"].split(":")[0]),
          minute: int.parse(json["out"].split(":")[1]));
    }
    workmen = Workmen.fromJson(json['workmen']);

    selected = json['selected'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> attendance = <String, dynamic>{};
    attendance['workmenId'] = workmenId;
    attendance['in'] = in_;
    attendance['out'] = out;
    attendance['workmen'] = jsonEncode(workmen);
    return attendance;
  }
}
