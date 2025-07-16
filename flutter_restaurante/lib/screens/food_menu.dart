import 'package:flutter/material.dart';
import 'package:flutter_restaurante/cardapio.dart';
import 'package:flutter_restaurante/components/food_menu_item.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

  final List<dynamic> foodItems = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Destaques',
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return   FoodMenuItem(
                foodImage: foodItems[index]['image'],
                foodName: foodItems[index]['name'],
                foodPrice: foodItems[index]['price'],
              );
            }, childCount: foodItems.length),
          ),
        ],
      ),
    );
  }
}
