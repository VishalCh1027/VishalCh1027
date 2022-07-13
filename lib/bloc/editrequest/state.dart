import '../../../models/purchaserequest_model.dart';

enum RequestStatus {
  RequestLoading,
  RequestEdited,
  RequestLoaded,
  RequestError
}

class RequestState {
  const RequestState._({
    this.status = RequestStatus.RequestLoading,
    this.request,
  });
  final RequestStatus status;
  final PurchaseRequest? request;

  const RequestState.loading() : this._();

  const RequestState.success(PurchaseRequest request)
      : this._(status: RequestStatus.RequestLoaded, request: request);

  const RequestState.edited(PurchaseRequest request)
      : this._(status: RequestStatus.RequestEdited, request: request);

  const RequestState.failure() : this._(status: RequestStatus.RequestError);

  RequestState copyWith({
    PurchaseRequest? request,
  }) {
    return RequestState._(
      request: request ?? this.request,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, request];
}
