import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/bloc/project_list/state.dart';
import 'package:my_application/models/project_model.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final ProjectsService repository;
  ProjectsCubit({required this.repository})
      : super(const ProjectsState.loading());

  Future<void> getProjects(int employeeId) async {
    var projects = await repository.getProjects(employeeId);
    if (projects != null) {
      emit(ProjectsState.success(projects));
    } else {
      emit(ProjectsState.failure());
    }
  }

  Future<void> searchProject(String search) async {
    var projects = await repository.searchproject(search);
    if (projects.isNotEmpty) {
      emit(ProjectsState.editing(projects));
    } else {
      emit(ProjectsState.failure());
    }
  }
}
