import 'package:flutter/material.dart';
import '../models/pizza.dart';
import '../screens/pizza_details_screen.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;
  const PizzaCard({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(pizza.image, width: 60),
        title: Text(pizza.name),
        subtitle: Text('Rs. ${pizza.price.toStringAsFixed(2)}'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PizzaDetailsScreen(pizza: pizza),
            ),
          );
        },
      ),
    );
  }
}
