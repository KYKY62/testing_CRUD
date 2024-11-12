import 'package:crud_flutter/home/controller/home_controller.dart';
import 'package:crud_flutter/home/model/todos_model.dart';
import 'package:crud_flutter/home/page/add_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeC = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddPage(),
            ));
          },
        ),
        appBar: AppBar(
          title: const Text("Home"),
          actions: const [],
        ),
        body: FutureBuilder<List<TodosModel>>(
            future: homeC.getTodo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Data Kosong'));
              }
              var todos = snapshot.data!;
              return ListView.separated(
                itemCount: todos.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () => homeC.deleteTodo(id: todos[index].id!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              todos[index].todo!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Checkbox(
                            value: homeC.value,
                            onChanged: (value) {
                              setState(() {
                                homeC.value = value!;
                                // todos[index].completed = value!;
                                // print(todos[index].completed);
                                // homeC.updateTodo(
                                //     id: todos[index].id!, completed: value);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
