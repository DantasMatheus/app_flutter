import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:app_flutter/components/task.dart';
import 'package:app_flutter/data/task_dao.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  SingleSelectController<String?> difficultyController =
      SingleSelectController<String?>(null);

  final _formKey = GlobalKey<FormState>();
  List<String> difficulties = ['1', '2', '3', '4', '5'];

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nova Tarefa',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomDropdown<String>(
                      hintText: 'Escolha a Dificuldade',
                      items: difficulties,
                      controller: difficultyController,
                      decoration: CustomDropdownDecoration(
                        closedBorderRadius: BorderRadius.circular(5),
                        expandedBorderRadius: BorderRadius.circular(5),
                        closedFillColor: Colors.white70,
                        closedBorder: Border.all(color: Colors.black),
                        expandedBorder: Border.all(color: Colors.blue),
                      ),
                      onChanged: (value) {
                        setState(() {
                          difficultyController.value = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira um URL de Imagem válido para a tarefa';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (
                          BuildContext context,
                          Object exception,
                          StackTrace? stackTrace,
                        ) {
                          return Image.asset('assets/images/nophoto.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskDao().save(
                          Task(
                            nameController.text,
                            imageController.text,
                            int.parse(difficultyController.value ?? '1'),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.fixed,
                            elevation: 150.0,
                            content: Text('Criando uma nova Tarefa'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Adicionar!'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
