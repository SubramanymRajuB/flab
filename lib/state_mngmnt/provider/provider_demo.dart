import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_notifier_todo.dart';

class ProviderDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ChangeNotifierTodo(),
        child: ProviderDemoPage(),
      ),

      debugShowCheckedModeBanner: false,

    );
  }
}

class ProviderDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider =Provider.of<ChangeNotifierTodo>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Provider Demo", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          ),
      ),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),

              Text("02 : 36 PM", style: TextStyle(color: Colors.white70, fontSize: 45, fontWeight: FontWeight.bold),),

              Text("current time", style: TextStyle(color: Colors.white, fontSize: 16,),),

              SizedBox(height: 20,)

            ],
          ), //to show the clock

          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(60)), color: Colors.white),
              child: Consumer<ChangeNotifierTodo>(
                builder: (context, changeNotifierTodo, child){
                  return ListView.builder(
                      itemCount: changeNotifierTodo.taskList.length,
                      itemBuilder: (context, index){
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                            title: Text(changeNotifierTodo.taskList[index].title, style : TextStyle(color: Colors.black87,
                                fontWeight: FontWeight.bold),),
                            subtitle: Text(changeNotifierTodo.taskList[index].detail, style: TextStyle(color: Colors.black45,
                                fontWeight: FontWeight.bold),),

                            trailing: Icon(Icons.check_circle, color: Colors.greenAccent,),
                          ),
                          margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                        );
                      }
                  );
                },
              )


            ),
          )

        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
            provider.addTaskInList();
        },
      ),

    );
  }
}