import 'dart:convert';

class Project {
  late int? id;

  late String? name;

  late int? clientId;

  late int? officeId;

  late List<int?> contractorIds;

  late List<int?> supervisorIds;

  late List<int?> leadIds;

  late List<int?> bankIds;

  late int? technicalHeadId;

  late int? procurementOfficerId;

  late String? agreement;

  late DateTime? startDate;

  late String? status;

  late DateTime? commencementDate;

  late double? estimateCost;

  late double? totalCost;

  late String? orderAttachment;

  Project(
      {this.id,
      this.name,
      this.status,
      this.startDate,
      this.totalCost,
      this.estimateCost,
      this.agreement});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    startDate = DateTime.parse(json['startDate']);
    totalCost = json['totalCost']?.toDouble();
    estimateCost = json['estimateCost']?.toDouble();
    agreement = json['agreement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> project = <String, dynamic>{};
    project['id'] = id;
    project['name'] = name;
    project['status'] = status;
    project['startDate'] = startDate;
    return project;
  }
}
