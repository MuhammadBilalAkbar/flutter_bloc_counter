import 'package:flutter_bloc/flutter_bloc.dart';

/// With Cubits
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

/// With Events and States
sealed class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) {
      emit(state + 1);
    });

    on<DecrementEvent>((event, emit) {
      emit(state - 1);
    });
  }
}
