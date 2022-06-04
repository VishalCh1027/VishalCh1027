import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:my_application/bloc/editrequest/service.dart';
import 'package:my_application/bloc/editrequest/state.dart';
import 'package:my_application/models/purchaserequest_model.dart';

class RequestCubit extends Cubit<RequestState> {
  final RequestService repository;
  RequestCubit({required this.repository})
      : super(const RequestState.loading());

  Future<void> getRequest(PurchaseRequest request) async {
    if (request != null) {
      emit(RequestState.success(request));
    } else {
      emit(RequestState.failure());
    }
  }

  Future<void> editRequest(PurchaseRequest request) async {
    if (request != null) {
      emit(RequestState.success(request));
    } else {
      emit(RequestState.failure());
    }
  }
}
