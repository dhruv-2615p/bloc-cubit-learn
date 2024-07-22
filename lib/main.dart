import 'package:cubit_learn_1/logic/cubit/counter_cubit.dart';
import 'package:cubit_learn_1/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const HomeScreen(
          title: 'Flutter Demo Home Page',
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
