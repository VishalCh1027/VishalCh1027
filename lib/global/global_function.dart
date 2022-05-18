import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/bloc.dart';
import '../bloc/login/event.dart';

refreshLogin(BuildContext context) async {
  BlocProvider.of<LoginBloc>(context).add(GetCurrentLogin());
}
