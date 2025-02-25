import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          height: 650,
          width: 375,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  255,
                  204,
                  203,
                  203,
                ).withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 7,
                offset: Offset(1.0, 0.5),
              ),
            ],
          ),
          child: Column(children: []),
        ),
      ),
    );
  }
}
