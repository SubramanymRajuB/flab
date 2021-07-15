import 'package:flab/drawer/routes/Routes.dart';
import 'package:flutter/material.dart';

import 'injection/dependency_injection.dart';
import 'models/contacts/contact_list_view.dart';
import 'models/events/event_list_view.dart';
import 'models/notes/note_list_view.dart';

class DrawerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Injector.configure(Flavor.MOCK);
    
    return new MaterialApp(
      title: 'Drawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: ContactsPage(),
      routes:  {
        Routes.contacts: (context) => ContactsPage(),
        Routes.events: (context) => EventsPage(),
        Routes.notes: (context) => NotesPage(),
      },
      debugShowCheckedModeBanner: true,
    );
  }
}