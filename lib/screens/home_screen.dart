import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/pizza.dart';
import 'pizza_details_screen.dart';
import '../widgets/pizza_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pizza> pizzas = [];

  @override
  void initState() {
    super.initState();
    _loadPizzas();
  }

  Future<void> _loadPizzas() async {
    final data = await DatabaseHelper.instance.getPizzas();
    setState(() {
      pizzas = data.map((e) => Pizza.fromMap(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          final pizza = pizzas[index];
          return PizzaCard(pizza: pizza);
        },
      ),
    );
  }
}
