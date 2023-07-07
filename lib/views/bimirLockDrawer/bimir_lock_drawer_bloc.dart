import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bimir_lock_drawer_event.dart';
part 'bimir_lock_drawer_state.dart';

class BimirLockDrawerBloc extends Bloc<BimirLockDrawerEvent, BimirLockDrawerState> {
  BimirLockDrawerBloc() : super(BimirLockDrawerInitial()) {
    on<BimirLockDrawerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
