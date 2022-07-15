import 'package:equatable/equatable.dart';
import 'package:my_application/models/workmen_model.dart';

enum WorkmenStatus {
  WorkmenLoading,
  WorkmenEdited,
  WorkmenLoaded,
  WorkmenError
}

class WorkmenState {
  const WorkmenState._(
      {this.status = WorkmenStatus.WorkmenLoading,
      this.workmens = const <Workmen>[],
      this.hasReachedMax = false});
  final WorkmenStatus status;
  final List<Workmen> workmens;
  final bool hasReachedMax;

  const WorkmenState.loading() : this._();

  const WorkmenState.success(List<Workmen> workmens, bool hasReachedMax)
      : this._(
            status: WorkmenStatus.WorkmenLoaded,
            workmens: workmens,
            hasReachedMax: hasReachedMax);

  const WorkmenState.edited(List<Workmen> workmens)
      : this._(status: WorkmenStatus.WorkmenLoaded, workmens: workmens);

  const WorkmenState.failure() : this._(status: WorkmenStatus.WorkmenError);

  WorkmenState copyWith({
    WorkmenStatus? status,
    List<Workmen>? workmens,
    bool? hasReachedMax,
  }) {
    return WorkmenState._(
        status: status ?? this.status,
        workmens: workmens ?? this.workmens,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, workmens, hasReachedMax];
}
