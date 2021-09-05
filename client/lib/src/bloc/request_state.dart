part of 'request_bloc.dart';

@immutable
abstract class RequestState {}

class RequestLoading extends RequestState {}
class RequestLoadSuccess extends RequestState {
  List<Request> requests=[];
  RequestLoadSuccess(this.requests);
}
class RequestOperationFailure extends RequestState {}

