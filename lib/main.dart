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
          leading: Container(),
          backgroundColor: primaryColor,
          title: Text('Tarefas', style: TextStyle(color: Colors.white)),
        ),
        body: ListView(
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
        //floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(widget.foto, fit: BoxFit.cover),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color:
                                  widget.dificuldade >= 1
                                      ? Colors.blue
                                      : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color:
                                  widget.dificuldade >= 2
                                      ? Colors.blue
                                      : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color:
                                  widget.dificuldade >= 3
                                      ? Colors.blue
                                      : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color:
                                  widget.dificuldade >= 4
                                      ? Colors.blue
                                      : Colors.blue[100],
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color:
                                  widget.dificuldade >= 5
                                      ? Colors.blue
                                      : Colors.blue[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_drop_up, color: Colors.white),
                            Text(
                              'Lvl Up',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
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
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: Colors.white,
                        value:
                            widget.dificuldade > 0
                                ? (nivel / widget.dificuldade) / 10
                                : 1,
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
