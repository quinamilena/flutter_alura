import 'package:flutter/material.dart';
import 'package:flutter_curso/widgets/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required Widget child}) : super(child: child);

  List<Task> taskList = [
    Task('Andar de bike', "assets/images/task1.jpeg", 5),
    Task('Jogar', "assets/images/task2.png", 1),
    Task('Aprender flutter', "assets/images/task3.png", 3),
  ];

  void newtask(String name, String photo, int difficulty) {
    print("addddddddddddddddddddddddddddddddd");

    List<Task> oldList = List.from(taskList);

    oldList.add(Task(name, photo, difficulty));

    taskList = oldList;

    print("Lista: ${taskList.length}");
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return taskList.length != old.taskList.length;
  }
}
