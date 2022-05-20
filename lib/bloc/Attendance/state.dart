import 'package:equatable/equatable.dart';

import '../../models/attendance_model.dart';
import '../../models/loginmodel.dart';

class AttendanceState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AttendanceLoadedSuccessfully extends AttendanceState {
  final List<Attendance> workmens;

  AttendanceLoadedSuccessfully(this.workmens);
  @override
  // TODO: implement props
  List<Object> get props => [workmens];
}

class AttendanceLoading extends AttendanceState {}

class AttendanceError extends AttendanceState {}

class AttendanceSavedSuccessfully extends AttendanceState {
  final Object result;

  AttendanceSavedSuccessfully(this.result);
  @override
  // TODO: implement props
  List<Object> get props => [result];
}
