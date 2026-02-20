import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubits_and_events_blocs.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// With Cubits
    final counterCubit = context.read<CounterCubit>();

    /// With Events and States
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// With Cubits
            Text('With Cubits', style: TextStyle(fontSize: 30)),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('$state', style: TextStyle(fontSize: 50));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  // onPressed: counterCubit.increment,
                  onPressed: () => counterCubit.increment(),
                  icon: Icon(Icons.add, size: 30),
                ),
                const SizedBox(width: 8),
                IconButton(
                  // onPressed: counterCubit.decrement,
                  onPressed: () => counterCubit.decrement(),
                  icon: Icon(Icons.remove, size: 30),
                ),
              ],
            ),

            const SizedBox(height: 100),

            /// With Events and States
            Text('With Events and States', style: TextStyle(fontSize: 30)),
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text('$state', style: TextStyle(fontSize: 50));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  // onPressed: counterCubit.increment,
                  onPressed: () => counterBloc.add(IncrementEvent()),
                  icon: Icon(Icons.add, size: 30),
                ),
                const SizedBox(width: 8),
                IconButton(
                  // onPressed: counterCubit.decrement,
                  onPressed: () => counterBloc.add(DecrementEvent()),
                  icon: Icon(Icons.remove, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
