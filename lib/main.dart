import 'package:flutter/material.dart';
import 'package:flutter_todo/scoped_models/todo.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScopedModel<TodoModel>(
        model: TodoModel(),
        child: ScopedModelDescendant(
          builder: (BuildContext builder, Widget child, TodoModel model) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Flutter Todo'),
              ),
              body: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    direction: DismissDirection.endToStart,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(model.todos[index].title),
                          subtitle: Text(model.todos[index].description),
                          trailing: Text('14 March'),
                        ),
                        Divider(),
                      ],
                    ),
                    onDismissed: (DismissDirection direction) {
                      model.delete(index);
                    },
                  );
                },
                itemCount: model.todos.length,
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  model.add(
                    title: 'Test Title',
                    description: 'Test Description',
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
