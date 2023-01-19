import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text('Empty ListView'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white70,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          )),
      body: entries.isNotEmpty
          ? ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item ${index + 1}'),
                  leading: Text('left ${index + 1}'),
                  trailing: Text('rgiht ${index + 1}'),
                );
              },
            )
          : const Center(child: Text('No items')),
    ));
  }
}
