class EmployeePermissions {
  final List<EmployeeRoles>? childRoles;

  final List<String>? roleIds;

  final List<int>? officeIds;

  EmployeePermissions({this.childRoles, this.roleIds, this.officeIds});

  factory EmployeePermissions.fromJson(Map<String, dynamic> json) {
    return EmployeePermissions(
        childRoles: List<EmployeeRoles>.from(
            json['childRoles'].map((e) => EmployeeRoles.fromJson(e))),
        roleIds: List<String>.from(json['rodeIds']),
        officeIds: List<int>.from(json['officeIds']));
  }
}

class EmployeeRoles {
  final int? id;
  final String? name;

  final List<EmployeeRoles>? childRoles;

  EmployeeRoles({this.id, this.name, this.childRoles});

  factory EmployeeRoles.fromJson(Map<String, dynamic> json) {
    return EmployeeRoles(
        id: json['id'] as int,
        name: json['name'] as String,
        childRoles: List<EmployeeRoles>.from(
            json['childRoles'].map((e) => EmployeeRoles.fromJson(e))));
  }
}
