import 'package:flutter/material.dart';
import 'package:flutter_restaurante/components/counter_component.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
    required this.imageURI,
    required this.itemTitle,
    required this.itemPrice,
  });

  final String imageURI;
  final String itemTitle;
  final String itemPrice;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image(
            image: AssetImage(widget.imageURI),
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
          // Serve apenas para colum e row para oculpar o espaço disponível
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.itemTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("R\$ ${widget.itemPrice}"),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CounterComponent(),
          ),
        ],
      ),
    );
  }
}
