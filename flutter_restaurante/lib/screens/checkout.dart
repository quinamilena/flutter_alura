import 'package:flutter/material.dart';
import 'package:flutter_restaurante/cardapio.dart';
import 'package:flutter_restaurante/components/order_item.dart';
import 'package:flutter_restaurante/components/payment_method.dart';
import 'package:flutter_restaurante/components/payment_total.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  final List<dynamic> orders = pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.account_circle, size: 32),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0, left: 8.0),
                child: Text(
                  'Pedidos',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return OrderItem(
                  imageURI: orders[index]['image'],
                  itemTitle: orders[index]['name'],
                  itemPrice: orders[index]['price'],
                );
              }, childCount: orders.length),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                child: Text(
                  'Pagamento',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SliverToBoxAdapter(child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
              child: PaymentMethod(),
            ),),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                child: Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SliverToBoxAdapter(child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
              child: PaymentTotal(),
            ),)
          ],
        ),
      ),
    );
  }
}
