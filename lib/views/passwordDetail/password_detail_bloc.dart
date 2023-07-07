import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'password_detail_event.dart';
part 'password_detail_state.dart';

class PasswordDetailBloc extends Bloc<PasswordDetailEvent, PasswordDetailState> {
  PasswordDetailBloc() : super(PasswordDetailInitial()) {
    on<PasswordDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
