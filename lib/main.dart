import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.blue;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Tarefas', style: TextStyle(color: Colors.white)),
        ),
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

class Task extends StatefulWidget {
  final String nome;
  const Task(this.nome, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140),
          Column(
            children: [
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
                        widget.nome,
                        style: TextStyle(
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nivel++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Icon(Icons.arrow_drop_up, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.grey,
                        value: nivel / 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Nível $nivel',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
