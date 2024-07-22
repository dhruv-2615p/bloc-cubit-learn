import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_learn_1/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;
    counterCubit = CounterCubit();
    setUp(
      () {
        counterCubit = CounterCubit();
      },
    );
    tearDown(
      () {
        counterCubit.close();
      },
    );

    test(
      'the initial state for the CounterCubit is CounterState(counterValue = 0)',
      () {
        expect(counterCubit.state, const CounterState(counterValue: 0));
      },
    );

    blocTest(
      'the cubit should emit CounterState(conterValue = 1, isIncremented = true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [const CounterState(counterValue: 1, isIncremented: true)],
    );

    blocTest(
      'the cubit should emit CounterState(conterValue = -1, isIncremented = false) when cubit.decrement() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [const CounterState(counterValue: -1, isIncremented: false)],
    );
  });
}
