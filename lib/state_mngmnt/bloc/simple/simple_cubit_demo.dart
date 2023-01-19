import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_demo.dart';
import 'counter_cubit.dart';

class SimpleCubitDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Cubit Demo"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BlocDemo()));
            },
          )
        ],
      ),
      body: BlocProvider(
          create: (BuildContext context) => CounterCubit(),
          child: CounterCubitScreen()),
    );
  }
}

class CounterCubitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final _counterBloc = BlocProvider.of<CounterCubit>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterCubit, int>(
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
                  context.read<CounterCubit>().increment();
                },
              ),
              ElevatedButton(
                child: Text("decrement"),
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
