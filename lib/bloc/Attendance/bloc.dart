import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/attendance/state.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/models/attendance_model.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final WorkmenService repository;
  AttendanceCubit({required this.repository})
      : super(const AttendanceState.loading());

  bool allSelected = false;

//You should not use Equatable if you want the same state back-to-back to trigger multiple transitions.
  Future<void> getWorkmens(int projectId) async {
    if (state.hasReachedMax) return;
    try {
      var rs = await repository.getWorkmens(projectId, state.attendance.length);

      rs.isEmpty
          ? emit(AttendanceState.success(state.attendance, true))
          : emit(AttendanceState.success(
              List.of(state.attendance)
                ..addAll(rs
                    .map((e) => new Attendance(
                        selected: allSelected,
                        workmenId: e.id,
                        projectId: projectId,
                        workmen: e))
                    .toList()),
              false));
    } catch (e) {
      emit(AttendanceState.failure());
    }
  }

  Future<void> selectAll(bool value) async {
    allSelected = value;
    var attendance = state.attendance.map((e) {
      e.selected = value;
      return e;
    }).toList();
    if (attendance != null) {
      emit(AttendanceState.edited(attendance));
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
