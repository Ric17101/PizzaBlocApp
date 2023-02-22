import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Pizza({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Pizza> pizzas = [
    Pizza(
      id: '0',
      name: 'Arugala',
      image: Image.asset('images/arugala.png'),
    ),
    Pizza(
      id: '1',
      name: 'Chicken',
      image: Image.asset('images/chicken.png'),
    ),
    Pizza(
      id: '2',
      name: 'Pepperoni',
      image: Image.asset('images/pepperoni.png'),
    ),
  ];
}
