import 'dart:convert';

class Project {
  int? id;

  late String name;

  Project({this.id, required this.name});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> project = <String, dynamic>{};
    project['id'] = id;
    project['name'] = name;
    return project;
  }
}
