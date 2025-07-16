import 'package:flutter/material.dart';
import 'package:flutter_curso/data/task_inherited.dart';
import 'package:flutter_curso/screen/form_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: SizedBox(), title: Text('Tarefas')),

      body: ListView(children: TaskInherited.of(context).taskList),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (BuildContext contextNew) => FormScreen(taskContext: context),
            ),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
