import 'package:flutter/material.dart';

import 'second_nav.dart';

class NavigarionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // on the FirstScreen widget.
      initialRoute: '/first_nav',
     routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/first_nav': (context) => FirstRoute(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second_nav': (context) => SecondRoute(),
      },
      
    );
  }
}

class FirstRoute extends StatelessWidget {
  final List<Todo> todos = List.generate(
        20,
        (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i',
          )
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Demo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          )
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Navigation Methods to Second Screen'),
              onPressed: () async {

                // Navigator.push returns a Future that completes after calling
                // Navigator.pop on the Selection Screen.
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );

                // After the second Screen returns a result, hide any previous snackbars
                // and show the new result.
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$result')));

                // Navigate to the second screen using a named route.
                  //Navigator.pushNamed(context, '/second_nav');
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Named route with extracts arguments'),
              onPressed: () async {

                     //When the user taps the button,
                    // navigate to a named route and
                    // provide the arguments as an optional
                    // parameter.
                    Navigator.pushNamed(
                      context,
                      '/second_nav',
                      arguments: Todo(
                        'Extract Arguments Screen',
                        'This message is extracted in the build method.',
                      ),
                    );
              },
            )
          ],
        ),
      ),

    //Pass Date to Second Screen using Navigator.push
    // body: ListView.builder(
    //     itemCount: todos.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         title: Text(todos[index].title),
    //         // When a user taps the ListTile, navigate to the DetailScreen.
    //         // Notice that you're not only creating a DetailScreen, you're
    //         // also passing the current todo through to it.
    //         onTap: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => SecondRoute(todo: todos[index]),//Pass the arguments as part of the RouteSettings. The
    //             //DetailScreen reads the arguments from these settings.
    //               // settings: RouteSettings(
    //               //   arguments: todos[index],
    //               // ),

    //             ),
    //           );

    //                         },
    //       );
    //     },
    //   )
     );
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}