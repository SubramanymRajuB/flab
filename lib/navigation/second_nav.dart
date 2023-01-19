import 'package:flutter/material.dart';

import 'first_nav.dart';

// ignore: must_be_immutable
class SecondRoute extends StatelessWidget {
  // Declare a field that holds the Todo.
  Todo todo;
  bool isHero;

  SecondRoute({Key key, this.todo, this.isHero = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (todo == null) {
      todo = ModalRoute.of(context).settings.arguments as Todo;
    }
    if (todo == null) {
      if (isHero) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Hero(
                tag: 'imageHero',
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                ),
              ),
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Close the screen and return "Yep!" as the result.
                    Navigator.pop(context, 'Yep!');
                  },
                  child: Text('Yep!'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Close the screen and return "Nope." as the result.
                    Navigator.pop(context, 'Nope.');
                  },
                  child: Text('Nope.'),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(todo.description),
        ),
      );
    }
  }
}
