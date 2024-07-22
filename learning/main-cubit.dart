// import 'dart:async';

// import 'package:bloc/bloc.dart';

/** Stream */
// Stream<int> boatStream() async* {
//   for (int i = 0; i <= 10; i++) {
//     print("SENT boat no. $i");
//     await Future.delayed(Duration(seconds: 2));
//     yield i;
//   }
// }

// void main() {
//   Stream<int> stream = boatStream();

//   stream.listen((event) {
//     print("RECIVED boat no. ${event.toString()}");
//   });
// }

/** Cubit */

// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);

//   void increment() => emit(state + 1);
//   void decrement() => emit(state - 1);
// }

// void main() {
//   final cubit = CounterCubit();

//   print(cubit.state);
//   cubit.increment();

//   print(cubit.state);
//   cubit.increment();

//   print(cubit.state);
//   cubit.decrement();

//   print(cubit.state);
//   cubit.close();
// }

// Future<void> main() async {
//   final cubit = CounterCubit();

//   // final streamSubscription = cubit.listen(print);

//   cubit.increment();
//   cubit.increment();
//   cubit.increment();
//   cubit.decrement();

//   await Future.delayed(Duration.zero);

//   await cubit.close();
// }
