import 'package:flutter/material.dart';

import 'first_nav.dart';

class SecondRoute extends StatelessWidget {

  // Declare a field that holds the Todo.
  Todo todo;
  // Use the Todo to create the UI.
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.

  // In the constructor, require a Todo.
  SecondRoute({Key key,  this.todo}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

  if(todo == null){
    todo = ModalRoute.of(context).settings.arguments as Todo;
  }
  if(todo == null){
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
  }else{
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