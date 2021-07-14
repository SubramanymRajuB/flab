import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'client_model.dart';
import 'database_stream.dart';

class SQLiteStreamDemo extends StatefulWidget {
  @override
  _SQLiteStreamDemoState createState() => _SQLiteStreamDemoState();
}

class _SQLiteStreamDemoState extends State<SQLiteStreamDemo> {
  // data for testing
  List<Client> testClients = [
    Client(firstName: "Subramanyam", lastName: "Balaraju", blocked: false),
    Client(firstName: "Yogith", lastName: "Varma", blocked: true),
    Client(firstName: "Sudheer", lastName: "Raju", blocked: false),
  ];

  final stream = ClientsStream();

  @override
  void dispose() {
    stream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter SQLite")),
      body: StreamBuilder<List<Client>>(
        stream: stream.clients,
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    stream.delete(item.id);
                  },
                  child: ListTile(
                    title: Text(item.lastName),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool value) {
                        stream.blockUnblock(item);
                      },
                      value: item.blocked,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Client rnd = testClients[math.Random().nextInt(testClients.length)];
          stream.add(rnd);
        },
      ),
    );
  }
}
