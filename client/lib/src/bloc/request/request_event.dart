part of 'request_bloc.dart';

@immutable
abstract class RequestEvent {}

class RequestLoad extends RequestEvent {
  Request request;
  RequestLoad(this.request);
}
class RequestsLoad extends RequestEvent {
  List<Request> requests;
  RequestsLoad(this.requests);
}

class RequestCreate extends RequestEvent {
  Request request;
  RequestCreate(this.request);
  @override
  String toString() {
    // TODO: implement toString
    return "Request Created {request: $request";
  }
}

class RequestUpdate extends RequestEvent {
  Request request;
  RequestUpdate(this.request);
  @override
  String toString() {
    // TODO: implement toString
    return "Request Updated {request: $request";
  }
  
}

class RequestDelete extends RequestEvent {
  Request request;
  RequestDelete(this.request);
  @override
  String toString() {
    // TODO: implement toString
    return "Request Deleted {request: $request";
  }
}
