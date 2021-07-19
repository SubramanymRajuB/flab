import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'counter.dart';

class MobXDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MobXPage(title: 'MobX Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MobXPage extends StatefulWidget {
  MobXPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MobXPageState createState() => _MobXPageState();
}

class _MobXPageState extends State<MobXPage> {
  //ClassWihtoutStore _counterWihtoutStore = new ClassWihtoutStore();
  CounterStore _counter = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (context){
                return Text(
                  //'${_counterWihtoutStore.counter.value}',
                  '${_counter.counter}',
                  style: Theme.of(context).textTheme.headline1,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //_counterWihtoutStore.increment.call();
          _counter.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}