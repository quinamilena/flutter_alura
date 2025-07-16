import 'package:flutter/material.dart';
import 'package:flutter_restaurante/themes/app_colors.dart';

class CounterComponent extends StatefulWidget {
  const CounterComponent({super.key});

  @override
  State<CounterComponent> createState() => _CounterComponentState();
}

class _CounterComponentState extends State<CounterComponent> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              _counter++;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.counterButtonColor,
            ),
            child: const Icon(Icons.arrow_drop_up),
          ),
        ),
        Text(_counter.toString()),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              _counter--;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.counterButtonColor,
            ),
            child: const Icon(Icons.arrow_drop_down),
          ),
        ),
      ],
    );
  }
}
