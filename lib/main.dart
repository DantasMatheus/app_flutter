import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Tarefas')),
        body: ListView(
          children: [
            Task('Aprender Flutter'),
            Task('Aprender Dart'),
            Task('Desenvolver App'),
            Task('Alimentar o cachorro'),
            Task('Aprender Estrutura de Dados'),
            Task('Meditar'),
            Task('Fazer Café'),
          ],
        ),

        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.black26, width: 72, height: 100),
                SizedBox(
                  width: 200,
                  child: Text(
                    nome,
                    style: TextStyle(
                      fontSize: 24,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_drop_up),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
