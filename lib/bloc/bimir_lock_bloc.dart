import 'package:bloc/bloc.dart';

part 'bimir_lock_event.dart';
part 'bimir_lock_state.dart';

class BimirLockBloc extends Bloc<BimirLockEvent, BimirLockState> {
  BimirLockBloc() : super(BimirLockInitial()) {
    on<BimirLockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
