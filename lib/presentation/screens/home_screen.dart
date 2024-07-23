import 'package:cubit_learn_1/constants/enums.dart';
import 'package:cubit_learn_1/logic/cubit/counter_cubit.dart';
import 'package:cubit_learn_1/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  {
                    return Text(
                      'Wi-Fi',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.green),
                    );
                  }
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.red),
                  );
                } else if (state is InternetDisonnected) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.grey),
                  );
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.pink,
                ));
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.isIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Builder(builder: (context) {
              /** context.watch using */
              // final counterState = context.watch<CounterCubit>().state;
              // final internetState = context.watch<InternetCubit>().state;
              // if (internetState is InternetConnected &&
              //     internetState.connectionType == ConnectionType.mobile) {
              //   return Text(
              //     'Counter: ${counterState.counterValue.toString()} Internet: Mobile',
              //     style: Theme.of(context).textTheme.headlineMedium,
              //   );
              // }
              // else if(internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi){
              //   return Text(
              //     'Counter: ${counterState.counterValue.toString()} Internet: Wi-Fi',
              //     style: Theme.of(context).textTheme.headlineMedium,
              //   );
              // }else{
              //   return Text(
              //     'Counter: ${counterState.counterValue.toString()} Internet: Disconnected',
              //     style: Theme.of(context).textTheme.headlineMedium,
              //   );
              // }

              /** context.select using */
              return Builder(builder: (context) {
                final counterValue = context.select(
                  (CounterCubit cubit) => cubit.state.counterValue,
                );
                return Text(
                  "Counter: ${counterValue.toString()}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              });
            }),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text('Second Screen'),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text('Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
