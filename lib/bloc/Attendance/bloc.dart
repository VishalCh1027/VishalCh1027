import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/attendance/state.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/models/attendance_model.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final WorkmenService repository;
  AttendanceCubit({required this.repository})
      : super(const AttendanceState.loading());

//You should not use Equatable if you want the same state back-to-back to trigger multiple transitions.
  Future<void> getWorkmens(int projectId) async {
    var rs = await repository.getWorkmens(projectId);
    var attendance = rs
        .map((e) =>
            new Attendance(workmenId: e.id, projectId: projectId, workmen: e))
        .toList();
    if (rs != null) {
      emit(AttendanceState.success(attendance));
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

  Future<void> updateInTime(Attendance attendance, TimeOfDay intime) async {
    attendance.in_ = intime;
    if (state.attendance != null) {
      emit(AttendanceState.edited(state.attendance));
    } else {
      emit(AttendanceState.failure());
    }
  }

  Future<void> updateShift(Attendance attendance, double? shift) async {
    attendance.shift = shift;
    if (state.attendance != null) {
      emit(AttendanceState.edited(state.attendance));
    } else {
      emit(AttendanceState.failure());
    }
  }

  Future<void> updateList(List<Attendance> attendances) async {
    if (state.attendance != null) {
      emit(AttendanceState.edited(state.attendance));
    } else {
      emit(AttendanceState.failure());
    }
  }
}
