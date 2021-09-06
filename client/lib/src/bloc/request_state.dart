part of 'request_bloc.dart';

@immutable
abstract class RequestState {}

class RequestLoading extends RequestState {}
class RequestsLoadSuccess extends RequestState {
  List<Request> requests=[];
  RequestsLoadSuccess(this.requests);
}

class RequestLoadSuccess extends RequestState {
  Request request;
  RequestLoadSuccess(this.request);
}
class RequestOperationFailure extends RequestState {}

class RequestCreateSuccess extends RequestState{
  Request request;

  RequestCreateSuccess(this.request);
}
class RequestUpdateSuccess extends RequestState{
  Request request;

  RequestUpdateSuccess(Request this.request);
}
class RequestDeleteSuccess extends RequestState{}
