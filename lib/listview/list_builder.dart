import 'package:flutter/material.dart';

class ListBuilder extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100]; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Builder and selection'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          )
        ),
        body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            ),
            onTap: (){
              AlertDialog alert = AlertDialog(  
                  title: Text("Selected: "),  
                  content: Text("${entries[index]}")
                );  

                showDialog(  
                  context: context,  
                  builder: (BuildContext context) {  
                    return alert;  
                  },  
                );  
            },
          );
        }
      )
    )
    );
  }
}