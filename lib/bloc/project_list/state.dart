import 'package:equatable/equatable.dart';
import 'package:my_application/models/project_model.dart';

import '../../models/loginmodel.dart';

enum ProjectsStatus {
  projectsLoading,
  projectsLoadedSuccessfully,
  projectsEditing,
  listIsEmty,
  projectsError
}

class ProjectsState {
  const ProjectsState._({
    this.status = ProjectsStatus.projectsLoading,
    this.projects = const <Project>[],
  });
  final ProjectsStatus status;
  final List<Project> projects;

  const ProjectsState.loading() : this._();

  const ProjectsState.success(List<Project> Projects)
      : this._(
            status: ProjectsStatus.projectsLoadedSuccessfully,
            projects: Projects);

  const ProjectsState.editing(List<Project> Projects)
      : this._(status: ProjectsStatus.projectsEditing, projects: Projects);

  const ProjectsState.listIsEmty() : this._(status: ProjectsStatus.listIsEmty);

  const ProjectsState.failure() : this._(status: ProjectsStatus.projectsError);

  ProjectsState copyWith({
    List<Project>? Projects,
  }) {
    return ProjectsState._(
      projects: Projects ?? this.projects,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, projects];
}
