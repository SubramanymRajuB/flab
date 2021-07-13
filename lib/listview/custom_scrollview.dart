import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100]; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView is basically a CustomScrollView'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          )
        ),
        body: 
        CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  const Text("I'm dedicating every day to you"),
                  const Text('Domestic life was never quite my style'),
                  const Text('When you smile, you knock me out, I fall apart'),
                  const Text('And I thought I was so smart'),
                ],
              ),
            ),
          ),
        ],
      )

        // ListView(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.all(20.0),
        //   children: const <Widget>[
        //     Text("I'm dedicating every day to you"),
        //     Text('Domestic life was never quite my style'),
        //     Text('When you smile, you knock me out, I fall apart'),
        //     Text('And I thought I was so smart'),
        //   ],
        // )
    )
    );
  }
}