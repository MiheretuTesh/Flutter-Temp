import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eshiblood/src/models/request.dart';
import 'package:eshiblood/src/repository/request_repository.dart';
import 'package:meta/meta.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestRepository requestRepository;
  RequestBloc({required this.requestRepository}) : super(RequestLoading());

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    if (event is RequestLoad){
      yield RequestLoading();
      try {
        final requests = await requestRepository.getRequests();
        yield RequestLoadSuccess(requests);
      } catch (e) {
        yield RequestOperationFailure();
      }
    }
    if (event is RequestCreate){
      yield RequestLoading();
      try {
        await requestRepository.createRequest(event.request);
        final requests = await requestRepository.getRequests();
        yield RequestLoadSuccess(requests);
      } catch (e) {
        yield RequestOperationFailure();
      }
    }
    if (event is RequestUpdate){
      yield RequestLoading();
      try {
        await requestRepository.updateRequest(event.request);
        final requests = await requestRepository.getRequests();
        yield RequestLoadSuccess(requests);
      } catch (e) {
        yield RequestOperationFailure();
      }
    }
    if (event is RequestDelete){
      yield RequestLoading();
      try {
        await requestRepository.deleteRequest(event.request.id??"");
        final requests = await requestRepository.getRequests();
        yield RequestLoadSuccess(requests);
      } catch (e) {
        yield RequestOperationFailure();
      }
    }
  }
}
