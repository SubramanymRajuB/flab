import 'package:flab/state_mngmnt/bloc/simple/simple_cubit_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_demo.dart';
import 'counter_bloc.dart';

class SimpleBLocDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Bloc Demo"),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) => const <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                child: Text('Cubit Demo'),
                value: 'cubit',
              ),
              PopupMenuItem<String>(
                child: Text('Weather Demo'),
                value: 'weather',
              ),
            ],
            onSelected: (value) {
              if (value == "cubit") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SimpleCubitDemo()));
              }
              if (value == "weather") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlocDemo()));
              }
            },
          )
        ],
      ),
      body: BlocProvider(
          create: (BuildContext context) => CounterBloc(0),
          child: CounterScreen()),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, int state) {
              return Text(
                "Counte Value : $state",
                style: TextStyle(fontSize: 30),
              );
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("increment"),
                onPressed: () {
                  _counterBloc.add(Increment());
                },
              ),
              ElevatedButton(
                child: Text("decrement"),
                onPressed: () {
                  _counterBloc.add(Decrement());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
