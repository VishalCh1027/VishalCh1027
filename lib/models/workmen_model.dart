class Workmen {
  late int? id;

  late String firstname;

  late String lastname;

  // late String? mobile;

  Workmen({required this.id, required this.firstname, required this.lastname});

  Workmen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstName'];
    lastname = json['lastName'];
    // mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> workmen = <String, dynamic>{};
    workmen['workmenId'] = id;
    workmen['firstname'] = firstname;
    workmen['lastname'] = lastname;
    //  workmen['mobile'] = mobile;
    return workmen;
  }
}
