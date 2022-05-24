import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/attendance/event.dart';
import 'package:my_application/bloc/attendance/service.dart';
import 'package:my_application/bloc/attendance/state.dart';
import 'package:my_application/models/attendance_model.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final AttendanceService repository;
  AttendanceCubit({required this.repository})
      : super(const AttendanceState.loading());

  Future<void> getWorkmens(int projectId) async {
    var rs = await repository.getWorkmens(projectId);
    if (rs != null) {
      emit(AttendanceState.success(rs));
    } else {
      emit(AttendanceState.failure());
    }
  }

  Future<void> editAttendance() async {
    final attendance = state.attendance;
    var rs = await repository.editAttendance(attendance);
    if (rs != null) {
      emit(AttendanceState.success(attendance));
    } else {
      emit(AttendanceState.failure());
    }
  }

  Future<void> updatelist(Attendance attendance) async {
    state.attendance[state.attendance.indexOf(attendance)] = attendance;
    if (state.attendance != null) {
      emit(AttendanceState.edited(state.attendance));
    } else {
      emit(AttendanceState.failure());
    }
  }
}
