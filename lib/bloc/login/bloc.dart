import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/login/service.dart';
import 'package:my_application/bloc/login/state.dart';

import 'event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInit()) {
    // To catch every event, we just need to register
    // the parent class of all the event subclasses.
    on<LoginEvent>(
      // If you squint, it's just like looking at mapEventToState
      (event, emit) {
        // Don't forget to pass emit to your handlers, though!
        if (event is LoginEvent)
          loginNow(event, emit);
        else if (event is GetCurrentLogin) getCurrentLogin(event, emit);
      },
    );
  }

  void loginNow(event, emit) async {
    var rs = await LoginService().logIn(event.username, event.password);
    if (rs != null) {
      emit(LoginSuccessfully(rs));
    } else {
      emit(LoginFailed());
    }
  }

  void getCurrentLogin(event, emit) async {
    var rs = await LoginService().getCurrentLogin();
    if (rs != null) {
      emit(LoginSuccessfully(rs));
    } else {
      emit(LoginFailed());
    }
  }
}
