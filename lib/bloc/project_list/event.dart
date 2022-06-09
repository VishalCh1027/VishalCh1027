import 'package:equatable/equatable.dart';
import 'package:my_application/models/Project_model.dart';

class ProjectsEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetWorkmens extends ProjectsEvent {
  final int projectId;

  GetWorkmens(this.projectId);
}

class EditProjects extends ProjectsEvent {
  final List<Project> Projectss;

  EditProjects(this.Projectss);
}
