import 'dart:convert';
import 'dart:math';

import 'package:crud_flutter/home/model/todos_model.dart';
import 'package:crud_flutter/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeController {
  static const String baseUrl = 'https://dummyjson.com/todos';

  TextEditingController title = TextEditingController();
  bool value = false;
  final random = Random();
  void addTodo(context) async {
    try {
      if (title.text.isNotEmpty) {
        TodosModel todo = TodosModel(
          todo: title.text,
          completed: false,
          userId: random.nextInt(101),
        );
        final response = await http.post(
          Uri.parse('$baseUrl/add'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(todo.toJson()),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('Todo added successfully');
          title.clear();
          Navigator.of(context).pop(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        } else {
          print('Failed to add todo: ${response.body}');
        }
      }
    } catch (_) {}
  }

  Future<List<TodosModel>> getTodo() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print('Todo added successfully');
        List getTodos = json.decode(response.body)['todos'];
        return getTodos.map((data) => TodosModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (_) {
      return [];
    }
  }

  void updateTodo({
    context,
    required int id,
    required bool completed,
  }) async {
    try {
      TodosModel todo = TodosModel(completed: completed);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(todo.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Todo update successfully');
      } else {
        print('Failed to update todo: ${response.body}');
      }
    } catch (_) {}
  }

  void deleteTodo({required int id}) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Todo delete successfully');
      } else {
        print('Failed to delete todo: ${response.body}');
      }
    } catch (_) {}
  }
}
