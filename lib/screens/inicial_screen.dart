import 'package:app_flutter/components/task.dart';
import 'package:flutter/material.dart';

class InicialScreen extends StatefulWidget {
  const InicialScreen({super.key});

  @override
  State<InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: Text('Tarefas', style: TextStyle(color: Colors.white)),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: [
            Task('Aprender Flutter', 'assets/images/flutter.png', 3),
            Task('Aprender Dart', 'assets/images/dart.jpg', 3),
            Task('Desenvolver App', 'assets/images/android.jpg', 4),
            Task('Alimentar o cachorro', 'assets/images/cachorro.jpg', 1),
            Task(
              'Aprender Estrutura de Dados',
              'assets/images/data_structure.jpg',
              4,
            ),
            Task('Meditar', 'assets/images/meditar.jpeg', 5),
            Task('Fazer Café', 'assets/images/coffee.jpg', 2),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Color.fromARGB(190, 40, 148, 252),
        child: Icon(Icons.remove_red_eye, color: Colors.white),
      ),
    );
  }
}
