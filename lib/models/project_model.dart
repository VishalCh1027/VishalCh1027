import 'dart:convert';

class Project {
  int? id;

  late String? name;

  late int clientId;

  late int officeId;

  late List<int> contractorIds;

  late List<int> supervisorIds;

  late List<int> leadIds;

  late List<int> bankIds;

  late int? technicalHeadId;

  late int? procurementOfficerId;

  late String agreement;

  late String? status;

  late DateTime? commencementDate;

  late double estimateCost;

  late double? totalCost;

  late String orderAttachment;

  Project({this.id, this.name, this.status});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> project = <String, dynamic>{};
    project['id'] = id;
    project['name'] = name;
    project['status'] = status;
    return project;
  }
}
