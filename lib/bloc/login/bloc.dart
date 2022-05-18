import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/bloc/login/state.dart';

import 'event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInit());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoginNow) {
      yield* mapLoginNowToState(event);
    } else if (event is GetCurrentLogin) {
      yield* mapGetCurrentLoginToState(event);
    }
  }

  Stream<LoginState> mapLoginNowToState(LoginNow event) async* {
    var rs = await LoginService().logIn(event.username, event.password);
    if (rs != null) {
      yield LoginSuccessfully(rs);
    } else {
      yield LoginFailed();
    }
  }

  Stream<LoginState> mapGetCurrentLoginToState(GetCurrentLogin event) async* {
    var rs = await LoginService().getCurrentLogin();
    if (rs != null) {
      yield LoginSuccessfully(rs);
    } else {
      yield LoginFailed();
    }
  }
}
