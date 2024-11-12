import 'package:crud_flutter/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  final HomeController homeC = HomeController();
  AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: homeC.title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => homeC.addTodo(context),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                ),
                child: const Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
