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
    var rs = await repository.getWorkmens(projectId);
    if (rs != null) {
      emit(WorkmenState.success(rs));
    } else {
      emit(WorkmenState.failure());
    }
  }
}
