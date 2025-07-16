import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int level;

  const Difficulty({super.key, required this.level});

  getStar(int level) {
    //? Limitar para até 5 estrelas
    level = level.clamp(0, 5);

    var rowStar = Row(children: []);

    for (int i = 0; i < level; i++) {
      rowStar.children.add(Icon(Icons.star, size: 15, color: Colors.blue));
    }

    for (int i = 0; i < 5 - level; i++) {
      rowStar.children.add(
        Icon(Icons.star_border, size: 15, color: Colors.blue[100]),
      );
    }

    return rowStar;
  }

  @override
  Widget build(BuildContext context) {
    return getStar(level);
  }
}
