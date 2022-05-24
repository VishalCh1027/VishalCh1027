import 'package:equatable/equatable.dart';

import '../../models/attendance_model.dart';
import '../../models/loginmodel.dart';

enum AttendanceStatus {
  AttendanceLoading,
  AttendanceEdited,
  AttendanceLoaded,
  AttendanceError
}

class AttendanceState extends Equatable {
  const AttendanceState._({
    this.status = AttendanceStatus.AttendanceLoading,
    this.attendance = const <Attendance>[],
  });
  final AttendanceStatus status;
  final List<Attendance> attendance;

  const AttendanceState.loading() : this._();

  const AttendanceState.success(List<Attendance> attendance)
      : this._(
            status: AttendanceStatus.AttendanceLoaded, attendance: attendance);

  const AttendanceState.edited(List<Attendance> attendance)
      : this._(status: AttendanceStatus.AttendanceEdited);

  const AttendanceState.failure()
      : this._(status: AttendanceStatus.AttendanceError);

  AttendanceState copyWith({
    List<Attendance>? attendance,
  }) {
    return AttendanceState._(
      attendance: attendance ?? this.attendance,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, attendance];
}
