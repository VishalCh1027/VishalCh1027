import '../../models/loginmodel.dart';

class LoginState {
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

class LoginError extends LoginState {
  final String error;

  LoginError(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class LoginInit extends LoginState {}
