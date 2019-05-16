import 'package:flutter/material.dart';
import 'package:flutter_todo/models/Todo.dart';
import 'package:scoped_model/scoped_model.dart';

class TodoModel extends Model {
  final List<Todo> _todos = [];
  List<Todo> get todos => List.from(_todos);

  static TodoModel of(BuildContext context) =>
      ScopedModel.of<TodoModel>(context, rebuildOnChange: true);

  void add({String title, String description}) {
    _todos.add(
      Todo(
        title: title,
        description: description,
      ),
    );
    notifyListeners();
  }

  void delete(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
