import 'package:app_flutter/data/task_inherited.dart';
import 'package:app_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InicialScreen extends StatefulWidget {
  const InicialScreen({super.key});

  @override
  State<InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
  double globalLevel = 0;
  double progressBarValue = 0;

  void refreshLevelPage() {
    setState(() {
      globalLevel = 0; //para resetar os valores armazenados em cache
      progressBarValue = 0; //para resetar os valores armazenados em cache
      for (var task in TaskInherited.of(context)?.taskList ?? []) {
        final taskLevel = (task.nivel * task.dificuldade) / 10;
        globalLevel += taskLevel;
      }
      progressBarValue = globalLevel / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_task, color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          ' Tarefas',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        //Desafio Nivel global de tarefas
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 180,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.white,
                    value: progressBarValue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Level Global: ${globalLevel.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: IconButton(
              icon: Icon(Icons.loop),
              onPressed: () {
                refreshLevelPage();
              },
            ),
          ),
        ],
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
