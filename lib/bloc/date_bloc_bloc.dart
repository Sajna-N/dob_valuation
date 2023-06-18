import 'package:bloc/bloc.dart';

import './date_bloc_event.dart';
import './date_bloc_state.dart';

class DobBloc extends Bloc<DobEvent, DobState> {
  // DobBloc() : super(DobState(dateFormatted: ''));

  DobBloc() : super(DobState(dateFormatted: '')) {
    on<DobDateChanged>((event, emit) async* {
      emit(DobState(dateFormatted: event.date));
    });
  }
}
