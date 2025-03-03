import 'package:app_flutter/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 3),
    Task('Aprender Dart', 'assets/images/dart.jpg', 3),
    Task('Desenvolver App', 'assets/images/android.jpg', 4),
    Task('Alimentar o cachorro', 'assets/images/cachorro.jpg', 1),
    Task('Aprender Estrutura de Dados', 'assets/images/data_structure.jpg', 4),
    Task('Meditar', 'assets/images/meditar.jpeg', 5),
    Task('Fazer Café', 'assets/images/coffee.jpg', 2),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
