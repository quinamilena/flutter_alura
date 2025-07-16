import 'package:flutter/material.dart';

class DrinkItem extends StatelessWidget {
const DrinkItem({ super.key, required this.imageURI, required this.itemTitle, required this.itemPrice });
final String imageURI;
final String itemTitle;
final String itemPrice;

  @override
  Widget build(BuildContext context){
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      elevation: 0,
      child: Column(
        children: <Widget>[
          Image(
            height: 120,
            width: double.infinity,
            image: AssetImage(imageURI),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(itemTitle, style: const TextStyle(fontSize: 16),),
                Text("R\$ $itemPrice"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
