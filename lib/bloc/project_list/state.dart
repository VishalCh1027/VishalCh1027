import 'package:my_application/models/employee_model.dart';
import 'package:my_application/models/expense_model.dart';
import 'package:my_application/models/project_model.dart';

enum ProjectsStatus {
  projectsLoading,
  projectsLoadedSuccessfully,
  projectsEditing,
  listIsEmty,
  projectsError,
  personal,
  expenses,
  items
}

class ProjectsState {
  const ProjectsState._({
    this.status = ProjectsStatus.projectsLoading,
    this.projects = const <Project>[],
    this.employees = const <Employee>[],
    this.expenses = const <ProjectExpense>[],
    this.items = const <ProjectItem>[],
  });
  final ProjectsStatus status;
  final List<Project> projects;
  final List<Employee> employees;
  final List<ProjectExpense> expenses;
  final List<ProjectItem> items;

  const ProjectsState.loading() : this._();

  const ProjectsState.success(List<Project> Projects)
      : this._(
            status: ProjectsStatus.projectsLoadedSuccessfully,
            projects: Projects);

  const ProjectsState.editing(List<Project> Projects)
      : this._(status: ProjectsStatus.projectsEditing, projects: Projects);

  const ProjectsState.listIsEmty() : this._(status: ProjectsStatus.listIsEmty);

  const ProjectsState.failure() : this._(status: ProjectsStatus.projectsError);

  const ProjectsState.personal(List<Employee> employees)
      : this._(status: ProjectsStatus.personal, employees: employees);

  const ProjectsState.expense(List<ProjectExpense> expenses)
      : this._(status: ProjectsStatus.expenses, expenses: expenses);

  const ProjectsState.items(List<ProjectItem> items)
      : this._(status: ProjectsStatus.items, items: items);

  ProjectsState copyWith({
    List<Project>? Projects,
  }) {
    return ProjectsState._(
      projects: Projects ?? this.projects,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, projects, employees, expenses, items];
}
