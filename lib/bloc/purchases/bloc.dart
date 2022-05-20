import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/bloc/purchases/event.dart';
import 'package:my_application/bloc/purchases/service.dart';
import 'package:my_application/bloc/purchases/state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc(PurchasesState initialState) : super(initialState) {
    // To catch every event, we just need to register
    // the parent class of all the event subclasses.
    on<PurchasesEvent>(
      // If you squint, it's just like looking at mapEventToState
      (event, emit) {
        // Don't forget to pass emit to your handlers, though!
        if (event is GetPurchases) getPurchases(event, emit);
      },
    );
  }

  void getPurchases(event, emit) async {
    var rs = await PurchasesService().GetPurchases(event.employeeId);
    if (rs != null) {
      emit(PurchasesLoadedSuccessfully(rs));
    } else {
      emit(PurchasesError());
    }
  }
}
