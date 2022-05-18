import 'package:equatable/equatable.dart';
import 'package:my_application/models/attendance_model.dart';

class AttendanceEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class getWorkmens extends AttendanceEvent {
  final Attendance accountModel;

  getWorkmens(this.accountModel);
  @override
  // TODO: implement props
  List<Object> get props => [accountModel];
}
