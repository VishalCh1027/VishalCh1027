import 'package:equatable/equatable.dart';
import 'package:my_application/models/attendance_model.dart';

class AttendanceEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetWorkmens extends AttendanceEvent {
  final int projectId;

  GetWorkmens(this.projectId);
}

class EditAttendance extends AttendanceEvent {
  final List<Attendance> attendances;

  EditAttendance(this.attendances);
}

class EditIntime extends AttendanceEvent {
  final Attendance attendance;

  EditIntime(this.attendance);
}
