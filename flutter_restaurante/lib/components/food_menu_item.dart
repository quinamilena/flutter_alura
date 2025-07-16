import 'package:flutter/material.dart';

class FoodMenuItem extends StatelessWidget {
  const FoodMenuItem({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
  });

  final String foodImage;
  final String foodName;
  final String foodPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context).colorScheme.surfaceContainer,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      foodName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text("R\$ $foodPrice"),
                ],
              ),
            ),
            Image(
              width: 80,
              height: 80,
              image: AssetImage(foodImage),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
