import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_bloc_app/bloc/pizza_bloc.dart';
import 'package:pizza_bloc_app/models/pizza_model.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return const CircularProgressIndicator(color: Colors.orange);
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.pizzas.length}',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.height,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        ...state.pizzas.map(
                          (e) => Positioned(
                            left: Random().nextInt(250).toDouble(),
                            top: Random().nextInt(400).toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: e.image,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () => context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0])),
            child: const Icon(Icons.local_pizza_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () => context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0])),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange[500],
            onPressed: () => context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1])),
            child: const Icon(Icons.local_pizza),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange[500],
            onPressed: () => context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1])),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
