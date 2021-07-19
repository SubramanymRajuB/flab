import 'package:flab/views/drawer_menu.dart';
import 'package:flab/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'model/app_state.dart';

const kAppTitle = 'State by Redux';
Store<AppState> _store;

class ReduxDemo extends StatelessWidget {
  ReduxDemo(Store<AppState> store){
      if(store!=null){
        _store=store;
      }
  }
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
        home: ReduxDemoPage(),routes: {
          '/redux_demo': (context) => ReduxDemo(null),
          '/settings': (context) => Settings(),
        }
      ),
    );
  }
}

class ReduxDemoPage extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Colors.teal,
          actions : [IconButton(
          icon: Icon(Icons.cancel, color: Colors.white70,),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop(context);
          }
        )]
      ),
      drawer: DrawerMenu(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: state.viewFontSize,
                  color: Colors.black,
                  fontWeight: state.bold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: state.italic ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}