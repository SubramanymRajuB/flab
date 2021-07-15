import 'package:flab/drawer/widget/drawer.dart';
import 'package:flutter/material.dart';


class NotesPage extends StatelessWidget {

  static const String routeName = '/notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Notes"),
            ),
        drawer: AppDrawer(),
        body: Center(
            child: Text("Notes")
        )
    );
  }

}