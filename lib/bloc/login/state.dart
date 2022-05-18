import 'package:equatable/equatable.dart';

import '../../models/loginmodel.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginSuccessfully extends LoginState {
  final LoginModel accountModel;

  LoginSuccessfully(this.accountModel);
  @override
  // TODO: implement props
  List<Object> get props => [accountModel];
}

class LoginFailed extends LoginState {}

class LoginLoading extends LoginState {}

class LoginInit extends LoginState {}
