import 'package:equatable/equatable.dart';

import '../../models/attendance_model.dart';
import '../../models/loginmodel.dart';

class AttendanceState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AttendanceLoadedSuccessfully extends AttendanceState {
  final Attendance accountModel;

  AttendanceLoadedSuccessfully(this.accountModel);
  @override
  // TODO: implement props
  List<Object> get props => [accountModel];
}

class AttendanceLoading extends AttendanceState {}

class AttendanceError extends AttendanceState {}
