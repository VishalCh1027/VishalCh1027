import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/bloc/workmen_list/state.dart';

class WorkmenCubit extends Cubit<WorkmenState> {
  final WorkmenService repository;
  WorkmenCubit({required this.repository})
      : super(const WorkmenState.loading());

//You should not use Equatable if you want the same state back-to-back to trigger multiple transitions.
  Future<void> getWorkmens(int projectId) async {
    if (state.hasReachedMax) return;
    try {
      var rs = await repository.getWorkmens(projectId, state.workmens.length);
      rs.isEmpty
          ? emit(
              WorkmenState.success(List.of(state.workmens)..addAll(rs), true))
          : emit(
              WorkmenState.success(List.of(state.workmens)..addAll(rs), false));
    } catch (e) {
      emit(WorkmenState.failure());
    }
  }
}
