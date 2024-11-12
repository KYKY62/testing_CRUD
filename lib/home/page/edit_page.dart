import 'package:crud_flutter/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final HomeController homeC = HomeController();
  final TextEditingController title;
  final String initial;
  final int id;
  final int userId;
  final bool completed;
  EditPage({
    super.key,
    required this.initial,
    required this.id,
    required this.userId,
    required this.completed,
  }) : title = TextEditingController(text: initial);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => homeC.updateTodo(
                  context: context,
                  id: id,
                  completed: completed,
                ),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                ),
                child: const Text('Edit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
