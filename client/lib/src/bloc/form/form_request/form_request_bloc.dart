import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_request_event.dart';
part 'form_request_state.dart';

class FormRequestBloc extends Bloc<FormRequestEvent, FormRequestState> {
  FormRequestBloc() : super(FormRequestInitial());

  @override
  Stream<FormRequestState> mapEventToState(
    FormRequestEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
