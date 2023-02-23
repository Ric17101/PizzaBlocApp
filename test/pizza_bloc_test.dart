import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_bloc_app/bloc/pizza_bloc.dart';
import 'package:pizza_bloc_app/models/pizza_model.dart';

void main() {
  group('Pizza Bloc test', () {
    late PizzaBloc pizzaBloc;

    setUp(() {
      pizzaBloc = PizzaBloc();
    });

    test('Initial test', () {
      expect(pizzaBloc.state, PizzaInitial());
    });

    blocTest<PizzaBloc, PizzaState>(
      'emits PizzaLoaded(pizzas: <Pizza>[]) when add LoadPizzaCounter()',
      build: () => pizzaBloc,
      seed: () => PizzaInitial(),
      act: (bloc) => bloc.add(LoadPizzaCounter()),
      wait: const Duration(seconds: 1),
      expect: () => <PizzaState>[const PizzaLoaded(pizzas: <Pizza>[])],
    );

    blocTest<PizzaBloc, PizzaState>(
      'emits PizzaLoaded(pizzas: [Pizza.pizzas[0]]) when add AddPizza(Pizza.pizzas[0])',
      build: () => pizzaBloc,
      seed: () => const PizzaLoaded(pizzas: <Pizza>[]),
      act: (bloc) => bloc.add(AddPizza(Pizza.pizzas[0])),
      expect: () => <PizzaState>[
        PizzaLoaded(pizzas: [Pizza.pizzas[0]])
      ],
      verify: (bloc) {
        if (kDebugMode) {
          print("bloc.state ${bloc.state}");
        }
      },
    );

    blocTest<PizzaBloc, PizzaState>(
      'emits PizzaLoaded(pizzas: [Pizza.pizzas[1]]) when add AddPizza(Pizza.pizzas[1])',
      build: () => pizzaBloc,
      seed: () => const PizzaLoaded(pizzas: <Pizza>[]),
      act: (bloc) => bloc.add(AddPizza(Pizza.pizzas[1])),
      expect: () => <PizzaState>[
        PizzaLoaded(pizzas: [Pizza.pizzas[1]])
      ],
      verify: (bloc) {
        if (kDebugMode) {
          print("bloc.state ${bloc.state}");
        }
      },
    );

    blocTest<PizzaBloc, PizzaState>(
      'emits PizzaLoaded(pizzas: []) when add RemovePizza(Pizza.pizzas[0])',
      build: () => pizzaBloc,
      seed: () => PizzaLoaded(pizzas: <Pizza>[Pizza.pizzas[0]]),
      act: (bloc) => bloc
        ..add(LoadPizzaCounter())
        ..add(RemovePizza(Pizza.pizzas[0])),
      expect: () => <PizzaState>[
        const PizzaLoaded(pizzas: []),
      ],
      verify: (bloc) {
        if (kDebugMode) {
          print("bloc.state ${bloc.state}");
        }
      },
    );
  });
}
