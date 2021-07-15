import 'package:flab/drawer/routes/Routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createHeader(context), //Fixed header
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                //_createHeader(context),// to scroll header
                _createDrawerItem(
                    icon: Icons.contacts,
                    text: 'Contacts',
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, Routes.contacts)),
                _createDrawerItem(
                    icon: Icons.event,
                    text: 'Events',
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, Routes.events)),
                _createDrawerItem(
                    icon: Icons.note,
                    text: 'Notes',
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, Routes.notes)),
                Divider(),
                _createDrawerItem(icon: Icons.collections_bookmark, text: 'Steps'),
                _createDrawerItem(icon: Icons.face, text: 'Authors'),
                _createDrawerItem(
                    icon: Icons.account_box, text: 'Flutter Documentation'),
                _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
                Divider(),
                _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
              ],
            ),
          ),
          ConstrainedBox(
          constraints: BoxConstraints(minHeight: 80),
          child: Text('      Footer \nVersion: 0.0.1'))
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    // return DrawerHeader(
    //     margin: EdgeInsets.zero,
    //     padding: EdgeInsets.zero,
    //     decoration: BoxDecoration(
    //         image: DecorationImage(
    //             fit: BoxFit.fill,
    //             image: AssetImage('assets/drawer_header_background.png'))),
    //     child: Stack(children: <Widget>[
    //       Positioned(
    //           bottom: 12.0,
    //           left: 16.0,
    //           child: Text("Drawer Header",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 20.0,
    //                   fontWeight: FontWeight.w500))),
    //     ]));

       return  UserAccountsDrawerHeader(
            accountName: Text("Subramanyam Balaraju"),
            accountEmail: Text("subbu.balaraju@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.blue
                      : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
