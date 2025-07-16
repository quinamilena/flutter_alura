import 'package:flutter/material.dart';
import 'package:flutter_curso/widgets/difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int level;

  const Task(this.name, this.photo, this.level, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  //? Se for uma váriavel que precise que seu estado mude, precisa estar antes do override
  int nivel = 0;
  int mastery = 0;
  int masteryColor = 0;

  List<Color> masteryColors = <Color>[
    Color(Colors.blue.toARGB32()),
    Color(Colors.lightBlueAccent.toARGB32()),
    Color(Colors.lightBlue.toARGB32()),
    Color(Colors.green.toARGB32()),
    Color(Colors.lightGreenAccent.toARGB32()),
    Color(Colors.lightGreen.toARGB32()),
    Color(Colors.yellow.toARGB32()),
    Color(Colors.yellowAccent.toARGB32()),
    Color(Colors.orange.toARGB32()),
    Color(Colors.orangeAccent.toARGB32()),
    Color(Colors.red.toARGB32()),
  ];

  getValueProgress(int nivel) {
    double progress = nivel / widget.level ?? 1 / 10;

    if (progress > 0 && progress - 1 == mastery) {
      mastery++;
      masteryColor++;
    }

    if (progress > 1) {
      progress = progress - mastery;
    }

    if (masteryColor >= 10) {
      masteryColor = 0;
    }

    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: masteryColors[masteryColor],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(4)),
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                        ),
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                        ),
                        child: Image.asset(widget.photo, fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Difficulty(level: widget.level),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text('UP', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color:
                            [5, 6, 7].contains(masteryColor)
                                ? Colors.black
                                : Colors.white,
                        value: getValueProgress(nivel),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nível: $nivel",
                      style: TextStyle(
                        color:
                            [5, 6, 7, 8].contains(masteryColor)
                                ? Colors.black
                                : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
