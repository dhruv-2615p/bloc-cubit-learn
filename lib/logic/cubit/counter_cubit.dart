import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterState(counterValue: 0, isIncremented: null));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));
}
