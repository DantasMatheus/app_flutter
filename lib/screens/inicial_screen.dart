import 'package:app_flutter/data/task_inherited.dart';
import 'package:app_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InicialScreen extends StatefulWidget {
  const InicialScreen({super.key});

  @override
  State<InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_task, color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text('Tarefas', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context)?.taskList ?? [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        backgroundColor: Color.fromARGB(190, 40, 148, 252),
        child: Icon(Icons.add_sharp, color: Colors.white),
      ),
    );
  }
}
