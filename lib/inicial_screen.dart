import 'package:app_flutter/task.dart';
import 'package:flutter/material.dart';

class inicialScreen extends StatefulWidget {
  const inicialScreen({super.key});

  @override
  State<inicialScreen> createState() => _inicialScreenState();
}

class _inicialScreenState extends State<inicialScreen> {
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
            Task(
              'Aprender Flutter',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              3,
            ),
            Task(
              'Aprender Dart',
              'https://m.media-amazon.com/images/I/51z07YgHRBL.jpg',
              3,
            ),
            Task(
              'Desenvolver App',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxna5cYeZyX22C7YSdVpICKlblUQ6xgewGBA&s',
              4,
            ),
            Task(
              'Alimentar o cachorro',
              'https://static.vecteezy.com/system/resources/previews/005/293/990/non_2x/pet-food-logo-with-dog-icon-suitable-for-pet-shop-and-vet-free-vector.jpg',
              1,
            ),
            Task(
              'Aprender Estrutura de Dados',
              'https://media.licdn.com/dms/image/D5612AQG1pE_H-m9TgQ/article-cover_image-shrink_720_1280/0/1677414547742?e=2147483647&v=beta&t=TkQybfOZuzU9MyNSYbpqUg0eyEJoALfwEyTpwmnJZgg',
              4,
            ),
            Task(
              'Meditar',
              'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
              4,
            ),
            Task(
              'Fazer Café',
              'https://cdn.pixabay.com/photo/2022/03/09/05/05/coffee-7057030_1280.png',
              2,
            ),
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
