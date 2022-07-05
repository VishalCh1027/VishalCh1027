import 'package:equatable/equatable.dart';
import 'package:my_application/models/workmen_model.dart';

enum WorkmenStatus {
  WorkmenLoading,
  WorkmenEdited,
  WorkmenLoaded,
  WorkmenError
}

class WorkmenState {
  const WorkmenState._({
    this.status = WorkmenStatus.WorkmenLoading,
    this.workmens = const <Workmen>[],
  });
  final WorkmenStatus status;
  final List<Workmen> workmens;

  const WorkmenState.loading() : this._();

  const WorkmenState.success(List<Workmen> workmens)
      : this._(status: WorkmenStatus.WorkmenLoaded, workmens: workmens);

  const WorkmenState.edited(List<Workmen> workmens)
      : this._(status: WorkmenStatus.WorkmenLoaded, workmens: workmens);

  const WorkmenState.failure() : this._(status: WorkmenStatus.WorkmenError);

  WorkmenState copyWith({
    List<Workmen>? workmens,
  }) {
    return WorkmenState._(
      workmens: workmens ?? this.workmens,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, workmens];
}
