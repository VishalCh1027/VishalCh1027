import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/attendance/event.dart';
import 'package:my_application/bloc/attendance/service.dart';
import 'package:my_application/bloc/attendance/state.dart';
import 'package:my_application/models/attendance_model.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  var _attendanceService = new AttendanceService();
  AttendanceBloc() : super(AttendanceLoading()) {
    // To catch every event, we just need to register
    // the parent class of all the event subclasses.
    on<GetWorkmens>(getWorkmens);
    on<EditAttendance>(editAttendance);
  }

  void getWorkmens(event, emit) async {
    var rs = await _attendanceService.getWorkmens(event.projectId);
    if (rs != null) {
      emit(AttendanceLoadedSuccessfully(rs));
    } else {
      emit(AttendanceError());
    }
  }

  void editAttendance(event, emit) async {
    var rs = await _attendanceService.editAttendance(event.attendances);
    if (rs != null) {
      emit(AttendanceSavedSuccessfully(rs));
    } else {
      emit(AttendanceError());
    }
  }

  // void editintime(event, emit) {
  //   var workmens = this.workmens;
  // }
}
