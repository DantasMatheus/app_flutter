import 'package:app_flutter/components/difficulty.dart';
import 'package:app_flutter/data/task_dao.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  int nivel;
  int maestria;

  Task(
    this.nome,
    this.foto,
    this.dificuldade, {
    super.key,
    this.maestria = 0,
    this.nivel = 1,
  });

  bool levelMax = false;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  List<Color> colors = [
    Color.fromARGB(255, 105, 105, 105),
    Colors.blue,
    Colors.purple,
    Colors.brown,
    Colors.black,
    Color.fromARGB(255, 155, 17, 30),
    Color.fromARGB(255, 184, 134, 11),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: colors[widget.maestria],
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
                        child:
                            assetOrNetwork()
                                ? Image.asset(widget.foto, fit: BoxFit.cover)
                                : Image.network(widget.foto, fit: BoxFit.cover),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Difficulty(difficultyLevel: widget.dificuldade),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                            if ((widget.nivel / widget.dificuldade) / 10 > 1) {
                              if (widget.maestria < colors.length - 1) {
                                widget.maestria++;
                                widget.nivel = 1;
                              } else {
                                widget.levelMax = true;
                                _maestryMessage(context);
                              }
                            }
                            TaskDao().save(widget);
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
                                ? (widget.nivel / widget.dificuldade) / 10
                                : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      widget.levelMax == true
                          ? 'Maestria Completa'
                          : 'Nível ${widget.nivel}',
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

_maestryMessage(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 80,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 184, 134, 11),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                const Icon(Icons.celebration, color: Colors.white, size: 40),
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Maestria Máxima Alcançada",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
