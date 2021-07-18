import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class SimpleBLocDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Bloc Demo"),
        ),
        body: BlocProvider(
          create: (BuildContext context) => CounterBloc(0),
          child : CounterScreen()

        ),
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
            builder: (BuildContext context, int state){
              return Text("Counte Value : $state", style: TextStyle(fontSize: 30),);
            },
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("increment"),
                onPressed: (){
                  _counterBloc.add(CounterEvents.increment);
                },
              ),

              ElevatedButton(
                child: Text("decrement"),
                onPressed: (){
                  _counterBloc.add(CounterEvents.decrement);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}