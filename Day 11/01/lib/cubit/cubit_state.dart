import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sub7a extends Cubit<int> {
  Sub7a() : super(0);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  void refresh() => emit(0);
}

class Salah extends StatelessWidget {
  const Salah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Sub7a(),
      child: BlocBuilder<Sub7a, int>(
        builder: (context, state) {
          final cubit = context.read<Sub7a>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 77, 124, 211),
              title: const Text(
                "Sub7a",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: cubit.increment,
                    child: const Icon(Icons.add),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: cubit.decrement,
                    child: const Icon(Icons.remove),
                  ),

                  const SizedBox(height: 10),

                  /// Reset
                  ElevatedButton(
                    onPressed: cubit.refresh,
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
