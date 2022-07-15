import '../../models/attendance_model.dart';

enum AttendanceStatus {
  AttendanceLoading,
  AttendanceEdited,
  AttendanceLoaded,
  AttendanceError
}

class AttendanceState {
  const AttendanceState._(
      {this.status = AttendanceStatus.AttendanceLoading,
      this.attendance = const <Attendance>[],
      this.hasReachedMax = false});
  final AttendanceStatus status;
  final bool hasReachedMax;
  final List<Attendance> attendance;

  const AttendanceState.loading() : this._();

  const AttendanceState.success(List<Attendance> attendance, bool hasReachedMax)
      : this._(
            status: AttendanceStatus.AttendanceLoaded,
            attendance: attendance,
            hasReachedMax: hasReachedMax);

  const AttendanceState.edited(List<Attendance> attendance)
      : this._(
            status: AttendanceStatus.AttendanceLoaded, attendance: attendance);

  const AttendanceState.failure()
      : this._(status: AttendanceStatus.AttendanceError);

  AttendanceState copyWith(
      {AttendanceStatus? status,
      List<Attendance>? attendance,
      bool? hasReachedMax}) {
    return AttendanceState._(
      status: status ?? this.status,
      attendance: attendance ?? this.attendance,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, attendance, hasReachedMax];
}
